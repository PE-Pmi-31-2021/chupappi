using System;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using log4net;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using OxyPlot;

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

        public static readonly ILog Log = LogManager.GetLogger(typeof(App));

        protected override void OnStartup(StartupEventArgs e)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", false, true);

            Configuration = builder.Build();

            Client = new MongoClient(Configuration.GetConnectionString("MongoDb"));
            Db = Client.GetDatabase("cryptoeye");
            log4net.Config.XmlConfigurator.Configure();
            Log.Info("        =============  Started Logging  =============        ");
            EventManager.RegisterClassHandler(typeof(TextBox),
                TextBox.KeyUpEvent,
                new System.Windows.Input.KeyEventHandler(TextBox_KeyUp));
            base.OnStartup(e);
        }
        private void TextBox_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key != System.Windows.Input.Key.Enter) return;
            e.Handled = true;
            Log.Info($"crypto:{sender.ToString().Split(':')[1]}");
        }
        
        public void Plott_MouseDown(object sender, OxyMouseDownEventArgs e)
        {
            
        }
    }
}