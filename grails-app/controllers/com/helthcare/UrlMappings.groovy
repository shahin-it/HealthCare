package com.helthcare

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "dashboard", action: "dashboard")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
