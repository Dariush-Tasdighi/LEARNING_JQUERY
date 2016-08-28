<%@ page language="C#" codefile="Learn01.aspx.cs" inherits="Ajax_Learn01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">

		<title>
			Learning jQuery Ajax
		</title>

		<script src="../Scripts/jquery-2.2.1.min.js"></script>

		<script>

			$(document).ready(function () {
				$("input#btnSubmit").click(function () {
					$.ajax({
						data: "{}",
						type: "POST",
						dataType: "json",
						url: "Learn01.aspx/GetDate",
						contentType: "application/json; charset=utf-8",

						success: function (e) {
							$("div#divMessage").text(e.d);
						},

						error: function (e) {
							$("div#divMessage").text("Error!");
						}
					});
				});
			})

		</script>

	</head>
	<body>
		<form id="frmMain" runat="server">

			<div id="divMessage">
			</div>

			<br />

			<input type="button" id="btnSubmit" value="Submit"
				accesskey="S" />
		</form>
	</body>
</html>