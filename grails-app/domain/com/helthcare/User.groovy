package com.helthcare

import com.helthcare.model.DomainBase

class User extends DomainBase {

    String name
    String email
    String phone
    String sex = "m" // m, f

    String username
    String password

    String role = "user" //admin, manager, user

    Address address

    static constraints = {
        email(nullable: true)
        createdBy(nullable: true)
        sex(maxSize: 10)
    }
}
