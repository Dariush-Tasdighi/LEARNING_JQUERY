$(document).ready(function () {
	$("table.data tr:odd").addClass("odd");
	$("table.data tr:even").addClass("even");

	$("table.data tr").bind("click", toggleHighlighting);
	$("table.data tr").bind("mouseover mouseleave", toggleHighlight);
})

function toggleHighlight(eventArgs) {
	$(this).toggleClass("highlighted");
}

function toggleHighlighting(eventArgs) {
	$(this).toggleClass("hasBeenRead");

	var blnMouseOverBindToThis = false;

	// دستور ذيل، روی تمام رخدادهای بايند شده، لوپ می زند
	$.each($(this).data("events"), function (i, event) {
		if (i == "mouseover") {
			alert("Hello");
			blnMouseOverBindToThis = true;
		}
	});

	if (blnMouseOverBindToThis) {
		$(this).unbind("mouseover mouseleave", toggleHighlight);
	}
	else {
		$(this).bind("mouseover mouseleave", toggleHighlight);
	}
}
