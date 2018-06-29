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

        _self.body.on("click", ".action-navigator .view", function() {
            var data = $.extend(this.jq.parent().data(), {ajax: true});
            _self.printPreview(data);
        })
    }
    _o.onCreateEditLoad = function (panel) {
        var _self = this;
        var popup = panel.parents(".sui-create-edit-panel");
        var cartTable = popup.find(".cart-table");
        var serviceSelection = popup.find(".service-select");
        var select = serviceSelection.find("select");
        serviceSelection.find(".add-button").click(function () {
            if(select.val()) {
                var duplicateItem = cartTable.find(".order-item.service-" + select.val())
                if(duplicateItem.length) {
                    var quantity = duplicateItem.find(".quantity input")
                    quantity.val((quantity.val() * 1) + 1)
                    _self.calculatePrice(cartTable);
                } else {
                    panel.loader()
                    sui.ajax({
                        dataType: "html",
                        url: app.base + "order/serviceRow",
                        data: {id: select.val()},
                        response: function () {
                            panel.loader(false)
                        },
                        success: function (resp) {
                            resp = $(resp);
                            panel.find(".cart-table tbody .summary-row").first().before(resp);
                            resp.updateUi();
                            _self.calculatePrice(cartTable);
                        },
                        error: function() {
                            var x = 0;
                        }
                    })
                }

            }
        })

        cartTable.on("change", "input", function () {
            _self.calculatePrice(cartTable);
        })
        cartTable.on("click", ".action-navigator .remove", function () {
            this.jq.parents(".order-item").remove();
            _self.calculatePrice(cartTable);
        })
        popup.find(".create-edit-form").on("preSubmit", function (evt) {
            if(!cartTable.find(".order-item").length) {
                return false;
            }
        })
    }

    _o.calculatePrice = function (container) {
        var _self = this;
        var _subTotal = 0.00, _discount = 0.00, _grandTotal = 0.00;
        var _paidTotal = container.find(".summary-row.paid-total input").val() || 0.0;
        container.find(".order-item").each(function () {
            var row = this.jq;
            var quantity = row.find(".quantity input").val() || 1
            var rate = row.find(".rate input").val() || 0.00
            var discount = row.find(".discount input").val() * 1 || 0.00
            var totalDisp = row.find(".price") || 0.00
            var subTotal = (rate * quantity) || 0.00;
            var grandTotal = ((rate * quantity) - discount) || 0.00;
            totalDisp.find(".value").html(subTotal.toFixed(2))

            _subTotal += subTotal
            _discount += discount
            _grandTotal += grandTotal
        })

        var subTotalDisp = container.find(".summary-row.sub-total")
        var discountDisp = container.find(".summary-row.discount")
        var grandTotalDisp = container.find(".summary-row.grand-total")
        var dueTotalDisp = container.find(".summary-row.due-total")

        subTotalDisp.find("input").val(_subTotal)
        subTotalDisp.find(".value").html(_subTotal.toFixed(2))

        discountDisp.find("input").val(_discount)
        discountDisp.find(".value").html(_discount.toFixed(2))

        grandTotalDisp.find("input").val(_grandTotal)
        grandTotalDisp.find(".value").html(_grandTotal.toFixed(2))

        var _due = _grandTotal - _paidTotal;
        dueTotalDisp.find(".value").html(_due.toFixed(2))
        if(_due > 0) {
            dueTotalDisp.removeClass("paid")
        } else {
            dueTotalDisp.addClass("paid")
        }

    }

    _o.printPreview = function (data) {
        var _self = this;
        sui.renderCreateEdit.call(_self, app.base + "order/view", data, {
            target: _self.body,
            popupLoad: function(resp) {
                var popup = this
                popup.find(".print-button").click(function () {
                    resp.find("#invoice-frame")[0].contentWindow.print();
                })
            },
            success: function() {
                _self.reload();
            }
        });
    }

})()

function invoiceIframeLoaded() {
    var iFrameID = document.getElementById('invoice-frame');
    if(iFrameID) {
        // iFrameID.height = "";
        iFrameID.height = iFrameID.contentWindow.document.body.scrollHeight + 10 + "px";
    }
}