package com.healthcare.crm

import com.healthcare.DomainConstant
import com.healthcare.model.DomainBase
import com.healthcare.pathology.Order
import com.healthcare.util.EventManager

class Transaction extends DomainBase {

    String title
    String type = DomainConstant.TRANAECTION_TYPES.SERVICE
    Boolean isRefund = false
    Long domainId

    Double unitAmount = 0.0
    Integer quantity = 1

    String note
    Date updated

    static constraints = {
        type(maxSize: 50)
        domainId(nullable: true)
        note(nullable: true, maxSize: 500)
    }

    static transients = ['getTotal']

    Double getTotal() {
        return unitAmount * quantity
    }

    static void initialize() {
        EventManager.on("after-order-save", { orderId, Map params ->
            Order order = Order.proxy(orderId)
            if (params.newPayment) {
                Transaction transaction = new Transaction(
                        type: DomainConstant.TRANAECTION_TYPES.ORDER,
                        domainId: orderId,
                        unitAmount: params.newPayment,
                        title: "Payment for order #$orderId"
                )
                transaction.save()
            }
        })
    }

}
