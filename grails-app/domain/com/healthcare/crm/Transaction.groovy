package com.healthcare.crm

import com.healthcare.DomainConstant
import com.healthcare.model.DomainBase

class Transaction extends DomainBase {

    String title
    String type = DomainConstant.TRANSECTION_TYPES.SERVICE
    Boolean isEarned = true
    Long effectiveId

    Double amount
    Double unitPrice
    Integer unit = 1

    String note

    static constraints = {
        title(nullable: true)
        type(maxSize: 50)
        effectiveId(nullable: true)
        note(maxSize: 500)
    }

    def beforeValidate() {
        super.beforeValidate()
        if(!unitPrice) {
            unitPrice = amount
        }
    }

}
