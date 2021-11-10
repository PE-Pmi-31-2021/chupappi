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
            var userGenerator = new UserGenerator();
            for (int i = 0; i < 30; i++)
            {
                user.InsertOne(userGenerator.Generate());
            }
        }
    }
}