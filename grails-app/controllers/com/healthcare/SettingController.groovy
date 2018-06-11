package com.healthcare

import com.healthcare.pathology.Service
import com.healthcare.util.AppUtil
import grails.converters.JSON

class SettingController {
    DomainService domainService
    SettingService settingService

    def global() {
        [global: "current"]
    }

    def saveGlobalConfig() {

    }

    def services() {
        Map data = domainService.dataTableElement(Service, params)
        [service: "current", items: data.items, count: data.count]
    }

    def profile() {
        List<User> users = User.list()
        User currentUser = User.get(AppUtil.loggedUser)
        User user = params.selected ? User.get(params.selected) : User.get(AppUtil.loggedUser)
        if(currentUser.role != "ADMIN") {
            user = currentUser
        }
        [profile: "current", user: user, users: users]
    }

    def saveProfile(User user) {
        domainService.save(user, params)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def editServices(Service service) {
        service = service ?: new Service()
        [service: service]
    }

    def saveService(Service service) {
        domainService.save(service, params)
        render([message: "Successfully saved", status: "success"] as JSON)
    }

    def deleteService(Service service) {
        domainService.delete(service)
        render([message: "Successfully deleted", status: "success"] as JSON)
    }
}
