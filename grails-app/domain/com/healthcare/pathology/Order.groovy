package com.healthcare.pathology

import com.healthcare.Patient
import com.healthcare.model.DomainBase

class Order extends DomainBase {

    String status = "unpaid"// paid, unpaid, delivered, canceled

    Patient patient

    Date delivery
    Date upated

    Collection<OrderItem> items
    Double discount = 0.0
    Double paid = 0.0

    static constraints = {
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
