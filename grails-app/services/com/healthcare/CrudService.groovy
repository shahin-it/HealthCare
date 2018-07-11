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
        String dateFormate = DomainConstant.DATE_PICKER_DATE_FORMATE
        params.joiningDate = params.joiningDate.toDate(dateFormate).toGMT()
        params.birthDate = params.birthDate.toDate(dateFormate).toGMT()
        employee.setProperties(params)

        employee.save()
    }
}
