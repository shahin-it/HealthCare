package com.healthcare

import com.healthcare.crm.Employee
import grails.gorm.transactions.Transactional

@Transactional
class CrudService {

    Boolean savePatient(Patient patient, Map params) {
        return !patient.hasErrors()
    }

    void saveEmployee(Map params) {
        Employee employee = Employee.proxy(params.id) ?: new Employee()
        params.joiningDate = params.joiningDate.toDate("dd-MM-yyyy").toGMT()
        params.birthDate = params.birthDate.toDate("dd-MM-yyyy").toGMT()
        employee.setProperties(params)

        employee.save()
    }
}
