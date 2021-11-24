using System;
using MongoDB.Bson;

namespace cryptoeye
{
    public class HistoryPriceGenerator
    {
        private static string[] cryptoIds =
        {
            "618c69bb05e268a873e31c42", "618c69bb05e268a873e31c5b", "618c69bb05e268a873e31c6b",
            "618c69bb05e268a873e31c86", "618c69bb05e268a873e31c94", "618c69bb05e268a873e31cbc",
            "618c69bb05e268a873e31cd0", "618c69bb05e268a873e31ce1", "618c69bb05e268a873e31cf8",
            "618c69bb05e268a873e31d0c", "618c69bb05e268a873e31d2f", "618c69bc05e268a873e31d41",
            "618c69bc05e268a873e31d5f", "618c69bc05e268a873e31d6c", "618c69bc05e268a873e31d88",
            "618c69bc05e268a873e31d95", "618c69bc05e268a873e31da7", "618c69bc05e268a873e31dc1",
            "618c69bc05e268a873e31dce", "618c69bc05e268a873e31ddf", "618c69bc05e268a873e31df3",
            "618c69bc05e268a873e31e1b", "618c69bc05e268a873e31e2a", "618c69bc05e268a873e31e60",
            "618c69bc05e268a873e31ea0", "618c69bc05e268a873e31eb5", "618c69bc05e268a873e31ec9",
            "618c69bc05e268a873e31ede", "618c69bc05e268a873e31f09"
        };
    
        private static DateTime dayGenerator(Random rnd)
        {
            DateTime start = new DateTime(2009, 1, 1);
            int range = (DateTime.Today - start).Days;           
            return start.AddDays(rnd.Next(range));
        }

        public static HistoryPrice Generate()
        {
            var rnd = new Random();
            var date = dayGenerator(rnd);
            var price = rnd.NextDouble()*rnd.Next(10000);
            var cryptoId = cryptoIds[rnd.Next(cryptoIds.Length)];
            
            return new HistoryPrice { Date = date, Price = price, CryptoId = new ObjectId(cryptoId)};
        }
    }
}