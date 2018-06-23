package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.pathology.Order
import com.healthcare.pathology.OrderItem
import com.healthcare.pathology.Service
import grails.converters.JSON

class OrderController {
    DomainService domainService

    def edit(Order order) {
        order = order ?: new Order()
        List<Consultant> consultants = domainService.getKeyValueProp(Consultant)
        List<Patient> patients = domainService.getKeyValueProp(Patient)
        Map tests = domainService.getKeyValue(Service, "name", {eq("isActive", true)})
        [order: order, services: tests, consultants: consultants, patients: patients]
    }

    def itemRow(OrderItem orderItem) {
        [item: orderItem]
    }

    def serviceRow(Service service) {
        [service: service]
    }

    def save(Order order) {
        domainService.save(order, params)
        render([messagparamse: "Successfully saved", status: "success"] as JSON)
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