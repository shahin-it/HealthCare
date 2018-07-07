package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.crm.Employee
import com.healthcare.pathology.Order

class PageController {

    DomainService domainService

    def pathology() {
        if(params.searchText) {
            params.searchCriteria = {
                patient {
                    or {
                        ilike("name", "%${params.searchText}%")
                        ilike("mobile", "%${params.searchText}%")
                        ilike("email", "%${params.searchText}%")
                        ilike("spouseName", "%${params.searchText}%")
                    }
                }
            }
        }
        Map data = domainService.dataTableElement(Order, [sort: "id", dir: "desc"] + params)
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

    def employee() {
        Map data = domainService.dataTableElement(Employee, params)
        [employee: "current", items: data.items as List<Employee>, count: data.count]
    }
}
