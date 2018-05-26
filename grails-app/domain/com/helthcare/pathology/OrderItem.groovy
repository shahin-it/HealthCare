package com.helthcare.pathology

class OrderItem {

    String name
    String instruction
    String note

    Integer count = 1
    Double basePrice = 0.0

    Order order

    static constraints = {
        instruction(nullable: true)
        note(nullable: true, maxSize: 1000)
    }

    static transients = ["getGrandTotal"]

    Double getGrandTotal() {
        return basePrice * count
    }
}
