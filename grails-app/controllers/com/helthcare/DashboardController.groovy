package com.helthcare

class DashboardController {

    UserService userService

    def controlPanel() {
        render(view: "/controlPanel", model: [dashboard: "current"])
    }

    def login() {
        if(session.user == null) {
            render(view: "/page/login")
            return
        }
        redirect(action: "controlPanel")
    }

    def doLogin() {
        User user = User.findByUsernameAndPassword(params.userName, params.password)

        if(!user) {
            redirect(action: "login")
            return
        }

        session.user = user.id
        params.clear()
        redirect(action: "controlPanel")
    }

    def doLogout() {
        userService.logout()
        redirect(action: "login")
    }
}
