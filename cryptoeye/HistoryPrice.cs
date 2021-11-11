using System;

namespace cryptoeye
{
    public class HistoryPrice
    {
        public MongoDB.Bson.ObjectId CryptoId { get; set; }
        public double Price { get; set; }
        public DateTime Date { get; set; }       
    }
}