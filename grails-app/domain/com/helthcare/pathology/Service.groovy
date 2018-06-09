package com.helthcare.pathology

import com.helthcare.model.DomainBase

class Service extends DomainBase {

    String name
    String instruction
    String description


    Double basePrice = 0.0
    Double costPrice = 0.0
    Double discount = 0.0

    String discountType = "%" //eg. %, tk

    static constraints = {
        instruction(nullable: true)
        description(nullable: true, maxSize: 1000)
        costPrice(nullable: true)
        discount(nullable: true)
    }
}
