package com.healthcare

import com.healthcare.pathology.Order

class PageController {

    DomainService domainService

    def pathology() {
        Map data = domainService.dataTableElement(Order, params)
        return [pathology: "current", items: data.items as List<Order>, count: data.count]
    }
}
