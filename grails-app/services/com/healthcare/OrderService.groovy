package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.pathology.Order
import com.healthcare.pathology.OrderItem
import com.healthcare.pathology.Service
import com.healthcare.util.EventManager
import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class OrderService {
    TransactionService transactionService

    void save(Order order, GrailsParameterMap params) {
        List items = params.items = params.list("items").collect { params[it] }
        order.items.findAll {!items.id.contains("" + it.id)}*.delete()
        order.setProperties(params)

        if(params.patientId) {
            order.patient = Patient.proxy(params.patientId)
        }
        if(params.consultantId) {
            order.consultant = Consultant.proxy(params.consultantId)
        }

        params.list("serviceId").each {
            Map _service = params["service_" + it]
            Service service = Service.get(_service.id)
            OrderItem item = new OrderItem(_service)
            item.order = order
            item.name = service.name
            item.instruction = service.instruction
            order.items.add(item)
        }

        params.newPayment = params.double("newPayment") ?: 0.0
        order.paid += params.newPayment

        if(order.due < 1) {
            order.paymentStatus = "PAID"
        } else if(order.paid >= 1) {
            order.paymentStatus = "PARTIAL"
        }
        order.save()
        EventManager.trigger("after-order-save", order.id, params)
    }

    void changeStatus(Map params) {
        Order order = Order.proxy(params.id)

        switch (params.type) {
            case "delivery":
                order.deliveryStatus = "DELIVERED"
                break;
            case "cancel":
                order.deliveryStatus = "CANCELED"
                order.active = false
                break;
            case "activate":
                order.active = true
                break;
        }

        order.save()
    }
}
