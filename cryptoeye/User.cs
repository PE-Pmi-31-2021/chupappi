namespace cryptoeye
{
    public class User
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public MongoDB.Bson.ObjectId[] FavoriteTopics { get; set; }
        public MongoDB.Bson.ObjectId[] FavoriteCryptos { get; set; }
    }
}