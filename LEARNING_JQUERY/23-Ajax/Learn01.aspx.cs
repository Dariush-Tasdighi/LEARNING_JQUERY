public partial class Ajax_Learn01 : System.Web.UI.Page
{
	/// <summary>
	/// 1. public
	/// 2. static
	/// 3. System.Web.Services.WebMethod attribute
	/// </summary>
	[System.Web.Services.WebMethod]
	public static string GetDate()
	{
		// If Error Occured!
		//System.Threading.Thread.Sleep(5000);
		//throw (new System.Exception("Some Error"));

		// If Success
		System.Threading.Thread.Sleep(5000);
		return (System.DateTime.Now.ToString("yyyy/MM/dd - HH:mm:ss"));
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