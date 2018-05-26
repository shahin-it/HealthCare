package com.helthcare

class Preference {

    String key
    String value
    String type

    static constraints = {
        key(unique: true)
        value(nullable: true)
    }
}
