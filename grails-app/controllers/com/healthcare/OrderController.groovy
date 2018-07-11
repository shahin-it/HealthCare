package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.pathology.Order
import com.healthcare.pathology.OrderItem
import com.healthcare.pathology.Service
import com.healthcare.util.AppUtil
import grails.converters.JSON

class OrderController {
    DomainService domainService
    OrderService orderService

    def edit(Order order) {
        order = order ?: new Order()
        List consultants = domainService.getKeyValueProp(Consultant)
        List patients = domainService.getKeyValueProp(Patient)
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
        orderService.save(order, params)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def delete(Order order) {
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def view() {
        [id: params.id]
    }

    def print(Order order) {
        Map config = AppUtil.getConfig("global")
        [order: order, global: config]
    }

    def changeStatus() {
        orderService.changeStatus(params)
        render([message: "Successfully chaged", status: "success"] as JSON)
    }
}