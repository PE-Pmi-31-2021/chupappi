using System;

namespace cryptoeye
{
    public class HistoryPrice
    {
        public MongoDB.Bson.ObjectId _id { get; set; }
        public MongoDB.Bson.ObjectId CryptoId { get; set; }
        public double Price { get; set; }
        public DateTime Date { get; set; }

        public override string ToString()
        {
            return $"{CryptoId}: {Date} - {Price}";
        }
    }
}