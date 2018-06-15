package com.healthcare

class Preference {

    String type
    String configKey
    String value

    static constraints = {
        configKey(unique: true)
        value(nullable: true)
    }

    static void initialize() {
        if(Preference.findByType("default") == 0) {
            _global.each {
                new Preference(type: "global", configKey: it.key, value: it.value)
            }
        }
    }

    static _global = [
            name: "Helth Care Admin",
            banner: null,
            address1: "",
            address2: null,
            contact: null,
            details: ""
    ]
}
