package com.healthcare

import com.healthcare.util.AppUtil

class UITagLib {
    static namespace = "ui"

    def imageUpload = { attrs, body ->
        out << """<div class="form-row skui-image-chooser">
                    <div class="col-sm-6 form-group">
                        <label class="control-label">${attrs.label}</label>
                        <input class="form-control ${attrs.clazz}" type="file" name="${attrs.name}" accept="image/*" placeholder="Invoice Banner" max="${attrs.max ?: (5*1024*1024)}" data-value="${attrs.value}">
                    </div>
                    <div class="col-sm-6 form-group">
                        <label>Image</label>
                        <div class="form-preview"><img src="${attrs.value ? app.systemResourceBaseUrl() + attrs.value : ''}" class="skui-image-preview" height="35"></div>
                    </div>
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
        out << """<form class="form-inline create-edit-form filter-form d-inline-flex" role="form">
                    <label class="mr-sm-1">Filter</label>
                    <input name="createdFrom" readonly class="from form-control form-control-sm date-picker" placeholder="From date">
                    <input name="createdTo" readonly class="to form-control form-control-sm date-picker" id="exampleInputPassword2" placeholder="To date">
                    <div class="input-group">
                        <input type="text" name="searchText" class="form-control form-control-sm search-text ml-sm-1" placeholder="Search..." aria-describedby="button-addon2">
                        <button class="btn btn-sm clear-button" title="Clear Filter" type="reset"><i class="fas fa-backspace"></i></button>
                        <div class="input-group-append">
                            <button class="submit-button btn btn-sm btn-success mr-sm-2" type="button" id="button-addon2"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                """

        if(attrs.createBtn) {
            out << """<button class="add-new-button btn btn-sm btn-primary" type="button"><i class="fas fa-plus"></i> Add</button>"""
        }
        out << """</form>"""
    }
}
