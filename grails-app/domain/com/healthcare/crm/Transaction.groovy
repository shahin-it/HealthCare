package com.healthcare.crm

import com.healthcare.DomainConstant
import com.healthcare.model.DomainBase
import com.healthcare.pathology.Order
import com.healthcare.util.EventManager

class Transaction extends DomainBase {

    String title
    String type = DomainConstant.TRANSECTION_TYPES.SERVICE
    Boolean isRefund = false
    Long effectiveId

    Double unitPrice = 0.0
    Integer quantity = 1

    String note

    static constraints = {
        type(maxSize: 50)
        effectiveId(nullable: true)
        note(nullable: true, maxSize: 500)
    }

    static transients = ['getTotal']

    Double getTotal() {
        return unitPrice * quantity
    }

    static void initialize() {
        EventManager.on("after-order-save",  { orderId, Map params ->
            Order order = Order.proxy(orderId)
            if(params.newPayment) {
                Transaction transaction = new Transaction(
                        type: DomainConstant.TRANSECTION_TYPES.ORDER,
                        effectiveId: orderId,
                        unitPrice: params.newPayment,
                        title: "Payment for order #$orderId"
                )
                transaction.save()
            }
        })
    }

}
