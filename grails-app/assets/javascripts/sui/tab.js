
var suiTab = {
    init: function (tab, panel) {
        tab.on("click", ".sui-tab-item", function (evt) {
            evt.preventDefault();
            var tabItem = this.jq
            var data = tabItem.data()

            panel.loader()
            sui.ajax({
                url: app.base + data.url,
                data: {ajax: true},
                dataType: "html",
                response: function(resp) {
                    panel.loader(false)
                },
                success: function(resp) {
                    if(resp.length) {
                        $(".sui-tab-item").removeClass("current")
                        tabItem.addClass("current")
                        panel.html(resp)
                        panel.updateUi()
                        app.tab[data.id] && app.tabs[data.id].init();
                        panel.trigger("after-" + data.id + "-panel-load")
                    }
                }
            });
        })
    },

}