$(document).ready(function(){


  $(".submenu > a").click(function(e) {
    e.preventDefault();
    var $li = $(this).parent("li");
    var $ul = $(this).next("ul");

    if($li.hasClass("open")) {
      $ul.slideUp(350);
      $li.removeClass("open");
    } else {
      $(".nav > li > ul").slideUp(350);
      $(".nav > li").removeClass("open");
      $ul.slideDown(350);
      $li.addClass("open");
    }
  });


  var dataTables = $(".jq-data-table");
  dataTables.each(function () {
      var table = this.jq;
      table.dataTable({
          "processing": true,
          "serverSide": true,
          "ajax": table.attr("data-processing-url"),
          "deferLoading": 57
      });
  })
});