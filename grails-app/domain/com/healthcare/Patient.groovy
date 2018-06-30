package com.healthcare

import com.healthcare.model.DomainBase

class Patient extends DomainBase {

    String name
    String fatherName
    Boolean isMarried = false
    String spouseName
    String email
    String mobile
    String mobile2
    String sex = "MALE" // MALE, FEMALE
    Address address

    Boolean isInTrash = false

    static constraints = {
        spouseName(nullable: true)
        email(nullable: true, unique: true)
        mobile2(nullable: true)
        sex(maxSize: 10)
        address(nullable: true)
        mobile(unique: true)
    }

    static transients = ['getFlatAddress']

    String getFlatAddress() {
        return address ? "${address.city} - ${address.unionName}, ${address.upazila}, ${address.district}" : ""
    }
}
