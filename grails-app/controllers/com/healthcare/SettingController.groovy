package com.healthcare

import com.healthcare.crm.Employee
import com.healthcare.pathology.Service
import com.healthcare.util.AppUtil
import grails.converters.JSON

class SettingController {
    DomainService domainService
    SettingService settingService
    CommonService commonService

    def global() {
        Map config = AppUtil.getConfig("global")
        [global: "current", config: config]
    }

    def saveGlobalConfig() {
        params.global['banner'] = DomainConstant.BANNER_IMAGE_PATH
        params.global['logo'] = DomainConstant.LOGO_IMAGE_PATH
        try {
            settingService.saveConfig(params)
        } catch (Exception e) {
            render([message: "Settings save failed", status: "error"] as JSON)
            e.printStackTrace()
            return
        }
        if(!params.global['banner']) {
            def banner = request.getPart("global.banner")
            commonService.uploadImage(banner, DomainConstant.BANNER_IMAGE_PATH)
        }
        if(!params.global['logo']) {
            def logo = request.getPart("global.logo")
            commonService.uploadImage(logo, DomainConstant.LOGO_IMAGE_PATH)
        }
        render([message: "Successfully saved", status: "success"] as JSON)
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
        render(view: "/setting/editUser", model: [profile: "current", user: user, users: users])
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
        //domainService.delete(service)
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def userManager() {
        Map data = domainService.dataTableElement(User, params)
        [users: "current", items: data.items as List<User>, count: data.count]
    }

    def editUser(User user) {
        user = user ?: new User()
        [user: user]
    }

    def deleteUser(User user) {
        //domainService.delete(user)
        render([message: "Successfully deleted", status: "success"] as JSON)
    }

    def employee() {
        Map data = domainService.dataTableElement(Employee, params)
        render(view: "/crm/employee/listView", model: [employee: "current", items: data.items as List<Employee>, count: data.count])
    }
}
