package com.healthcare.crm

import com.healthcare.DomainConstant
import com.healthcare.model.DomainBase

class Transaction extends DomainBase {

    String type = DomainConstant.TRANSECTION_TYPES.SERVICE
    Boolean isEarned = true
    Long effectiveId
    Double amount
    String note

    static constraints = {
        type(maxSize: 50)
        effectiveId(nullable: true)
        note(maxSize: 500)
    }

}
