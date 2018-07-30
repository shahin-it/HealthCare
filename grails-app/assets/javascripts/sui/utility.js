/**
 * Created by shahin on 05-Aug-16.
 */
var sui = {
    ajax: function(settings) {
        if (!settings) {
            return;
        }
        var response = settings.response
          , success = settings.success
          , error = settings.error;
        delete settings.response;
        delete settings.success;
        delete settings.error;
        $.extend(settings.data, {
            ajax: true
        })
        settings = $.extend({
            dataType: "json",
            success: function(resp) {
                response && response.call(this);
                if (sui.silentLogin(resp)) {
                    success && success.apply(this, arguments);
                }
            },
            error: function(errorObj) {
                response && response.call(this);
                if (sui.silentLogin(errorObj.responseText)) {
                    error && error.apply(this, arguments);
                }
            }
        }, settings);
        return $.ajax(settings);
    },
    ajaxForm: function(form, settings) {
        if (!settings) {
            return;
        }
        var response = settings.response
          , beforeSubmit = settings.beforeSubmit
          , success = settings.success
          , error = settings.error;
        delete settings.response;
        delete settings.beforeSubmit;
        delete settings.success;
        delete settings.error;
        settings = $.extend({
            type: "POST",
            dataType: "json",
            beforeSubmit: function(arr, $form, options) {
                arr.push({
                    name: "ajax",
                    value: true
                })
                if (form.triggerHandler("preSubmit") == false) {
                    return false;
                }
                if (beforeSubmit) {
                    beforeSubmit = beforeSubmit.apply(this, arguments);
                    if (beforeSubmit == false) {
                        return false
                    }
                }
            },
            success: function(resp, type) {
                response && response.call(this);
                if (sui.silentLogin(resp)) {
                    success && success.apply(this, arguments);
                }
            },
            error: function(errorObj) {
                response && response.call(this);
                if (sui.silentLogin(errorObj.responseText)) {
                    error && error.apply(this, arguments);
                }
            }
        }, settings)

        return form.ajaxForm(settings);
    },
    singleTab: function(container, data, config) {
        var _self = this;
        if (!container.is(".sui-tabular-content")) {
            return;
        }
        var filterForm = container.find(".filter-form");
        data = container.data = $.extend({
            offset: 0,
            max: app.maxResult,
            searchText: ""
        }, data, filterForm.serializeObject());

        config = $.extend({
            url: "#",
            beforeLoad: function() {},
            afterLoad: function() {}
        }, config);
        container.on("click", ".tab-reload", function() {
            container.reload();
        });
        container.on("click", ".filter-form button", function() {
            if (this.jq.is(".clear-button")) {
                filterForm[0].reset();
            }
            container.reload(filterForm.serializeObject());
        });
        container.on("keypress", ".filter-form input", function(e) {
            if (e.which == 13) {
                container.reload(filterForm.serializeObject());
            }
        });

        container.reload = function(reloadData) {
            var before = config.beforeLoad.apply(this, [data]);
            if (before == false) {
                return;
            }
            var reqData = $.extend(data, reloadData);
            container.loader();
            sui.ajax({
                method: "post",
                url: config.url,
                data: reqData,
                dataType: "html",
                response: function(resp) {
                    container.loader(false);
                },
                success: function(resp) {
                    resp = resp.jq;
                    if (resp.length) {
                        $.extend(container.data, reloadData);
                        var tableBody = container.find(".tabular-body");
                        tableBody.html(resp.find(".tabular-body").html());
                        tableBody.updateUi();
                        container.find(".filter-form").prev("input").val(reqData.searchText);
                        _self.pagination(container);
                        config.afterLoad.apply(this, arguments);
                    }
                }
            });
        }
        ;
        _self.pagination(container);
        return $.extend(config, {
            reload: function() {
                container.reload();
            }
        });
    },
    pagination: function(container) {
        var pagination = container.find(".pagination");
        var count = parseInt(pagination.data("count"));
        var data = $.extend({
            offset: 0,
            max: app.maxResult
        }, container.data);
        if (!count) {
            return
        }
        if (data.max == count) {
            data.offset = 0
        }
        pagination.twbsPagination({
            startPage: (data.offset / data.max) + 1,
            visiblePages: 3,
            initiateStartPageClick: false,
            totalPages: Math.ceil(count / data.max),
            prev: "Prev",
            onPageClick: function(evt, offset) {
                data.offset = (offset - 1) * data.max;
                container.reload(data);
            }
        });
    },
    highlight: function(item, time, blink) {
        item.addClass("highlight-row" + (blink ? " blink" : ""));
        setTimeout(function() {
            item.removeClass("highlight-row" + (blink ? " blink" : ""));
        }, time ? time : 3000);
    },
    errorHighLight: function(item, time) {
        item.addClass("error-highlight");
        setTimeout(function() {
            item.removeClass("error-highlight");
        }, time ? time : 1000);
    },
    notify: function(message, type) {
        type = type || "info"
        type = type == "error" ? "danger" : type;
        $.notify({
            title: type.toUpperCase() + ": ",
            message: message,
            icon: 'fas fas-check-circle'
        }, {
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
    renderCreateEdit: function(url, data, config) {
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
        if (typeof url != "string") {
            content = url;
        }
        var panel = $('<div class="content-box-large sui-create-edit-panel ' + config.class + '"><span class="close fas fa-window-close"></span><div class="panel-body"></div></div>');
        var body = panel.find(".panel-body");
        if (content && content.length) {
            panelLoaded(content);
        } else {
            body.loader();
            sui.ajax({
                url: url,
                data: data,
                dataType: "html",
                response: function() {
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
            form.find(".save-and-new").click(function() {
                saveAndNew = true;
                form.submit();
            });
            sui.ajaxForm(form, {
                type: "POST",
                dataType: "json",
                beforeSubmit: function(arr, $form, options) {
                    if (config.preSubmit) {
                        return config.preSubmit.apply(this, arguments);
                    }
                    if (form.triggerHandler("preSubmit") == false) {
                        return false;
                    }
                    form.loader();
                },
                success: function(resp, type) {
                    if (resp && resp.message) {
                        sui.notify(resp.message, resp.status);
                    }
                    if (config.success) {
                        config.success.apply(this, arguments);
                    }
                    if (saveAndNew) {
                        form[0].reset();
                        saveAndNew = false;
                    } else {
                        close();
                    }
                },
                response: function() {
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
        var content = ""
        config = $.extend({
            class: "",
            title: "",
            width: 600,
            size: "modal-lg",
            preSubmit: undefined,
            loaded: undefined
        }, config);
        config.size = config.size == "small" ? "modal-sm" : "modal-lg"
        data = $.extend({
            id: null
        }, data);
        if (typeof url != "string") {
            content = url;
        }
        var popup = $('<div class="modal fade sui-edit-popup ' + config.class + '" role="dialog">\
            <div class="modal-dialog modal-content ' + config.size + '">\
                   <div class="modal-header">\
                        <button type="button" class="close" data-dismiss="modal">&times;</button>\
                        <h4 class="modal-title popup-title">' + config.title + '</h4>\
                    </div>\
                    <div class="modal-body popup-body"></div>\
                    <div class="modal-footer popup-footer">\
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>\
                    </div>\
                </div>\
            </div>');

        $("body").append(popup);

        popup.on("show.bs.modal", function() {

            var body = popup.find(".popup-body");
            if (content && content.length) {
                popupLoaded(content);
            } else {
                body.loader();
                sui.ajax({
                    url: url,
                    data: data,
                    dataType: "html",
                    response: function() {
                        body.loader(false);
                    },
                    success: function(resp) {
                        popupLoaded(resp.jq);
                    }
                });
            }

            function popupLoaded(content) {

                var title = content.find(".popup-title");
                if (title.length) {
                    popup.find(".popup-title").html(title);
                } else {
                    popup.find(".popup-title").html(config.title);
                }
                var form = content.find("form:first").attr("id", "edit-popup-form");
                popup.find(".popup-footer").prepend(content.find(".edit-popup-submit").attr("form", "edit-popup-form"));
                body.html(content);
                content.updateUi();

                sui.ajaxForm(form, {
                    type: "POST",
                    dataType: "json",
                    beforeSubmit: function(arr, $form, options) {
                        form.loader();
                        if (config.preSubmit) {
                            return config.preSubmit.apply(this, arguments);
                        }
                    },
                    success: function(resp, type) {
                        if (resp && resp.message) {
                            sui.notify(resp.message, resp.status);
                        }
                        if (config.success) {
                            config.success.apply(this, arguments);
                        }
                        popup.modal("hide");
                    },
                    response: function() {
                        form.loader(false);
                        if (config.response) {
                            config.response.apply(this);
                        }
                    }
                });
                config.loaded && config.loaded.apply(popup, body);
            }
        });
        popup.on("hidden.bs.modal", function() {
            var _popup = this.jq;
            config.close && config.close.apply(this, arguments);
            _popup.removeData();
            _popup.remove();

        });
        popup.modal({
            backdrop: true,
            keyboard: true,
            show: true
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
        }).then((isConfirm)=>{
            if (isConfirm.value) {
                yes && yes();
                // swal("Deleted!", "Your imaginary file has been deleted.", "success");
            } else {
                no && no();
                // swal("Cancelled", "Your imaginary file is safe :)", "error");
            }
        }
        );
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
                    if (resp && resp.message) {
                        sui.notify(resp.message, resp.status);
                    }
                    if (success) {
                        success.apply(this, arguments);
                    }
                }
            })
        });
    },
    accordion: function(panel) {
        if (!panel.is(".sui-accordion-panel")) {
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
    imageInput: function(inputControl) {
        var fileInput = inputControl.find("input[type=file]")
        var imgPrev = inputControl.find(".sui-image-preview")

        fileInput.on("change", function(evt) {
            var files = evt.target.files
            if (!files.length) {
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
    toggle: function(container) {
        var inputs = container.find("[data-toggle-target]");
        if (!inputs.length) {
            return
        }

        inputs.each(function() {
            var input = this.jq;
            var target = input.attr("data-toggle-target");
            var selected = container.find("[class^='" + target + "-']")
            if (!selected.hasClass(target + "-" + input.val())) {
                selected.hide();
            }

            if (input.is("select")) {
                input.change(function() {
                    container.find("[class^='" + target + "-']").hide().find("input, select, textarea").attr("disabled", true);
                    container.find("." + target + "-" + input.val()).show().find("input, select, textarea").removeAttr("disabled");
                }).trigger("change")
            }
        })
    },
    silentLogin: function(resp) {
        try {
            resp = $(resp)
        } catch (ex) {
            resp = $()
        }
        if (resp.is(".silent-login-popup")) {
            sui.editPopup(resp)
            return false
        }
        return true
    },
    ajaxGlobalHook: function(hookName, callback) {
        var origOpen = XMLHttpRequest.prototype.open;
        hookName = hookName ? hookName : "load"
        XMLHttpRequest.prototype.open = function(evt) {
            console.log('request started!');
            this.addEventListener(hookName, function(_evt) {
                // console.log('request completed!');
                // console.log(this.readyState); //will always be 4 (ajax is completed successfully)
                // console.log(this.responseText); //whatever the response was
                var resp = callback.call(this)
                if (resp == false) {
                    return false
                }
            });
            origOpen.apply(this, arguments);
        }
        ;
    }
}
