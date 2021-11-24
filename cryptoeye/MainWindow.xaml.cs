using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using MongoDB.Bson;
using MongoDB.Driver;
using OxyPlot;
using OxyPlot.Series;

namespace cryptoeye
{
    /// <summary>
    ///     Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        private static List<T> ReadCollection<T>(IMongoCollection<T> collection, FilterDefinition<T> filter = null)
        {
            if (filter == null) filter = Builders<T>.Filter.Empty;
            return collection.Find(filter).ToList();
        }
        
        public MainWindow()
        {
            InitializeComponent();

            /*var user = App.Db.GetCollection<User>("users");
            var topics = App.Db.GetCollection<Topic>("topics");
            var cryptos = App.Db.GetCollection<Crypto>("cryptos");
            var cryptoHistories = App.Db.GetCollection<HistoryPrice>("history_prices");
            var seenHistories = App.Db.GetCollection<SeenHistory>("seen_histories");

            var collection = ReadCollection(cryptoHistories, Builders<HistoryPrice>.Filter.Gt("Price", 4000));
            
            foreach (var record in collection)
            {
                Console.WriteLine(record);
            }*/
            Label.Content = "deinsid@gmail.com";

            for (int i = 1; i < 4; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    var border = new Border();

                    border.CornerRadius = new CornerRadius(20);
                    border.Width = 240;
                    border.Height = 140;
                    border.BorderThickness = new Thickness(1);
                    border.BorderBrush = Brushes.LawnGreen;
                    border.Background = new SolidColorBrush(Colors.White);
                    
                    var dynamicLabel1 = new OxyPlot.Wpf.PlotView();

                    dynamicLabel1.Model = new PlotModel();
                    var plotModel = new PlotModel
                    {
                        Title = "Trigonometric functions",
                        PlotType = PlotType.Cartesian,
                        Background = OxyColors.White
                    };
                    plotModel.Series.Add(new FunctionSeries(Math.Sin, -10, 10, 0.1, "sin(x)") { Color = OxyColors.Black });
                    plotModel.PlotAreaBorderColor = OxyColors.Transparent;
                    dynamicLabel1.Model = plotModel;

                    dynamicLabel1.Name = "NewLabel";
                    dynamicLabel1.Width = 225;
                    dynamicLabel1.Height = 125;
                    dynamicLabel1.Foreground = new SolidColorBrush(Colors.White);
                    dynamicLabel1.Background = new SolidColorBrush(Colors.White);
                    dynamicLabel1.BorderThickness = new Thickness(0);

                    border.Child = dynamicLabel1;
                    Grid.SetRow(border, i);
                    Grid.SetColumn(border, j);
                    Grid.Children.Add(border); 
                }
            }
            

        }
    }
}