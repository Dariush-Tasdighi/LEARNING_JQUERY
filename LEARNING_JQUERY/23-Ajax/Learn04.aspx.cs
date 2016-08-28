public partial class Ajax_Learn04 : System.Web.UI.Page
{
	[System.Web.Services.WebMethod]
	public static string CheckUsername(string username)
	{
		System.Threading.Thread.Sleep(5000);

		if (username == null)
		{
			string strResult = "Username is required!";
			return (strResult);
		}

		username = username.Trim();
		if (username == string.Empty)
		{
			string strResult = "Username is required!";
			return (strResult);
		}

		if (string.Compare(username, "Dariush", true) == 0)
		{
			string strResult = "Username is already exists! Please choose another one...";
			return (strResult);
		}

		return(string.Empty);
	}

	protected void Page_Load(object sender, System.EventArgs e)
	{
		if (Page.IsPostBack == false)
		{
			Initialize();
		}
	}

	private void Initialize()
	{
	}
}