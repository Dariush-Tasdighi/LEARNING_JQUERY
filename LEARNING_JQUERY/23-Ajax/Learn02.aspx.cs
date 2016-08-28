public partial class Ajax_Learn02 : System.Web.UI.Page
{
	[System.Web.Services.WebMethod]
	public static string GetDate()
	{
		System.Threading.Thread.Sleep(5000);

		//return("Hello, World!");

		throw (new System.Exception("Error!"));
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