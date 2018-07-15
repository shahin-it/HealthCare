package com.healthcare.model

import com.healthcare.User
import com.healthcare.util.AppUtil

abstract class DomainBase {
    User createdBy
    Date created

    int week
    int month
    int year

    static mapping = {
        week formula: 'WEEK(created)'
        month formula: 'MONTH(created)'
        year formula: 'YEAR(created)'
    }

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

    def afterValidate() {
        if(this.hasErrors()) {

        }
    }
}
