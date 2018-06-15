package com.healthcare

import com.healthcare.pathology.Order
import com.healthcare.pathology.Service
import grails.converters.JSON

class OrderController {
    DomainService domainService

    def edit(Order order) {
        order = order ?: new Order()
        Map tests = domainService.getKeyValue(Service, "name", {eq("isActive", true)})
        [order: order, services: tests]
    }

    def itemRow(Order order) {
        [item: order]
    }

    def save(Order order) {
        domainService.save(order, params)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def delete(Order order) {
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def view(Order order) {
        [order: order]
    }

    def print() {

    }
}