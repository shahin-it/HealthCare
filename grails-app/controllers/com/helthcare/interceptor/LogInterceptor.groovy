package com.helthcare.interceptor

import com.helthcare.util.AppUtil


class LogInterceptor {

    LogInterceptor() {
        matchAll().excludes(controller: "dashboard", action: "login").excludes(controller: "dashboard", action: "doLogin")
    }

    boolean before() {
        def session = AppUtil.session
        if(session.user == null) {
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
