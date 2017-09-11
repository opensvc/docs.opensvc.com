(function (window, $, _) {
    // given "#hash-name-with.periods", escape so it's usable as CSS selector
    // (e.g. "#hash-name-with\\.periods")
    function escapeHash(hash) {
        return hash.replace(/\./g, "\\.");
    }

    $(function () {
        var hash = document.location.hash;
	var body = $("body")
	var levels = ["lvl1", "lvl2"]

	function init() {
		levels.forEach(function(lvl){
			var re = new RegExp("ulvl=u"+lvl, 'g')
			if (window.location.search.match(re)) {
				body.addClass("u"+lvl)
			}
			if (hash) {
				// make sure the section accessed by hash is visible, setting the ulvl accordingly
				$("."+lvl).each(function(){
					if ($(this).attr("id") == hash.substr(1) || $(this).find(escapeHash(hash)).length > 0) {
						body.addClass("u"+lvl)
					}
				})
			}
			$("."+lvl).on("click", function(){
				// don't need to show lvl1 if lvl2 is already shown
				if (lvl=="lvl1" && body.hasClass("ulvl2")) {
					return
				}
				// showing lvl2 also show lvl1
				if (lvl=="lvl2") {
					body.removeClass("ulvl1")
				}
				body.addClass("u"+lvl)
			})
			$("."+lvl).on("dblclick", function(){
				// hiding lvl1 also hides lvl2
				if (lvl=="lvl1" && body.hasClass("ulvl2")) {
					body.removeClass("ulvl2")
				}
				body.removeClass("u"+lvl)
			})
		})
	}
	var level_selector = $("<span class='level'><span></span><span></span></span>")
	level_selector.on("click", function(){
		if (body.hasClass("ulvl1")) {
			body.addClass("ulvl2")
			body.removeClass("ulvl1")
		} else
		if (body.hasClass("ulvl2")) {
			body.removeClass("ulvl2")
		} else {
			body.addClass("ulvl1")
		}
	})
	$(".version").append(level_selector)
	$("a").on("click", function(){
		var href = $(this).attr("href")
		if (href[0] == "#") {
			return
		}
		href = href.replace(/.ulvl=(lvl.|)/g, "")
		var ulvl = ""
		for (var i=0; i<levels.length; i++) {
			var lvl = levels[i]
			if (body.hasClass("u"+lvl)) {
				ulvl = lvl
			}
		}
		if (ulvl=="") {
			return
		}
		$(this).attr("href", href+"?ulvl=u"+ulvl)
		return true
	})
	$(window).on("hashchange", function () {
		init()
	});
	init()
    });

}(window, jQuery, $u));

