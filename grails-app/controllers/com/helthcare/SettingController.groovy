package com.helthcare

import com.helthcare.pathology.Service
import grails.converters.JSON

class SettingController {
    DomainService domainService

    def global() {
        [global: "current"]
    }

    def saveGlobalConfig() {

    }

    def services() {
        Map data = domainService.dataTableElement(Service, params)
        if(params.dataTable) {
            render([:] as JSON)
        } else {
            [service: "current", items: data.items, count: data.count]
        }
    }

    def profile() {
        [profile: "current"]
    }

    def saveProfile() {

    }

    def editServices(Service service) {
        service = service ?: new Service()
        [service: service]
    }

    def saveService(Service service) {
        service.save(flash: true)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def deleteService(Service service) {
        service.delete()
        render([message: "Successfully deleted", status: "success"] as JSON)
    }
}
