package com.healthcare.crm

import com.healthcare.Address
import com.healthcare.User
import com.healthcare.model.DomainBase

class Employee extends DomainBase {

    String name
    String fatherName
    String email
    String mobile
    String sex = "MALE" // MALE, FEMALE
    String nId

    Double salary = 0.0
    Double bonus = 0.0

    Date joiningDate
    Date birthDate
    User user
    Address address

    Boolean isInTrash = false

    static constraints = {
        email(nullable: true, unique: true)
        mobile(unique: true)
        createdBy(nullable: true)
        sex(maxSize: 10)
        nId(maxSize: 50)
        user(nullable: true)
    }
}
