package com.helthcare.model

import com.helthcare.User

abstract class DomainBase {
    User createdBy
    Date created

    def beforeValidate() {
        if (!this.created) {
            this.created = new Date().toGMT()
        }
        if (!this.updated) {
            this.updated = new Date().toGMT()
        }
        if(!this.createdBy) {

        }
    }
}
