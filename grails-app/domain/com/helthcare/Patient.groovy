package com.helthcare

import com.helthcare.model.DomainBase

class Patient extends DomainBase {

    String name
    String fatherName
    Boolean isMarried = false
    String spouseName
    String email
    String mobile
    String mobile2
    String sex = "m" // m, f
    Address address

    static constraints = {
        spouseName(nullable: true)
        email(nullable: true)
        mobile2(nullable: true)
        sex(maxSize: 10)
    }

}
