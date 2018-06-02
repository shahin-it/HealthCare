package com.helthcare.interceptor

import com.helthcare.util.AppUtil


class LogInterceptor {

    LogInterceptor() {
        matchAll()
    }

    boolean before() {
        def session = AppUtil.session
        if(session.user == null) {
            redirect(controller: "dashboard", action: "login")
            return false
        }

        return true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
