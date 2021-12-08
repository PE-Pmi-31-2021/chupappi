using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using MongoDB.Driver;
using OxyPlot;
using OxyPlot.Axes;
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
            try
            {
                InitializeComponent();
                log4net.Config.XmlConfigurator.Configure();

                /*var user = App.Db.GetCollection<User>("users");
                var topics = App.Db.GetCollection<Topic>("topics");
                var cryptoHistories = App.Db.GetCollection<HistoryPrice>("history_prices");
                var seenHistories = App.Db.GetCollection<SeenHistory>("seen_histories");*/
                var cryptos = App.Db.GetCollection<Crypto>("cryptos");
                var collection = ReadCollection(cryptos);

                var lpg = new LinepointsGenerator();
                var rng = new Random();
                for (var i = 1; i < 4; i++)
                {
                    for (var j = 0; j < 3; j++)
                    {
                        var border = new Border
                        {
                            CornerRadius = new CornerRadius(15),
                            Width = 310,
                            Height = 155,
                            BorderThickness = new Thickness(1),
                            Background = new SolidColorBrush(Colors.White)
                        };

                        var dynamicLabel1 = new OxyPlot.Wpf.PlotView {Model = new PlotModel()};

                        var plotModel = new PlotModel
                        {
                            Title = collection[((i - 1) * 3) + j].Name,
                            PlotType = PlotType.Cartesian,
                            Background = OxyColors.White,
                            TitlePadding = 0,
                            TitleFontSize = 24
                        };
                        var items = lpg.linepointsGenerator(rng.Next(0, 10000));
                        var max = items.Max(point => point.X);
                        var min = items.Min(point => point.X);
                        var timeSPanAxis1 = new DateTimeAxis()
                        {
                            Position = AxisPosition.Bottom,
                            TicklineColor = OxyColor.FromRgb(255, 255, 255),
                            IntervalLength = 75,
                            MinorIntervalType = DateTimeIntervalType.Days,
                            IntervalType = DateTimeIntervalType.Days,
                            Maximum = max,
                            Minimum = min
                        };
                        plotModel.Axes.Add(timeSPanAxis1);
                        max = items.Max(point => point.Y);
                        min = items.Min(point => point.Y);
                        LinearAxis linearAxis1 = new LinearAxis()
                        {
                            TicklineColor = OxyColor.FromRgb(255, 255, 255),
                            Maximum = max,
                            Minimum = min
                        };
                        OxyColor color;
                        if (items[0].Y < items[items.Length - 1].Y)
                        {
                            color = OxyColors.Green;

                            border.BorderBrush = Brushes.LawnGreen;
                        }
                        else
                        {
                            color = OxyColors.Red;

                            border.BorderBrush = Brushes.DarkRed;
                        }

                        var series = new LineSeries
                        {
                            Color = color,
                            DataFieldX = "X",
                            ItemsSource = items
                        };

                        plotModel.Axes.Add(linearAxis1);
                        plotModel.Series.Add(series);
                        plotModel.PlotAreaBorderColor = OxyColors.Transparent;
                        dynamicLabel1.Model = plotModel;
                        plotModel.MouseDown += (s, e) =>
                        {
                            if (e.ChangedButton != OxyMouseButton.Left) return;
                            e.Handled = true;
                            App.Log.Info(plotModel.Title);
                        };

                        dynamicLabel1.Name = "NewLabel";
                        dynamicLabel1.Width = 300;
                        dynamicLabel1.Height = 145;
                        dynamicLabel1.Foreground = new SolidColorBrush(Colors.Black);
                        dynamicLabel1.Background = new SolidColorBrush(Colors.White);
                        dynamicLabel1.BorderThickness = new Thickness(0);

                        border.Child = dynamicLabel1;
                        Grid.SetRow(border, i);
                        Grid.SetColumn(border, j);
                        Grid.Children.Add(border);
                    }
                }
            }
            catch (Exception e)
            {
                App.Log.Debug(e);
            }
        }
    }
}