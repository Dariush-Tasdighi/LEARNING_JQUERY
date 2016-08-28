<%@ page language="C#" autoeventwireup="true"
	codefile="MixWithAjax.aspx.cs" inherits="Workshop_8_MixWithAjax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">

		<title>
		</title>

		<script src="Scripts/jquery-1.8.3.js" type="text/javascript"></script>

		<script src="Scripts/jquery-ui-1.9.2.custom.min.js"
			type="text/javascript"></script>

		<link href="Content/sunny/jquery-ui-1.9.2.custom.min.css"
			rel="stylesheet" type="text/css" />

		<style>
			.ui-dialog-titlebar-close
			{
				display: none;
			}
		</style>

		<script>

			$(document).ready(function () {
				$('div#dialog').dialog({
					modal: true,
					autoOpen: false,
					width: 400,
				});

				$("input#btnSubmit").click(btnSubmit_Click);
			})

			function btnSubmit_Click() {
				$('#dialog').dialog('open');

				$.ajax({
					data: "{}",
					type: "POST",
					dataType: "json",
					url: "MixWithAjax.aspx/GetDate",
					contentType: "application/json; charset=utf-8",

					error: ajaxError,
					success: ajaxSucceeded
				});
			}

			function ajaxSucceeded(e) {
				$("div#divMessage").text(e.d);

				$('#dialog').dialog('close');
			}

			function ajaxError(e) {
				$("div#divMessage").text(e.status + ' - ' + e.statusText);

				$('#dialog').dialog('close');
			}
		</script>

	</head>
	<body>
		<form id="frmMain" runat="server">

			<div id="divMessage">
			</div>

			<br />
			<input type="button" id="btnSubmit" value="Submit"
				accesskey="S" />

			<div id="dialog">
				<asp:image id="imgLoading" runat="server" imagealign="AbsMiddle" imageurl="~/Workshop_8/Images/Loading.gif" />
				Loading... Please Wait!
			</div>

		</form>
	</body>
</html>

