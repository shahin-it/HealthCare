package com.helthcare.interceptor

import com.helthcare.util.AppUtil


class LogInterceptor {

    LogInterceptor() {
        matchAll().excludes(controller: "dashboard", action: "login").excludes(controller: "dashboard", action: "doLogin")
    }

    boolean before() {
        if(AppUtil.loggedUser == null) {
            redirect(uri: "/dashboard/login")
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
