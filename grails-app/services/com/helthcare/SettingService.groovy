package com.helthcare

import com.helthcare.pathology.Service
import grails.gorm.transactions.Transactional

@Transactional
class SettingService {

    Boolean saveService(Service service, Map params) {
        service.save()
    }
}
