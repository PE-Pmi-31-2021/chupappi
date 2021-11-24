namespace cryptoeye
{
    public class Topic
    {
        public MongoDB.Bson.ObjectId _id { get; set; }
        public string TopicName { get; set; }
        public string TopicLink { get; set; }

        public override string ToString()
        {
            return $"{TopicName}: {TopicLink}";
        }
    }
}