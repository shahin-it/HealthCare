package com.helthcare

import com.helthcare.util.AppUtil

class DashboardController {

    UserService userService

    def controlPanel() {
        render(view: "/controlPanel", model: [dashboard: "current"])
    }

    def login() {
        if(AppUtil.loggedUser == null) {
            render(view: "/page/login")
            return
        }
        redirect(action: "controlPanel")
    }

    def doLogin() {
        User user = User.findByUsernameAndPassword(params.userName, params.password)
        if(user) {
            userService.registerAdminSession(user)
            redirect(action: "controlPanel")
        } else {
            redirect(action: "login")
        }
    }

    def doLogout() {
        userService.logout()
        redirect(action: "login")
    }
}
