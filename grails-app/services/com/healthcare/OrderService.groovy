package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.pathology.Order
import com.healthcare.pathology.OrderItem
import com.healthcare.pathology.Service
import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap


@Transactional
class OrderService {
    void save(Order order, GrailsParameterMap params) {
        List itemIds = params.list("itemId")
        if(order.items) {
            order.items.findAll {!itemIds.contains("" + it.id)}*.delete()
            order.items = itemIds.collect {OrderItem.proxy(it)}
        }
        if(params.patientId) {
            order.patient = Patient.proxy(params.patientId)
        }
        if(params.consultantId) {
            order.consultant = Consultant.proxy(params.consultantId)
        }
        params.list("service").each {
            Map _service = it
            Service service = Service.get(_service.id)
            OrderItem item = new OrderItem(_service)
            item.order = order
            item.name = service.name
            item.instruction = service.instruction
            order.items.add(item)
        }
        order.save()
    }
}
