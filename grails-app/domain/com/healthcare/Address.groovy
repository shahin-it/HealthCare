package com.healthcare

class Address {

    String city
    String unionName
    String country = "Bangladesh"
    String district = "Noakhali"
    String upazila = "Subarnachar"

    static constraints = {
        unionName(nullable: true)
        upazila(maxSize: 100)
        district(maxSize: 100)
        country(maxSize: 100)
    }
}
