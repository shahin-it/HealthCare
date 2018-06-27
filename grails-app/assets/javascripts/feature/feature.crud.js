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
    }

})();


var _patient = {};
app.tab.patient = function() {
    this.loading_url = app.base + "page/patient";
    this.id = "patient-tab";
    this.createEditUrl = app.base + "crud/editPatient";
    this.removeUrl = app.base + "crud/deletePatient";
    this.processor = _patient;
    return this;
};

(function () {
    _patient.init = function() {
        var _self = this;
    }
    _patient.onCreateEditLoad = function (panel) {
        var _self = this;
    }

})();



var _consultant = {};
app.tab.consultant = function() {
    this.loading_url = app.base + "page/consultant";
    this.id = "consultant-tab";
    this.createEditUrl = app.base + "crud/editConsultant";
    this.removeUrl = app.base + "crud/deleteConsultant";
    this.processor = _consultant;
    return this;
};

(function () {
    _consultant.init = function() {
        var _self = this;
    }
    _consultant.onCreateEditLoad = function (panel) {
        var _self = this;
    }

})();