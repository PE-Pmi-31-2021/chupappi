namespace cryptoeye
{
    public class SeenHistory
    {
        public MongoDB.Bson.ObjectId UserId { get; set; }
        public string Name { set; get; }
        public string Location { set; get; }
    }
}