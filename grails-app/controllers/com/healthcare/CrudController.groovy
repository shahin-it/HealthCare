package com.healthcare

import com.healthcare.crm.Consultant
import com.healthcare.crm.Employee
import grails.converters.JSON

class CrudController {

    DomainService domainService
    CrudService crudService

    def editPatient(Patient patient) {
        patient = patient ?: new Patient(address: new Address())
        render(view: "/crud/patient/editPatient", model: [patient: patient])
    }

    def deletePatient(Patient patient) {
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def savePatient(Patient patient) {
        domainService.save(patient)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def editConsultant(Consultant consultant) {
        consultant = consultant ?: new Consultant()
        render(view: "/crud/consultant/editConsultant", model: [consultant: consultant])
    }

    def deleteConsultant(Consultant consultant) {
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def saveConsultant(Consultant consultant) {
        domainService.save(consultant)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def editEmployee(Employee employee) {
        employee = employee ?: new Employee()
        render(view: "/crm/employee/editEmployee", model: [employee: employee])
    }

    def saveEmployee() {
        crudService.saveEmployee(params)
        render([status: "success", message: "Successfully saved"] as JSON)
    }

    def deleteEmployee(Employee employee) {
        //domainService.delete(employee)
        render([status: "success", message: "Successfully deleted"] as JSON)
    }
}
