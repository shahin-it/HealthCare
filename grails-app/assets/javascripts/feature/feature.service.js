var _ps = {};
app.tab.serviceSetting = function() {
    this.loading_url = app.base + "setting/services";
    this.id = "service-setting-tab";
    this.createEditUrl = app.base + "setting/editServices";
    this.removeUrl = app.base + "setting/deleteService";
    this.processor = _ps;
    return this;
};

(function () {
    _ps.init = function() {
        var _self = this;
    }
    _ps.onCreateEditLoad = function (panel) {
        var _self = this;
    }

})()