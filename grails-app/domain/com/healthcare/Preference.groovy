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
        if(Preference.countByType("global") == 0) {
            _global.each {
                new Preference(type: "global", configKey: it.key, value: it.value).save()
            }
        }
    }

    static _global = [
            name: "Health Care Admin",
            banner: "/static/resources/system/banner.jpg",
            address1: "",
            address2: null,
            contact: null,
            details: ""
    ]
}
