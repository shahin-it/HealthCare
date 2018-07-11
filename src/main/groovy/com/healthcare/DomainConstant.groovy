package com.healthcare

import com.healthcare.util.AppUtil

class DomainConstant {

    static  final TRANSECTION_TYPES = [
            ORDER: "ORDER",
            SERVICE: "SERVICE",
            SALARY: "SALARY",
            PURCHASE: "PURCHASE",
            BILL: "BILL",
            VISIT: "VISIT"
    ]
    static final BANNER_IMAGE_PATH = "resources/system/banner.jpg"
    static final LOGO_IMAGE_PATH = "resources/system/logo.png"

    static DISTRICT = ['Noakhali', 'Feni', 'Laxmipur', 'Vhola', 'Barisal', 'Comilla', 'Chittagong']

    static UPAZILA = ['Subarnachar', 'Hatiya', 'Sadar', 'Ramgoti', 'Sondip']

    static DATE_FORMATE = ['dd-MM-yyyy', 'dd MMMM yyyy']
    static TIME_FORMATE = ['hh:mm:ss a', 'hh:mm a', 'hh:mm:ss', 'hh:mm']
    static statusUiClass(String status) {
        Map sts = [
            PENDING: "warning",
            DELIVERED: "success",
            CANCELED: "danger",
            PAID: "success",
            UNPAID: "danger",
            PARTIAL: "warning"
        ]
        return sts[status] ?: "primary"
    }

    static final DATE_PICKER_DATE_FORMATE = "dd-mm-yyyy"
    static final DATE_PICKER_TIME_FORMATE = "hh:mm:ss a"

    static final getMAX_RESULT() {
        return (AppUtil.getConfig("global", "item_per_page") as int) ?: 15
    }

}