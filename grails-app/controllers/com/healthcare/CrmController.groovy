package com.healthcare

import com.healthcare.crm.Employee

class CrmController {
    DomainService domainService

    def editPayEmployee() {
        Employee employee = Employee.proxy(params.id)
        render(view: "/crm/employee/payEmployee", model: [employee: employee])
    }
}
