<%@ page language="C#" codefile="Learn03.aspx.cs" inherits="Ajax_Learn03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>
			Learning jQuery Ajax
		</title>

		<script src="../Scripts/jquery-2.2.1.min.js"></script>

		<script>

			$(document).ready(function () {
				$("img#imgLoading").hide();

				$("input#btnSubmit").click(btnSubmit_Click);
			})

			function btnSubmit_Click(e) {
				ajaxBegin();

				$.ajax({
					data: "{}",
					type: "POST",
					dataType: "json",
					url: "Learn03.aspx/GetDate",
					contentType: "application/json; charset=utf-8",

					error: ajaxError,
					success: ajaxSucceeded
				});
			}

			function ajaxBegin() {
				$("img#imgLoading").show();
				$("input#btnSubmit").attr("disabled", "disabled");
			}

			function ajaxSucceeded(e) {
				$("div#divMessage").text(e.d);

				ajaxEnd();
			}

			function ajaxError(e) {
				$("div#divMessage").text(e.status + ' - ' + e.statusText);

				ajaxEnd();
			}

			function ajaxEnd() {
				$("img#imgLoading").hide();
				$("input#btnSubmit").removeAttr("disabled");
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

			<img id="imgLoading" src="../Images/Loading.gif"
				alt="Loading..." title="Loading..." />
		</form>
	</body>
</html>