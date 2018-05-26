package com.helthcare

class Address {

    String village
    String wordNo
    String union = "Charbata"
    String upazilla = "Subarnachar"
    String district = "Noakhali"
    String country = "Bangladesh"

    static constraints = {
        wordNo(nullable: true, maxSize: 10)
        upazilla(maxSize: 100)
        district(maxSize: 100)
        country(maxSize: 100)
    }
}
