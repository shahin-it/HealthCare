package com.healthcare

class UITagLib {
    static namespace = "ui"

    def imageUpload = { attrs, body ->
        out << """<div class="form-group sui-image-chooser">
                    <label class="col-sm-2 control-label">${attrs.label}</label>
                    <div class="col-sm-4">
                        <input class="form-control ${attrs.clazz}" type="file" name="${attrs.name}" accept="image/*" placeholder="Invoice Banner" max="${attrs.max ?: (5*1024*1024)}" value="${attrs.value}">
                    </div>
                    <div class="col-sm-6">${asset.image(src: "system/banner.jpg", class: "sui-image-preview", height: "35")}</div>
                </div>"""
    }
}
