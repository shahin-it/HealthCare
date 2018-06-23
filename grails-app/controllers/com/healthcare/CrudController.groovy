package com.healthcare

import com.healthcare.crm.Consultant
import grails.converters.JSON

class CrudController {

    def editPatient(Patient patient) {
        patient = patient ?: new Patient()
        [patient: patient]
    }

    def deletePatient(Patient patient) {
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def editConsultant(Consultant consultant) {
        consultant = consultant ?: new Consultant()
        [consultant: consultant]
    }

    def deleteConsultant(Consultant consultant) {
        render([message: "Successfully deleted", status: "success"] as JSON)
    }
}
