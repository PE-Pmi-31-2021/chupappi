using System;

namespace cryptoeye
{
    public class Crypto
    {
        public MongoDB.Bson.ObjectId _id { get; set; }
        public string Name { get; set; }
        public string ApiId { get; set; }

        public override string ToString()
        {
            return $"{Name}: {ApiId}";
        }
    }
}