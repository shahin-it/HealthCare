package com.healthcare.pathology

import com.healthcare.model.DomainBase

class Service extends DomainBase {

    String name
    String instruction
    String description


    Double basePrice = 0.0
    Double costPrice = 0.0
    Double discount = 0.0

    String discountType = "%" //eg. %, tk

    Boolean isInTrash = false
    Boolean isActive = true

    static constraints = {
        name(unique: true)
        instruction(nullable: true)
        description(nullable: true, maxSize: 1000)
        costPrice(nullable: true)
        discount(nullable: true)
    }

    static transients = ['getPlainDiscount']

    Double getPlainDiscount() {
        if(this.discountType == "%") {
            return (this.basePrice * this.discount) / 100
        }
        return this.discount
    }
}
