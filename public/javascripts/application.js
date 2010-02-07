$(document).ready(function() {
  $('#twitter_create_list').click(function() {
    $('#twitter_create_list_form').slideToggle('slow', function() {
      // Animation complete.
    });
  });

  if ($("#draggable").length > 0 && $("#droppable").length > 0) {
    /**
     * Checks if we can drop more items to droppable
     */
    var is_draggable_active = function () {
      if ($("#droppable span").length < _subscriptions_per_user) {
        return true;
      } else {
        return false;
      }
    }

    // Initialization
    $("#draggable span, #droppable span").draggable({revert: true, cursor: 'move'});
    if (!is_draggable_active()) {
      $("#draggable span").draggable("disable").css({"cursor": "text"});
    }

    // Remove subscription
    $("#draggable").droppable({
        accept: "#droppable span",
        drop: function(event, ui) { 
          ui.draggable.appendTo(this).attr("style", "position: relative;");
          if (is_draggable_active()) {
            $("#draggable span").draggable("enable").css({"cursor": "move"});
          }
         var list_id = Number(ui.draggable.attr("id").match(/\d+/)[0], 10)
         $.post("subscriptions/" + list_id + ".js", { _method: "delete" });
        }
    });

    // Create subscription
    $("#droppable").droppable({
        accept: "#draggable span",
        drop: function(event, ui) {
          ui.draggable.appendTo(this).attr("style", "position: relative;");
          if (!is_draggable_active()) {
            $("#draggable span").draggable("disable").css({"cursor": "text"});
          }
          //alert("drop save");
         var list_id = Number(ui.draggable.attr("id").match(/\d+/)[0], 10)
         $.post("subscriptions.js", { list_id: list_id });
        }
    });
  }
});

function switch_to_tweets(category_id) {
    $("#" + category_id + " .users_link").removeClass("selected");
    $("#" + category_id + " .tweets_link").addClass("selected");
    $("#" + category_id + " .tweets").show('slow');
    $("#" + category_id + " .users").hide('slow');
}

function switch_to_users(category_id) {
    $("#" + category_id + " .users_link").addClass("selected");
    $("#" + category_id + " .tweets_link").removeClass("selected");
    $("#" + category_id + " .tweets").hide('slow');
    $("#" + category_id + " .users").show('slow');
}

