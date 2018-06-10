package com.healthcare

import com.healthcare.util.AppUtil
import grails.gorm.transactions.NotTransactional
import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    @NotTransactional
    void logout() {
        AppUtil.session.removeAttribute("admin")
    }

    void registerAdminSession(User user) {
        def session = AppUtil.session
        session.admin = user.id
    }
}
