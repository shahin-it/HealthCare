package com.helthcare

import com.sun.org.apache.xpath.internal.operations.Bool

import javax.servlet.http.HttpSession

class DashboardController {

    UserService userService

    def controlPanel() {
        render(view: "/controlPanel", model: [dashboard: "current"])
    }

    def login() {
        if(session.user != null) {
            redirect(action: "controlPanel")
            return
        }
        render(view: "/page/login")
    }

    def doLogin() {
        User user = User.findByUsernameAndPassword(params.userName, params.password)

        if(!user) {
            redirect(action: "login")
            return
        }

        session.user = user.id
        redirect(action: "controlPanel")
    }

    def doLogout() {
        userService.logout()
        redirect(action: "login")
    }
}
