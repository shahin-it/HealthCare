package com.helthcare

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "dashboard", action: "controlPanel")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
