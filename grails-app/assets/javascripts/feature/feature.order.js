var _o = {};
app.tab.order = function() {
    this.loading_url = app.base + "page/pathology";
    this.id = "order-manager-tab";
    this.createEditUrl = app.base + "order/edit";
    this.removeUrl = app.base + "order/delete";
    this.processor = _o;
    return this;
};

(function () {
    _o.init = function() {
        var _self = this;
    }
    _o.onCreateEditLoad = function (panel) {
        var _self = this;
        var serviceSelection = panel.find(".service-select");
        var select = serviceSelection.find("select");
        serviceSelection.find(".add-button").clicl(function () {
            if(select.val()) {
                panel.loader()
                sui.ajax({
                    url: app.base + "order/tableRow",
                    data: {id: select.val()},
                    response: function () {
                        panel.loader(false)
                    },
                    success: function (resp) {
                        resp = $(resp);
                        panel.find(".cart-table tbody").append(resp);
                        resp.updateUi();
                    }
                })
            }
        })
    }

})()