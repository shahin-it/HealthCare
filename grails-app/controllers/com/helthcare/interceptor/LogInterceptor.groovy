package com.helthcare.interceptor

import com.helthcare.util.AppUtil


class LogInterceptor {

    LogInterceptor() {
        matchAll().excludes(controller: "dashboard", action: "login").excludes(controller: "dashboard", action: "doLogin")
    }

    boolean before() {
        def session = AppUtil.session
        if(session.user == null) {
            redirect(controller: "dashboard", action: "login")
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
