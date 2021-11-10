using System;
using System.IO;
using System.Windows;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;

namespace cryptoeye
{
    /// <summary>
    ///     Interaction logic for App.xaml
    /// </summary>
    public partial class App
    {
        private static IConfiguration Configuration { get; set; }

        private static MongoClient Client { get; set; }

        public static IMongoDatabase Db { get; private set; }

        protected override void OnStartup(StartupEventArgs e)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", false, true);

            Configuration = builder.Build();

            Client = new MongoClient(Configuration.GetConnectionString("MongoDb"));
            Db = Client.GetDatabase("cryptoeye");
        }
    }
}