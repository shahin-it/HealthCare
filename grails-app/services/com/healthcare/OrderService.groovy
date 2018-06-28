package com.healthcare

import com.healthcare.pathology.Order
import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap


@Transactional
class OrderService {
    void save(Order order, GrailsParameterMap params) {
        order.save()
    }
}
