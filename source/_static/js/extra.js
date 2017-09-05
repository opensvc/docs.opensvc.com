(function (window, $, _) {

    /*==========================================================================
     * Toggleable Sections
     *==========================================================================
     * Added expand/collapse button to any collapsible RST sections.
     * Looks for sections with CSS class "html-toggle",
     * along with the optional classes "expanded" or "collapsed".
     * Button toggles "html-toggle.expanded/collapsed" classes,
     * and relies on CSS to do the rest of the job displaying them as appropriate.
     *==========================================================================*/

    var $window = $(window);

    // given "#hash-name-with.periods", escape so it's usable as CSS selector
    // (e.g. "#hash-name-with\\.periods")
    function escapeHash(hash) {
        return hash.replace(/\./g, "\\.");
    }

    $(function () {
        function init() {
            // get header & section, and add static classes
            var header = $(this);
            var section = header.parent();
            header.addClass("html-toggle-button");

            // helper to test if url hash is within this section
            function contains_hash() {
                var hash = document.location.hash;
                return hash && (section[0].id == hash.substr(1) ||
                    section.find(escapeHash(hash)).length > 0);
            }

            // helper to control toggle state
            function set_state(expanded) {
                expanded = !!expanded; // toggleClass et al need actual boolean
                section.toggleClass("expanded", expanded);
                section.toggleClass("collapsed", !expanded);
                section.children().toggle(expanded);
                if (!expanded) {
                    section.children("span:first-child:empty").show();
                    /* for :ref: span tag */
                    header.show();
                }
            }

            // initialize state
            set_state(section.hasClass("expanded") || contains_hash());

            // bind toggle callback
            header.click(function (evt) {
                var state = section.hasClass("expanded")
                if (state && $(evt.target).is(".headerlink")) {
                    return;
                }
                set_state(!state);
                $window.trigger('cloud-section-toggled', section[0]);
            });

            // open section if user jumps to it from w/in page
            $window.on("hashchange", function () {
                if (contains_hash()) set_state(true);
            });
        }

        $(".html-toggle.section > h2, .html-toggle.section > h3, .html-toggle.section > h4, .html-toggle.section > h5, .html-toggle.section > h6").each(init);
    });

}(window, jQuery, $u));

