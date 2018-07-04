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
            banner: "system/banner.jpg",
            logo: "system/logo.png",
            address1: "GP-GA 88/1, Middle Badda, Dhaka",
            address2: null,
            contact: "+8801700000000",
            email: "admin@example.com",
            web: "http://www.example.com",
            deliver_order_within: "2",
            details: "Service First",
            date_formate: "dd-MM-yyyy",
            time_formate: "hh:mm:ss a",
            item_per_page: "15"
    ]
}
