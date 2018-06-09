package com.helthcare

import com.helthcare.util.AppUtil
import grails.gorm.transactions.NotTransactional
import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpSession

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
