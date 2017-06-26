﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XamarinUniversity.Infrastructure;
using XamarinUniversity.Interfaces;
using XamarinUniversity;
using System.Threading;
using MyDiary.Services;

namespace MyDiary.ViewModels
{
    /// <summary>
    /// Primary ViewModel for the app which drives the main display.
    /// </summary>
    public class MainViewModel : SimpleViewModel
    {
        /// <summary>
        /// List of Diary Entries displayed to the user.
        /// </summary>
        public IList<DiaryEntryViewModel> Entries { get { return deEntries; } }

        /// <summary>
        /// Command to Add new DiaryEntry
        /// </summary>
        public IAsyncDelegateCommand AddEntry { get; private set; }

        /// <summary>
        /// Command to Delete an existing DiaryEntry
        /// </summary>
        public IAsyncDelegateCommand DeleteEntry { get; private set; }

        /// <summary>
        /// Command to save changes to a DiaryEntry
        /// </summary>
        public IAsyncDelegateCommand SaveEntry { get; private set; }

        /// <summary>
        /// Command to refresh our display of DiaryEntries from the DB.
        /// </summary>
        public IAsyncDelegateCommand Refresh { get; private set; }

        /// <summary>
        /// Command to select a specific DiaryEntry and display the details.
        /// </summary>
        public IAsyncDelegateCommand SelectEntry { get; private set; }

        // Lab3: add Logout command
        /// <summary>
        /// Command to Log out of Azure and force a full login event
        /// </summary>
        public IAsyncDelegateCommand Logout { get; private set; }

        /// <summary>
        /// Busy flag - this is set if our app is loading data from the 
        /// Azure web service; it should cause the UI to display some sort
        /// of busy indicator.
        /// </summary>
        public bool IsBusy
        {
            get { return isBusy; }
            set { SetPropertyValue(ref isBusy, value); }
        }

        /// <summary>
        /// The currently selected DiaryEntry shown to the user.
        /// </summary>
        public DiaryEntryViewModel SelectedEntry
        {
            get { return selectedEntry; }
            set
            {
                if (SetPropertyValue(ref selectedEntry, value))
                {
                    if (selectedEntryObserver != null)
                        selectedEntryObserver.Dispose();
                    if (value != null)
                    {
                        selectedEntryObserver = new PropertyObserver<DiaryEntryViewModel>(SelectedEntry)
                            .RegisterHandler(vm => vm.CanSave, vm => SaveEntry.RaiseCanExecuteChanged());
                    }
                    else
                        selectedEntryObserver = null;

                    SaveEntry.RaiseCanExecuteChanged();
                    DeleteEntry.RaiseCanExecuteChanged();
                }
            }
        }

        /// <summary>
        /// Constructor for the Main view model.
        /// </summary>
        /// <param name="serviceLocator"></param>
        public MainViewModel(IDependencyService serviceLocator)
        {
            this.serviceLocator = serviceLocator;
            diaryService = serviceLocator.Get<IDiaryService>();

            AddEntry = new AsyncDelegateCommand(OnAddEntryAsync);
            SaveEntry = new AsyncDelegateCommand(OnSaveEntryAsync, () => SelectedEntry == null ? false : SelectedEntry.CanSave);
            DeleteEntry = new AsyncDelegateCommand<DiaryEntryViewModel>(OnDeleteEntryAsync, de => de != null || (SelectedEntry != null && !SelectedEntry.IsNew));
            Refresh = new AsyncDelegateCommand(() => deEntries.RefreshAsync());
            SelectEntry = new AsyncDelegateCommand(() => serviceLocator.Get<INavigationService>().NavigateAsync(AppPage.Detail));

            // Lab3: Add logout command
            Logout = new AsyncDelegateCommand(OnClearAuthAsync);

            deEntries = new RefreshingCollection<DiaryEntryViewModel>(LoadDiaryEntriesAsync)
            {
                BeforeRefresh = c =>
                {
                    IsBusy = true;
                    return SelectedEntry;
                },

                AfterRefresh = (c, o) =>
                {
                    IsBusy = false;
                    SelectedEntry = (DiaryEntryViewModel)o;
                },

                RefreshFailed = (c, ex) =>
                {
                    IsBusy = false;

                    return serviceLocator.Get<IMessageVisualizerService>().ShowMessage(
                         "Are you connected?", ex.Flatten(), "OK");
                }
            };

            // Set the 1st entry as active.
            deEntries.RefreshAsync()
                .ContinueWith(tr =>
                {
                    SelectedEntry = deEntries.FirstOrDefault();
                },
                CancellationToken.None, TaskContinuationOptions.OnlyOnRanToCompletion, TaskScheduler.FromCurrentSynchronizationContext());
        }

        // Lab3: Add logout implementation
        /// <summary>
        /// This method is called to logoff and force a re-authentication.
        /// </summary>
        /// <returns></returns>
        private async Task OnClearAuthAsync()
        {
            await diaryService.LogoffAsync();
            await deEntries.RefreshAsync();
            SelectedEntry = deEntries.FirstOrDefault();
        }

        /// <summary>
        /// Deletes a DiaryEntry from the database and removes it from our collection.
        /// </summary>
        /// <param name="de"></param>
        /// <returns></returns>
        private async Task OnDeleteEntryAsync(DiaryEntryViewModel de)
        {
            // Can be invoked either through ActionBar button or ContextAction.
            if (de == null)
                de = SelectedEntry;
            if (de != null)
            {
                await diaryService.DeleteEntryAsync(SelectedEntry.Model);
                Entries.Remove(de);
                if (SelectedEntry == de)
                {
                    SelectedEntry = Entries.FirstOrDefault();
                }
            }
        }

        /// <summary>
        /// Creates a new DiaryEntry in the UI. Note that this does _not_ save
        /// the entry to the DB; that is done by the SaveCommand.
        /// </summary>
        /// <returns></returns>
        private async Task OnAddEntryAsync()
        {
            DiaryEntryViewModel vm = new DiaryEntryViewModel();
            SelectedEntry = vm;
            await serviceLocator.Get<INavigationService>().NavigateAsync(AppPage.Detail);
        }

        /// <summary>
        /// Saves or Adds a DiaryEntry to the DB.
        /// </summary>
        /// <returns></returns>
        private async Task OnSaveEntryAsync()
        {
            if (SelectedEntry != null && SelectedEntry.CanSave)
            {
                if (SelectedEntry.IsNew)
                {
                    var selEntry = SelectedEntry.Model;
                    await diaryService.AddEntryAsync(selEntry);
                    await deEntries.RefreshAsync();
                    SelectedEntry = Entries.FirstOrDefault(e => e.Model.Id == selEntry.Id);
                }
                else
                {
                    await diaryService.UpdateEntryAsync(SelectedEntry.Model);
                }

                // Saved/updated - turn off save flag.
                if (SelectedEntry != null)
                    SelectedEntry.CanSave = false;
            }
        }

        /// <summary>
        /// Used to load diary entries from the DB and turn them into DiaryEntryViewModels.
        /// </summary>
        /// <returns></returns>
        private async Task<IEnumerable<DiaryEntryViewModel>> LoadDiaryEntriesAsync()
        {
            var entries = await diaryService.GetEntriesAsync();
            return entries.Select(de => new DiaryEntryViewModel(de));
        }

        #region Private Data
        private bool isBusy;
        private DiaryEntryViewModel selectedEntry;
        private IDependencyService serviceLocator;
        private IDiaryService diaryService;
        private PropertyObserver<DiaryEntryViewModel> selectedEntryObserver;
        private RefreshingCollection<DiaryEntryViewModel> deEntries;
        #endregion
    }
}