//http://stackoverflow.com/questions/37684/how-to-replace-plain-urls-with-links
function replaceURLWithHTMLLinks(text) {
    var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
    return text.replace(exp,"<a href='$1'>$1</a>"); 
}

$(function() {
	setInterval(function() {
		window.location.reload();
	}, 60000);
	$("td:contains('http')").each(function() {
		var txt = $(this).html();
		var replaced = replaceURLWithHTMLLinks(txt);
		$(this).html(replaced);
	});

	$("td:contains('@')").each(function() {
		var txt = $(this).html();
		$(this).html(txt.replace(/@([A-Za-z0-9]+)/g, '<a href="https://twitter.com/$1">@$1</a>'));
	});

	$("td:contains('#')").each(function() {
		var txt = $(this).html();
		$(this).html(txt.replace(/#([A-Za-z0-9]+)/g, '<a href="https://twitter.com/search?q=%23$1">$1</a>'));
	});
});
