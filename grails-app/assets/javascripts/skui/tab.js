
var suiTab = {
    init: function (tab, panel) {
        tab.on("click", ".skui-tab-item", function (evt) {
            evt.preventDefault();
            var tabItem = this.jq
            var data = tabItem.data()

            panel.loader()
            skui.ajax({
                url: app.base + data.url,
                dataType: "html",
                response: function(resp) {
                    panel.loader(false)
                },
                success: function(resp) {
                    if(resp.length) {
                        $(".skui-tab-item").removeClass("current")
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