package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.pathology.Order

class PageController {

    DomainService domainService

    def pathology() {
        Map data = domainService.dataTableElement(Order, params)
        [pathology: "current", items: data.items as List<Order>, count: data.count]
    }

    def patient() {
        Map data = domainService.dataTableElement(Patient, params)
        [patient: "current", items: data.items as List<Patient>, count: data.count]
    }

    def consultant() {
        Map data = domainService.dataTableElement(Consultant, params)
        [consultant: "current", items: data.items as List<Consultant>, count: data.count]
    }
}
