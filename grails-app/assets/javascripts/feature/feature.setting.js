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


var _us = {};
app.tab.userSetting = function() {
    this.loading_url = app.base + "setting/userManager";
    this.id = "user-setting-tab";
    this.createEditUrl = app.base + "setting/editUser";
    this.removeUrl = app.base + "setting/deleteUser";
    this.processor = _us;
    return this;
};

(function () {
    _us.init = function() {
        var _self = this;
    }
    _us.onCreateEditLoad = function (panel) {
        var _self = this;
    }

})()