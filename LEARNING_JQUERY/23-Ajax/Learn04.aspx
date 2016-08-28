<%@ page language="C#" codefile="Learn04.aspx.cs" inherits="Ajax_Learn04" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>
			Learning Ajax
		</title>

		<style>
			fieldset
			{
			}

			legend
			{
			}

			div.field
			{
				margin: 4px;
				padding: 4px;
			}

			div.buttons
			{
				margin: 4px;
				padding: 4px;
			}

			.error
			{
				color: Red;
				font-weight: bold;
			}
		</style>

		<script src="../Scripts/jquery-2.2.1.min.js"></script>

		<script>

			$(document).ready(function () {
				$("#imgLoading").hide();
				$("#spnUsername").hide();

				$("#txtUsername").keypress(function () {
					$("#spnUsername").hide();
				});

				$("#btnSubmit").click(btnSubmit_Click);
				$("#txtUsername").blur(txtUsername_Blur);
			})

			function btnSubmit_Click() {
				var blnCheckUsername = txtUsername_Blur();
			}

			function txtUsername_Blur() {
				var strUsername = $('#txtUsername').val();

				strUsername = $.trim(strUsername);
				$('#txtUsername').val(strUsername);

				if (strUsername == "") {
					$("#spnUsername").show();
					$("#spnUsername").addClass("error");
					$("#spnUsername").html("Username is required!");

					$("#txtUsername").focus();

					return (false);
				}

				ajaxBegin();

				var oData = "{'username':'" + strUsername + "'}";

				$.ajax({
					data: oData,
					type: "POST",
					dataType: "json",
					url: "Learn04.aspx/CheckUsername",
					contentType: "application/json; charset=utf-8",

					error: ajaxError,
					success: ajaxSucceeded
				});
			}

			function ajaxBegin() {
				$("#spnUsername").hide();
				$("#spnUsername").html("");

				$("#imgLoading").show();

				$(":input").attr("disabled", "disabled");
			}

			function ajaxSucceeded(result) {
				if (result.d == "") {
					$("#spnUsername").hide();
					$("#spnUsername").html("");
				}
				else {
					$("#spnUsername").html(result.d);
					$("#spnUsername").show();

					$("#txtUsername").focus();
				}

				ajaxEnd();
			}

			function ajaxError(result) {
				var strMessage =
					result.status + ' ' + result.statusText;

				$("#spnUsername").show();
				$("#spnUsername").addClass("error");
				$("#spnUsername").html(strMessage);

				ajaxEnd();
			}

			function ajaxEnd() {
				$("#imgLoading").hide();

				$(":input").removeAttr("disabled");
			}
		</script>
	</head>
	<body>
		<form id="frmMain" runat="server">

			<fieldset>
				<legend>
					Registration
				</legend>

				<div class="field">
					<input type="text" id="txtUsername" maxlength="20" />
					<img id="imgLoading" src="../Images/Loading.gif"
						alt="Loading..." title="Loading..." />
					<span id="spnUsername"></span>
				</div>

				<div class="buttons">
					<input type="reset" id="btnReset" value="(R)eset"
						accesskey="R" />
					<input type="button" id="btnSubmit" value="(S)ubmit"
						accesskey="S" />
				</div>

			</fieldset>

		</form>
	</body>
</html>