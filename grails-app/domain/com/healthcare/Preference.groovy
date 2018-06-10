package com.healthcare

class Preference {

    String configKey
    String value
    String type

    static constraints = {
        configKey(unique: true)
        value(nullable: true)
    }
}
