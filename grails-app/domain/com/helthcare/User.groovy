package com.helthcare

import com.helthcare.model.DomainBase

class User extends DomainBase {

    String name
    String email
    String phone
    String sex = "M" // M, F

    String userName
    String password

    String role = "USER" //ADMIN, MANAGER, USER

    Address address

    static constraints = {
        email(nullable: true)
        createdBy(nullable: true)
        sex(maxSize: 10)
        address(nullable: true)
    }

    static void initialize() {
        if(User.count == 0) {
            new User(name: "HelthCare Admin", email: "admin@helthcare.com", phone: "01920489953", userName: "admin", password: "admin", role: "admin").save()
        }
    }
}
