package com.healthcare

import com.healthcare.model.DomainBase

class User extends DomainBase {

    String name
    String email
    String mobile
    String sex = "M" // M, F

    String userId
    String password

    String role = "USER" //ADMIN, MANAGER, USER

    Address address

    Boolean isInTrash = false

    static constraints = {
        userId(unique: true)
        email(nullable: true, unique: true)
        mobile(unique: true)
        createdBy(nullable: true)
        sex(maxSize: 10)
        address(nullable: true)
    }

    static void initialize() {
        if(User.count == 0) {
            new User(name: "HealthCare Admin", email: "admin@healthcare.com", mobile: "01920489953", userId: "admin", password: "admin", role: "admin").save()
        }
    }
}
