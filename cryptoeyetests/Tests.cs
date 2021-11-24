using System;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Linq;
using cryptoeye;
using MongoDB.Bson;
using MongoDB.Driver;
using NUnit.Framework;

namespace cryptoeyetests
{
    public class StartMongo
    {
        public StartMongo()
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("../../../appsettings.json", false, true);

            App.Configuration = builder.Build();

            App.Client = new MongoClient(App.Configuration.GetConnectionString("MongoDb"));
            App.Db = App.Client.GetDatabase("cryptoeye");
        }
    }

    [TestFixture]
    public class Tests
    {
        private readonly User _expectedUser = new User
        {
            _id = new ObjectId("618c651305e268a873da6dd1"),
            Email = "berthekramer@gmail.com",
            Name = "Berthe",
            LastName = "Kramer",
            Password = "$2a$12$6sVb2CsgMXpZoJdwsrQDGuHii6PDVJLJJ6S4Z5Mm.v1awxEFAPTgy",
            FavoriteTopics = null,
            FavoriteCryptos = null
        };

        private readonly User _expectedUserUpdated = new User
        {
            _id = new ObjectId("618c651305e268a873da6dd1"),
            Email = "berthekramer@gmail.com",
            Name = "Berther",
            LastName = "Kramer",
            Password = "$2a$12$6sVb2CsgMXpZoJdwsrQDGuHii6PDVJLJJ6S4Z5Mm.v1awxEFAPTgy",
            FavoriteTopics = null,
            FavoriteCryptos = null
        };

        private readonly Crypto _expectedCrypto = new Crypto
        {
            _id = new ObjectId("618c69bb05e268a873e31c42"),
            Name = "AcidCoin",
            ApiId = "AcidCoin",
        };

        [Test]
        public void CheckEmail()
        {
            new StartMongo();
            var users = App.Db.GetCollection<User>("users");
            var userFind = MainWindow.ReadCollection(users).First();

            Assert.AreEqual(_expectedUser.Email, userFind.Email);
        }

        [Test]
        public void CheckHashedPasswordMatch()
        {
            new StartMongo();
            var users = App.Db.GetCollection<User>("users");
            var userFind = MainWindow.ReadCollection(users).First();
            
            var passwordsAreSame = Hashing.ValidatePassword(userFind.Password, "helloWorld123");

            Assert.AreEqual(true, passwordsAreSame);
        }

        [Test]
        public void CheckFilterOptions()
        {
            new StartMongo();
            var cryptos = App.Db.GetCollection<Crypto>("cryptos");
            var cryptoGotObj = MainWindow.ReadCollection(cryptos, Builders<Crypto>.Filter.Eq(x => x.Name, "AcidCoin"))
                .First();

            Assert.AreEqual(_expectedCrypto.ToJson(), cryptoGotObj.ToJson());
        }

        [Test]
        public void CheckUpdate()
        {
            new StartMongo();
            var users = App.Db.GetCollection<User>("users");
            var userUpdate = users.UpdateOne(Builders<User>.Filter.Eq((x) => x.Name, "Berthe"),
                Builders<User>.Update.Set(x => x.Name, "Berther"));

            Assert.AreEqual(_expectedUserUpdated.ToJson(), userUpdate.ToJson());
        }

        [Test]
        public void CheckDelete()
        {
            new StartMongo();
            var users = App.Db.GetCollection<User>("users");
            var userDelete = users.DeleteOne(Builders<User>.Filter.Eq(x => x.Email, "rannamiranda@gmail.com"));
            
            Assert.Null(userDelete?.ToJson());
        }
    }
}