package com.healthcare

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class SettingService {

    void saveConfig(GrailsParameterMap params, List excludes = []) {
        String type = params.type
        params[type].each { k, v ->
            if(excludes.contains(k)) {
                return
            }
            Preference pref = Preference.findByTypeAndConfigKey(type, k)
            if(pref) {
                pref.value = v
                pref.save()
            } else {
                new Preference(type: type, configKey: k, value: v).save()
            }
        }
    }

    def getConfig(String type, String key = null) {
        if(key) {
            return Preference.findByTypeAndConfigKey(type, key).value
        } else {
            return Preference.findAllByType(type).collectEntries{[(it.configKey): it.value]}
        }
    }
}
