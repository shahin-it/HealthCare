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
})(jQuery);
