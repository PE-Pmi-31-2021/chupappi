namespace cryptoeye
{
    public class SeenHistory
    {
        public MongoDB.Bson.ObjectId _id { get; set; }
        public MongoDB.Bson.ObjectId UserId { get; set; }
        public string Name { set; get; }
        public string Location { set; get; }

        public override string ToString()
        {
            return $"{UserId}: {Location}/{Name}";
        }
    }
}