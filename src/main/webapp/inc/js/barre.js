$(document).ready(function () {
  var trigger = $(".hamburger"),
    overlay = $(".overlay"),
    isClosed = false;

  trigger.click(function () {
    hamburger_cross();
  });

  function hamburger_cross() {
    if (isClosed == false) {
      overlay.hide();
      
      trigger.addClass("is-closed");
      isClosed = false;
    } else {
      overlay.show();
      
      trigger.addClass("is-closed");
      isClosed = false;
    }
  }

  $('[data-toggle="offcanvas"]').click(function () {
    $("#wrapper").toggleClass("toggled");
  });
});
