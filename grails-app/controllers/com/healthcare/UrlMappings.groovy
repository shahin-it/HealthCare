package com.healthcare

class UrlMappings {

    static mappings = {
        /*"/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }*/

        "/"{
            controller = {
                return  "page"
            }

            action = {
                return "view"
            }
        }

        "/"(controller: "dashboard", action: "controlPanel")
        "/$controller/index"()
        "/$controller/$action"()
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
