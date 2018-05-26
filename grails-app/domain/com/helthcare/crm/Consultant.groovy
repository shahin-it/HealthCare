package com.helthcare.crm

import com.helthcare.model.DomainBase

class Consultant extends DomainBase {

    String name
    String qualification
    String designation
    String medicalCollage
    String worksAt
    String sex = "m" // m, f

    String email
    String mobile
    String mobile2

    Double visitingFee = 0.0

    static constraints = {
        designation(nullable: true)
        worksAt(nullable: true)
        email(nullable: true)
        mobile2(nullable: true)
        sex(maxSize: 10)
    }

}
