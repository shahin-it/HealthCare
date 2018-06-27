package com.healthcare.crm

import com.healthcare.model.DomainBase

class Consultant extends DomainBase {

    String name
    String qualification
    String designation
    String lastInstitute
    String worksAt
    String sex = "MALE" // MALE, FEMALE

    String email
    String mobile
    String mobile2

    Double visitingFee = 0.0

    Boolean isInTrash = false

    static constraints = {
        worksAt(nullable: true)
        email(nullable: true)
        mobile2(nullable: true)
        sex(maxSize: 10)
        visitingFee(nullable: true)
    }

}
