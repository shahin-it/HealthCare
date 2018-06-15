package com.healthcare.pathology

class OrderItem {

    String name
    String instruction
    String note

    Integer quantity = 1
    Double basePrice = 0.0
    Double discount = 0.0

    Order order

    static constraints = {
        instruction(nullable: true)
        note(nullable: true, maxSize: 1000)
    }

    static belongsTo = [order: Order]

    static transients = ["getGrandTotal"]

    Double getGrandTotal() {
        return basePrice * quantity
    }
}
