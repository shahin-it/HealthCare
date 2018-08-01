package com.healthcare

import com.healthcare.util.AppUtil

class UITagLib {
    static namespace = "ui"

    def imageUpload = { attrs, body ->
        out << """<div class="form-group sui-image-chooser">
                    <label class="col-sm-2 control-label">${attrs.label}</label>
                    <div class="col-sm-4">
                        <input class="form-control ${attrs.clazz}" type="file" name="${attrs.name}" accept="image/*" placeholder="Invoice Banner" max="${attrs.max ?: (5*1024*1024)}" data-value="${attrs.value}">
                    </div>
                    <div class="col-sm-6"><img src="${attrs.value ? app.systemResourceBaseUrl() + attrs.value : ''}" class="sui-image-preview" height="35"></div>
                </div>"""
    }

    def addressFieldSet = { attrs, body ->
        out << g.include(view: "/template/addressField.gsp", model: [domain: attrs.domain ?: [:], perfix: attrs.prefix])
    }

    def fieldSet = { attrs, body ->
        out << """<fieldset><legend>${attrs.legend}</legend>"""
        out << body()
        out << """</fieldset>"""
    }

    def isAdmin = { attrs, body ->
        if(AppUtil.currentUser.isAdmin) {
            out << body()
        }
    }

    def basicTableFilter = { attrs, body ->
        out << """<form class="form-inline create-edit-form filter-form justify-content-lg-end" role="form">
                        <label class="mr-sm-1">Filter</label>
                        <input name="createdFrom" readonly class="from form-control form-control-sm date-picker" placeholder="From date">
                        <input name="createdTo" readonly class="to form-control form-control-sm date-picker" id="exampleInputPassword2" placeholder="To date">
                        <input type="text" name="searchText" class="search-text form-control ml-sm-1 form-control-sm" placeholder="Search anything"/>
                        <button class="btn btn-sm clear-button btn-warning" title="Clear Filter" type="reset"><i class="fas fa-backspace"></i></button>
                        <button class="btn btn-sm submit-button btn-default mr-sm-2" type="button">Search</button>"""

        if(attrs.createBtn) {
            out << """<button class="add-new-button btn btn-sm btn-primary" type="button"><i class="fas fa-plus"></i> Add</button>"""
        }
        out << """</form>"""
    }
}
