package com.healthcare

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

    def systemResourceBaseUrl = { attrs, body ->
        String scheme = request.scheme;
        Map systemResourceUrl = [
                scheme: scheme,
                url: app.baseUrl()
        ]
        out << systemResourceUrl.url
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
