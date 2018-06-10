package com.healthcare.crm

import com.healthcare.model.DomainBase

class TransactionHistory extends DomainBase {

    Boolean isDebited = true//
    String payFor = "service" // service, salary, purchase, bill, visit
    Long effectiveId
    String logInfo

    static constraints = {
        payFor(maxSize: 50)
        effectiveId(nullable: true)
        logInfo(maxSize: 500)
    }

}
