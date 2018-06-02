package com.helthcare

import com.helthcare.util.MetaClassUtil
import grails.util.Holders

class BootStrap {

    def init = { servletContext ->
        MetaClassUtil.init()
        Holders.grailsApplication.getArtefacts("Domain")*.clazz.each {
            try {
                it.initialize()
            } catch (MissingMethodException e) {
            }
        }
    }
    def destroy = {
    }
}