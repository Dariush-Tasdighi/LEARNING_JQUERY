var varDivSubMenuTopMargin = 2;
var varTheLastSubMenu = $("<div>");
var varDivSubMenu = $("<div id='subMenu'></div>");

function CloseSubMenu() {
	$(varDivSubMenu).text("");
	$(varDivSubMenu).fadeOut(100);
}

function CloseSubMenuInFast() {
	$(varDivSubMenu).text("");
	$(varDivSubMenu).hide();
}

function Debug(text) {
	$("textarea#txtDebug").val(text);
}

function CheckMousePointerInBox(e, left, top, width, height) {
	if ((e.pageX >= left) && (e.pageX <= left + width) &&
		(e.pageY >= top) && (e.pageY <= top + height)) {
		return (true);
	}
	else {
		return (false);
	}
}

$(function () {

	// *****
	$(varDivSubMenu).hide();

	$(varDivSubMenu).mouseleave(function (e) {
		var varWidth = $(varTheLastSubMenu).width();
		var varHeight = $(varTheLastSubMenu).height();

		var varTop = $(varTheLastSubMenu).offset().top;
		var varLeft = $(varTheLastSubMenu).offset().left;

		var blnCheckMousePointerInBox =
			CheckMousePointerInBox(e, varLeft, varTop, varWidth, varHeight);

		if (blnCheckMousePointerInBox == false) {
			CloseSubMenuInFast();
			varTheLastSubMenu = $("<div>");
		}
	})

	$("body").append(varDivSubMenu);
	// *****

	$("ul.navigation li ul").hide();

	$("ul.navigation li").each(function () {
		$(this).mouseenter(function () {

			if ($(this).is($(varTheLastSubMenu))) {
				Debug("1");
				return;
			}
			else {
				Debug("2");
				CloseSubMenuInFast();
				varTheLastSubMenu = $(this);
			}

			if ($(this).has("ul").length == 0) {
				Debug("3");
				CloseSubMenuInFast();
				return;
			}

			// *****
			var varListIndex = $(this).find("ul").find("li");

			var varMenuItems = $("<div></div>");

			varListIndex.each(function () {
				var varMenuItem =
					"<div class='dynamic'>" + $(this).html() + "</div>";

				varMenuItems.append(varMenuItem);

				Debug(varMenuItems.html());
			})
			// *****

			var varWidth = $(this).width();
			var varHeight = $(this).height();

			var varTop = $(this).offset().top;
			var varLeft = $(this).offset().left;

			var varDivSubMenuWidth = $(varDivSubMenu).width();

			var varDivSubMenuTop = varTop + varHeight + varDivSubMenuTopMargin;
			var varDivSubMenuLeft = varLeft - (varDivSubMenuWidth - varWidth);

			varDivSubMenu
				.css("top", varDivSubMenuTop)
				.css("left", varDivSubMenuLeft)
			;

			$(varDivSubMenu).text("");
			$(varDivSubMenu).fadeIn(200);
			$(varDivSubMenu).append(varMenuItems);
		})

		$(this).mouseleave(function (e) {
			var varWidth = $(varDivSubMenu).width();
			var varHeight = $(varDivSubMenu).height();

			var varTop = $(varDivSubMenu).offset().top - varDivSubMenuTopMargin;
			var varLeft = $(varDivSubMenu).offset().left;

			var blnCheckMousePointerInBox =
				CheckMousePointerInBox(e, varLeft, varTop, varWidth, varHeight);

			if (blnCheckMousePointerInBox == false) {
				CloseSubMenu();
				varTheLastSubMenu = $("<div>");
			}
		})
	})
})
