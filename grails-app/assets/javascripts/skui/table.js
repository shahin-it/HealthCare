/**
 * Created by shahin on 14-Aug-16.
 */
$(function() {
    var content = $(".skui-tabular-content")
    $.each(app.tab, function(k, _processor) {
        var tab = {createEditUrl: "", removeUrl: ""};
        var base = _processor.apply(tab);
        tab = $.extend(base.processor, tab);
        tab.body = content.filter("#"+tab.id);
        if(!tab.body.length) {
            return;
        }
        tab.body.updateUi();
        var table = skui.singleTab(tab.body, {}, {
            url: tab.loading_url,
            afterLoad: function() {
            }
        });
        var _init = tab.init;
        tab.init = function () {
            var _self = this;
            _self.body.on("click", ".action-navigator [data-action]", function() {
                var $this = this.jq
                var data = $.extend($this.parent().data() || {}, $this.data())
                var action = data.action
                delete data.action
                _self.onActionClick && _self.onActionClick.call(_self, action, data)
            });
            _self.body.on("click", ".add-new-button, .action-navigator .edit", function() {
                var data = this.jq.parent().data();
                skui.renderCreateEdit.call(_self, tab.createEditUrl, data, {
                    target: _self.body,
                    popupLoad: _self.onCreateEditLoad,
                    success: function() {
                        _self.reload();
                    }
                });
            });
            _self.body.on("click", ".action-navigator .remove", function() {
                var data = this.jq.parent().data() || {};
                skui.confirmAjax(tab.removeUrl, "Are you confirm to remove?", data, function() {
                    _self.reload();
                });
            });
            _init && _init.call(_self);
        }
        tab.reload = table.reload;
        tab.beforeLoad = table.beforeLoad;
        tab.afterLoad = table.afterLoad;

        tab.init();
    })
})