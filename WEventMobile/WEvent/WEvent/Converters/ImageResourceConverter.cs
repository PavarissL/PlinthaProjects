using System;
using System.Globalization;
using Xamarin.Forms;

namespace WEvent
{
    public class ImageResourceConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            //retunr image path+name
            return ImageSource.FromResource("WEvent.Images." + (value ?? ""));
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
