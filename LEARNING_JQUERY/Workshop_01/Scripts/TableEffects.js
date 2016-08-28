$(document).ready(function () {
	$("table.data tr:nth-child(1)")
		.css("color", "#FFFFFF")
		.css("background-color", "#000000");

	$("table.data tr:not(table.data tr:nth-child(1)):nth-child(odd)").css("background-color", "#CCCCCC");
	$("table.data tr:not(table.data tr:nth-child(1)):nth-child(even)").css("background-color", "#FFFF99");
})
