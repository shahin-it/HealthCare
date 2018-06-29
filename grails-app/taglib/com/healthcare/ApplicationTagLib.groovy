package com.healthcare

import com.healthcare.util.AppUtil
import grails.util.Holders

import javax.annotation.PostConstruct

class ApplicationTagLib {
    static namespace = "app"

    String appVersion

    @PostConstruct
    public void init() {
        appVersion = Holders.grailsApplication.metadata["info.app.version"]
    }

    def baseUrl = {attrs, body ->
        out << "/"
    }

    def relativeBaseUrl = { attrs, body ->
        if(request.always_absolute_url) {
            out << baseUrl(attrs)
        } else {
            out << getContextPath() + "/static/"
        }
    }

    def systemResourceBaseUrl = { attrs, body ->
        String scheme = request.scheme
        Map systemResourceUrl = [
                scheme: scheme,
                url: app.relativeBaseUrl()
        ]
        out << systemResourceUrl.url
    }

    def resourceUrl = { attrs, body ->
        out << systemResourceBaseUrl() + "resources/"
    }

    def getContextPath = {attrs, body ->
        String contextPath = AppUtil.servletContext.contextPath
        out << (contextPath == "/" ? "" : contextPath)
    }


    def featureScript = { attrs, body ->

    }

    def javascript = { attrs, body ->
        out << "<script type='text/javascript' src='"
        out << systemResourceBaseUrl()
        out << "vendor/" + attrs.src
        out << "?v="
        out << appVersion
        out << "'></script>";
    }

    def stylesheet = { attrs, body ->
        out << "<link rel='stylesheet' type='text/css' href='"
        out << systemResourceBaseUrl()
        out << "vendor/" + attrs.href
        out << "?v="
        out << appVersion
        out << "'>"
    }
}
