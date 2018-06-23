package com.healthcare.pathology

import com.healthcare.Patient
import com.healthcare.crm.Consultant
import com.healthcare.model.DomainBase

class Order extends DomainBase {

    String status = "UNPAID"// PAID, UNPAID, DELIVERED, CANCELED

    Patient patient
    Consultant consultant

    Date delivery
    Date updated

    Collection<OrderItem> items
    Double discount = 0.0
    Double paid = 0.0

    String note
    Boolean active = true

    static constraints = {
        note(nullable: true, maxSize: 500)
        Consultant(nullable: true)
    }

    static transients = ["getTotal", "getGrandTotal", "getDue"]

    Double getTotal() {
        return items.sum {it.grandTotal}
    }

    Double getGrandTotal() {
        return total - discount
    }

    Double getDue() {
        return grandTotal - paid
    }
}
