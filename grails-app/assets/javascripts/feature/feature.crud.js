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


var _employee = {};
app.tab.employee = function() {
    this.loading_url = app.base + "setting/employee";
    this.id = "employee-tab";
    this.createEditUrl = app.base + "crud/editEmployee";
    this.removeUrl = app.base + "crud/deleteEmployee";
    this.processor = _employee;
    return this;
};

(function () {
    _employee.init = function() {
        var _self = this;
    }

    _employee.onActionClick = function(action, data) {
        var _self = this;
        switch (action) {
            case "pay-salary":
                skui.renderCreateEdit(app.base + "crm/editPayEmployee", data);
                break;
            case "payment-history":
                _self.paymentHistory(data);
                break;
        }
    }

    _employee.onCreateEditLoad = function (panel) {
        var _self = this;
    }

    _employee.paymentHistory = function (data) {
        data = $.extend(data, {
            domainId: data.id,
            id: undefined,
            type: "SALARY"
        })
        skui.renderCreateEdit(app.base + "transaction/history", data);
    }

})();


var _transaction = {};
app.tab.transaction = function() {
    this.loading_url = app.base + "transaction/history";
    this.id = "transaction-tab";
    this.createEditUrl = app.base + "transaction/edit";
    this.removeUrl = app.base + "transaction/delete";
    this.processor = _transaction;
    return this;
};
(function () {
    _transaction.init = function() {
        var _self = this;
    }

    _transaction.onActionClick = function(action, data) {
        var _self = this;
    }

    _transaction.onCreateEditLoad = function (panel) {
        var _self = this;
    }

})();