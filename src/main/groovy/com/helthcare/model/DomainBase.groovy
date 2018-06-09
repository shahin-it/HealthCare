package com.helthcare.model

import com.helthcare.User
import com.helthcare.util.AppUtil

abstract class DomainBase {
    User createdBy
    Date created

    def beforeValidate() {
        if (!this.created) {
            this.created = new Date().toGMT()
        }
        if (this.hasProperty("updated")) {
            this.updated = new Date().toGMT()
        }
        if(!this.createdBy) {
            this.createdBy = User.findById(AppUtil.loggedUser)
        }
    }
}
