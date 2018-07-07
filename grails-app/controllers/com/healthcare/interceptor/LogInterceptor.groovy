package com.healthcare.interceptor

import com.healthcare.util.AppUtil


class LogInterceptor {

    LogInterceptor() {
        matchAll().excludes(controller: "dashboard", action: "login").excludes(controller: "dashboard", action: "doLogin")
    }

    boolean before() {
        if(AppUtil.loggedUser == null) {
            if(params.ajax == "true") {
                render(view: "/page/silentLogin")
            } else {
                redirect(uri: "/dashboard/login?referrer=" + request.requestURI)
            }
            return false
        }
        AppUtil.servletContext = servletContext
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
