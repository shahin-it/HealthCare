(function($) {
/*    $(document).ajaxStart(function() {
        $('#spinner').fadeIn();
    }).ajaxStop(function() {
        $('#spinner').fadeOut();
    });*/
    var layoutBody = $(".loayout-body");

    var profile = layoutBody.find(".page-content.profile")
    profile.find("select.user-selection").change(function () {
        location.href = app.base + "setting/profile?selected=" + this.jq.val()
    })

    var form = layoutBody.find(".create-edit-form");
    skui.ajaxForm(form, {
        type: "POST",
        dataType: "json",
        beforeSubmit: function(arr, $form, options) {
            form.loader();
        },
        response: function() {
            form.loader(false);
        },
        success: function(resp, type) {
            if(resp && resp.message) {
                skui.notify(resp.message, resp.status);
            }
        }
    });
})(jQuery);
