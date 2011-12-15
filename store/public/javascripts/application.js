// Could be replaced by something like jquery-throttle
$(document).ready(function() {
  var submit_timer = null;
  $("#search").keydown(function() {
    if (!!submit_timer) {
      clearTimeout(submit_timer);
    }

    var field = this;
    submit_timer = setTimeout(function() {
      $(field).parents("form").submit();
    }, 500);
  });
});
