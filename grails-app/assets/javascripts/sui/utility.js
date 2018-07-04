/**
 * Created by shahin on 05-Aug-16.
 */
var sui = {
    ajax: function(settings) {
        if(!settings) {
            return;
        }
        var response = settings.response, success = settings.success, error = settings.error;
        delete settings.response;
        delete settings.success;
        delete settings.error;
        settings = $.extend({
            dataType: "json",
            data: {ajax: true},
            success: function() {
                response && response.call(this);
                success && success.apply(this, arguments);
            },
            error: function() {
                response && response.call(this);
                error && error.apply(this, arguments);
            }
        }, settings);
        return $.ajax(settings);
    },
    singleTab: function(container, data, config) {
        var _self = this;
        if(!container.is(".sui-tabular-content")) {
            return;
        }
        data = container.data = $.extend({
            offset: 0,
            max: app.maxResult,
            searchText: ""
        }, data);

        config = $.extend({
            url: "#",
            beforeLoad: function() {},
            afterLoad: function() {}
        }, config);
        container.on("click", ".tab-reload", function() {
            container.reload();
        });
        container.on("click", ".search-form button", function() {
            container.reload({searchText: this.jq.prev("input").val()});
        });
        container.on("keypress", ".search-form input", function (e) {
            if (e.which == 13) {
                container.reload({searchText: this.jq.val()});
            }
        });

        container.reload = function(reloadData) {
            var before = config.beforeLoad.apply(this, [data]);
            if(before == false) {
                return;
            }
            var reqData = $.extend({ajax: true}, data, reloadData);
            container.loader();
            sui.ajax({
                url: config.url,
                data: reqData,
                dataType: "html",
                complete: function(resp) {
                    container.loader(false);
                },
                success: function(resp) {
                    resp = resp.jq;
                    if(resp.length) {
                        $.extend(container.data, reloadData);
                        var tableBody = container.find(".tabular-body");
                        tableBody.html(resp.find(".tabular-body").html());
                        tableBody.updateUi();
                        container.find(".search-form").prev("input").val(reqData.searchText);
                        _self.pagination(container);
                        config.afterLoad.apply(this, arguments);
                    }
                }
            });
        };
        _self.pagination(container);
        return $.extend(config, {
            reload: function() {
                container.reload();
            }
        });
    },
    pagination: function (container) {
        var pagination = container.find(".pagination");
        var count = parseInt(pagination.data("count"));
        var data = $.extend({offset: 0, max: app.maxResult}, container.data);
        if(!count) {return}
        if(data.max == count) { data.offset = 0 }
        pagination.twbsPagination({
            startPage: (data.offset/data.max) + 1,
            visiblePages: 3,
            initiateStartPageClick: false,
            totalPages: Math.ceil(count/data.max),
            prev: "Prev",
            onPageClick: function (evt, offset) {
                data.offset = (offset-1) * data.max;
                container.reload(data);
            }
        });
    },
    highlight: function (item, time, blink) {
        item.addClass("highlight-row" + (blink ? " blink" : ""));
        setTimeout(function () {
            item.removeClass("highlight-row" + (blink ? " blink" : ""));
        }, time ? time : 3000);
    },
    errorHighLight: function(item, time) {
        item.addClass("error-highlight");
        setTimeout(function () {
            item.removeClass("error-highlight");
        }, time ? time : 1000);
    },
    notify: function(message, type) {
        type = type || "info"
        type = type == "error" ? "danger" : type;
        $.notify({
            title: type.toUpperCase() + ": ",
            message: message,
            icon: 'glyphicon glyphicon-ok-circle'
        },{
            type: type,
            placement: {
                from: "top",
                align: "center"
            },
            animate: {
                enter: 'animated fadeInDown'
            }
        });
    },
    renderCreateEdit: function (url, data, config) {
        var content, _self = this;
        config = $.extend({
            target: $(".sui-tabular-content").first(),
            class: "sidebar-mini fixed",
            title: "",
            popupLoad: null,
            preSubmit: null
        }, config);
        data = $.extend({
            id: null
        }, data);
        if(typeof url != "string") {
            content = url;
        }
        var panel = $('<div class="content-box-large sui-create-edit-panel '+config.class+'"><span class="close glyphicon glyphicon-remove"></span><div class="panel-body"></div></div>');
        var body = panel.find(".panel-body");
        if(content && content.length) {
            panelLoaded(content);
        } else {
            body.loader();
            sui.ajax({
                url: url,
                data: data,
                dataType: "html",
                complete: function() {
                    body.loader(false);
                },
                success: function(resp) {
                    resp = resp.jq;
                    panelLoaded(resp);
                    config.popupLoad && config.popupLoad.call(panel, resp);
                }
            });
        }

        function panelLoaded(content) {
            config.target.hide();
            config.target.after(panel);
            panel.find(".panel-body").before(content.find(".panel-heading"));
            body.append(content);
            content.updateUi();
            var form = panel.find("form:first");
            var saveAndNew = false;
            form.find(".save-and-new").click(function () {
                saveAndNew = true;
                form.submit();
            });
            form.ajaxForm({
                type: "POST",
                dataType: "json",
                beforeSubmit: function(arr, $form, options) {
                    if(config.preSubmit) {
                        return config.preSubmit.apply(this, arguments);
                    }
                    if(form.triggerHandler("preSubmit") == false) {
                        return false;
                    }
                    form.loader();
                },
                success: function(resp, type) {
                    form.loader(false);
                    if(resp && resp.message) {
                        sui.notify(resp.message, resp.status);
                    }
                    if(config.success) {
                        config.success.apply(this, arguments);
                    }
                    if(saveAndNew) {
                        form[0].reset();
                        saveAndNew = false;
                    } else {
                        close();
                    }
                },
                error: function() {
                    form.loader(false);
                }
            });
            panel.find(".close, .cancel").click(function() {
                close();
            })
            config.loaded && config.loaded.apply(panel, body);
        }
        function close() {
            panel.remove();
            config.target.show();
        }
    },
    editPopup: function(url, title, data, config) {
        var content
        config = $.extend({
            class: "",
            title: "",
            width: 600,
            preSubmit: null
        }, config);
        data = $.extend({
            id: null
        }, data);
        if(typeof url != "string") {
            content = url;
        }
        var popup = $('<div class="sui-edit-popup '+config.class+'"><div class="popup-body"></div></div>');
        $("body").append(popup);
        popup = popup.dialog({
            title: title ? title : config.title,
            width: config.width,
            modal: true,
            open: function(evt, ui) {
                var body = popup.find(".popup-body");
                if(content && content.length) {
                    popupLoaded(content);
                } else {
                    body.loader();
                    sui.ajax({
                        url: url,
                        data: data,
                        dataType: "html",
                        complete: function() {
                            body.loader(false);
                        },
                        success: function(resp) {
                            popupLoaded(resp.jq);
                        }
                    });
                }

                function popupLoaded(content) {
                    body.html(content);
                    content.updateUi();
                    popup.dialog("option", "position", popup.dialog( "option", "position" ));
                    var form = popup.find("form:first");
                    form.ajaxForm({
                        type: "POST",
                        dataType: "json",
                        beforeSubmit: function(arr, $form, options) {
                            form.loader();
                            if(config.preSubmit) {
                                return config.preSubmit.apply(this, arguments);
                            }
                        },
                        success: function(resp, type) {
                            form.loader(false);
                            if(config.response) {
                                config.response.apply(this);
                            }
                            if(resp && resp.message) {
                                sui.notify(resp.message, resp.status);
                            }
                            if(config.success) {
                                config.success.apply(this, arguments);
                            }
                            popup.dialog("close");
                        },
                        error: function() {
                            form.loader(false);
                            if(config.response) {
                                config.response.apply(this);
                            }
                        }
                    });
                    form.find(".btn-cancel").click(function() {
                        popup.dialog("close");
                    })
                    config.loaded && config.loaded.apply(popup, body);
                }
            },
            close: function(evt, ui) {
                config.close && config.close.apply(this, arguments);
                popup.remove();
            }
        });
        return popup;
    },
    confirm: function(message, yes, no) {
        swal({
            title: message,
            text: "You will not be able to recover this!",
            type: "warning",
            showCancelButton: true,
            showCloseButton: true,
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            closeOnConfirm: true,
            closeOnCancel: true
        }).then((isConfirm) => {
            if (isConfirm.value) {
                yes && yes();
                // swal("Deleted!", "Your imaginary file has been deleted.", "success");
            } else {
                no && no();
                // swal("Cancelled", "Your imaginary file is safe :)", "error");
            }
        });
    },
    confirmAjax: function(url, title, data, success) {
        this.confirm(title, function() {
            "body".jq.loader();
            sui.ajax({
                url: url,
                dataType: "json",
                data: data,
                response: function() {
                    "body".jq.loader(false);
                },
                success: function(resp) {
                    if(resp && resp.message) {
                        sui.notify(resp.message, resp.status);
                    }
                    if(success) {
                        success.apply(this, arguments);
                    }
                }
            })
        });
    },
    accordion: function(panel) {
        if(!panel.is(".sui-accordion-panel")) {
            return
        }
        panel.expand = function(label) {
            panel.find(".sui-accordion-label").removeClass("expanded");
            panel.find(".sui-accordion-item").removeClass("expanded").hide();
            label.addClass("expanded");
            label.next(".sui-accordion-item").addClass("expanded").show();
        }
        panel.expand(panel.find(".sui-accordion-label:first"));
        panel.on("click", ".sui-accordion-label", function() {
            panel.expand(this.jq);
        })
        return panel;
    },
    imageInput: function (inputControl) {
        var fileInput = inputControl.find("input[type=file]")
        var imgPrev = inputControl.find(".sui-image-preview")

        fileInput.on("change", function (evt) {
            var files = evt.target.files
            if(!files.length) {
                return
            }
            var reader = new FileReader()
            reader.onload = function(frEvent) {
                imgPrev.attr("src", frEvent.target.result)
            }
            reader.readAsDataURL(files[0])
        })
        var imgData = fileInput
    },
    toggle: function (container) {
        var inputs = container.find("[data-toggle-target]");
        if(!inputs.length) {
            return
        }

        inputs.each(function () {
            var input = this.jq;
            var target = input.attr("data-toggle-target");
            var selected = container.find("[class^='" + target + "-']")
            if(!selected.hasClass(target + "-" + input.val())) {
                selected.hide();
            }

            if(input.is("select")) {
                input.change(function () {
                    container.find("[class^='" + target + "-']").hide().find("input, select, textarea").attr("disabled", true);
                    container.find("." + target + "-" + input.val()).show().find("input, select, textarea").removeAttr("disabled");
                }).trigger("change")
            }
        })
    }
}