using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using MongoDB.Bson;
using MongoDB.Driver;

namespace cryptoeye
{
    /// <summary>
    ///     Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public List<T> readCollection<T>(IMongoCollection<T> collection, FilterDefinition<T> filter = null)
        {
            if (filter == null) filter = Builders<T>.Filter.Empty;
            return collection.Find(filter).ToList();
        }
        public MainWindow()
        {
            InitializeComponent();

            var user = App.Db.GetCollection<User>("users");
            var topics = App.Db.GetCollection<Topic>("topics");
            var cryptos = App.Db.GetCollection<Crypto>("cryptos");
            var cryptoHistories = App.Db.GetCollection<HistoryPrice>("history_prices");
            var seenHistories = App.Db.GetCollection<SeenHistory>("seen_histories");

            /*var collection = readCollection(seenHistories);
            
            foreach (var record in collection)
            {
                Console.WriteLine(record);
            }*/

        }
    }
}