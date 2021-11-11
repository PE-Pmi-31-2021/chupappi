using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Driver;

namespace cryptoeye
{
    /// <summary>
    ///     Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        // private static async Task<List<Topics>> GetAllTopics(IMongoCollection<Topics> topics)
        // {
        //     var ll = await topics.Find(_ => true).ToListAsync();
        //     return ll;
        // }

        public MainWindow()
        {
            InitializeComponent();

            var user = App.Db.GetCollection<User>("users");
            var topics = App.Db.GetCollection<Topic>("topics");
            var cryptos = App.Db.GetCollection<Crypto>("cryptos");
            var cryptoHistories = App.Db.GetCollection<HistoryPrice>("history_prices");
             for (var i = 0; i < 30; i++)
            {
                 cryptoHistories.InsertOne(HistoryPriceGenerator.Generate());
            }

            // var docs = GetAllTopics(topics);
            // docs.Wait();
            // Console.WriteLine("Fuck");
            // var res = docs.Result;
            // Console.WriteLine("Fuck here");
            // foreach (var doc in res)
            // {
            //     Console.WriteLine(doc.ToString());
            // }

        }
    }
}