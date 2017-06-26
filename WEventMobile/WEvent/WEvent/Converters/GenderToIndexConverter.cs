using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace WEvent
{
    public class GenderToIndexConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            Gender gender = (Gender)value;
            if(targetType != typeof(int))
                throw new Exception("GenderConverter.Convert expected integer targetType.");
            return (int)gender;
        }

        //incase Binding mode set to TwoWay binding
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            int index = (int)value;
            if (targetType != typeof(Gender))
                throw new Exception("GenderConverter.ConvertBack expected Gender targetType");
            return (Gender)index;
        }
    }
}
