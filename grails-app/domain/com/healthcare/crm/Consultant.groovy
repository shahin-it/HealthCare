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

    Boolean isInHouse = false
    Boolean isInTrash = false

    static constraints = {
        qualification(nullable: true)
        worksAt(nullable: true)
        lastInstitute(nullable: true)
        email(nullable: true, unique: true)
        mobile2(nullable: true)
        sex(maxSize: 10)
        mobile(unique: true)
    }

}
