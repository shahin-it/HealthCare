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
        if (Preference.countByType("general") == 0) {
            _config.each { type, v ->
                v.each {
                    new Preference(type: type, configKey: it.key, value: it.value).save()
                }
            }
        }
    }

    static _config = [
            general       : [
                    name    : "Health Care Admin",
                    details : "Service First",
                    logo    : "resources/system/logo.png",
                    banner  : "resources/system/banner.jpg",
                    address1: "GP-GA 88/1, Middle Badda, Dhaka",
                    address2: null,
                    contact : "+8801700000000",
                    email   : "admin@example.com",
                    web     : "http://www.example.com",
            ],
            dashboard     : [],
            access_control: [],
            invoice       : [
                    deliver_order_within: "2",
            ],
            others        : [
                    item_per_page: "15",
                    date_formate : "dd-MM-yyyy",
                    time_formate : "hh:mm:ss a",
            ]
    ]

}
