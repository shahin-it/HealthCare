package com.healthcare

import grails.gorm.transactions.Transactional

@Transactional
class CrudService {

    Boolean savePatient(Patient patient, Map params) {
        return !patient.hasErrors()
    }
}
