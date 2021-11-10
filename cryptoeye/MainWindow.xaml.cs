namespace cryptoeye
{
    /// <summary>
    ///     Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public MainWindow()
        {
            InitializeComponent();

            var user = App.Db.GetCollection<User>("user");
            user.InsertOne(new User
            {
                Username = "karrtopelka", Email = "karrtopelka@gmail.com", Name = "Max", LastName = "Karrtopelka",
                Password = Hashing.HashPassword("password")
            });
        }
    }
}