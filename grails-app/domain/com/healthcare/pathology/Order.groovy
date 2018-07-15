package com.healthcare.pathology

import com.healthcare.Patient
import com.healthcare.crm.Consultant
import com.healthcare.model.DomainBase
import com.healthcare.util.AppUtil

class Order extends DomainBase {

    String deliveryStatus = "PENDING"// PENDING, DELIVERED, CANCELED
    String paymentStatus = "UNPAID"// PAID, UNPAID, PARTIAL

    Patient patient
    Consultant consultant

    Date delivery
    Date updated

    Collection<OrderItem> items = []
    Double discount = 0.0
    Double paid = 0.0

    String note
    Boolean active = true

    static hasMany = [items: OrderItem]

    static constraints = {
        note(nullable: true, maxSize: 500)
        paymentStatus(maxSize: 20)
        deliveryStatus(maxSize: 20)
    }

    static transients = ["getTotal", "getGrandTotal", "getDue", "getIsPaid"]

    def beforeValidate() {
        super.beforeValidate()
        if (!this.delivery) {
            this.delivery = new Date().toGMT().plus((int)AppUtil.getConfig("global", "deliver_order_within"))
        }
    }

    Double getTotal() {
        return items.sum {it.total} ?: 0.0
    }

    Double getGrandTotal() {
        return total - discount
    }

    Double getDue() {
        return grandTotal - paid
    }

    Boolean getIsPaid() {
        return this.due <= 1
    }
}
