using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace cryptoeye
{
    /// <summary>
    ///     Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        
        private void TextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            SearchBox.Text = "";
            SearchBox.Foreground = Brushes.Black;
        }

        private void TextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (!(sender is TextBox textbox)) return;
            if (string.IsNullOrEmpty(textbox.Text))
            {
                SearchBox.Text = "Search...";
                SearchBox.Foreground = (Brush)(new BrushConverter().ConvertFrom("#828282"));
            }
        }
    }
}