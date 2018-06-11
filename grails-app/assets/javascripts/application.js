(function($) {
/*    $(document).ajaxStart(function() {
        $('#spinner').fadeIn();
    }).ajaxStop(function() {
        $('#spinner').fadeOut();
    });*/
    var layoutBody = $(".loayout-body")

    var profile = layoutBody.find(".page-content.profile")
    profile.find("select.user-selection").change(function () {
        location.href = app.base + "setting/profile?selected=" + this.jq.val()
    })

    var form = layoutBody.find(".create-edit-form");
    form.ajaxForm({
        type: "POST",
        dataType: "json",
        beforeSubmit: function(arr, $form, options) {
            form.loader();
        },
        success: function(resp, type) {
            form.loader(false);
            if(resp && resp.message) {
                sui.notify(resp.message, resp.status);
            }
        },
        error: function() {
            form.loader(false);
        }
    });
})(jQuery);
