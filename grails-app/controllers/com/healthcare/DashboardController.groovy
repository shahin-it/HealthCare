package com.healthcare

import com.healthcare.util.AppUtil

class DashboardController {

    UserService userService

    def controlPanel() {
        Map config = AppUtil.getConfig("global")
        render(view: "/controlPanel", model: [dashboard: "current", config: config])
    }

    def login() {
        if(AppUtil.loggedUser == null) {
            render(view: "/page/login")
            return
        }
        redirect(action: "controlPanel")
    }

    def doLogin() {
        User user = User.findByUserIdAndPassword(params.userName, params.password)
        if(user) {
            userService.registerAdminSession(user)
            redirect(action: "controlPanel", method: 'POST')
        } else {
            redirect(action: "login", method: 'POST')
        }
    }

    def doLogout() {
        userService.logout()
        redirect(action: "login")
    }
}
