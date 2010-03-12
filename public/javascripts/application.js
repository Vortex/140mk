$(document).ready(function() {
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

    // Overlay for tweeting
    var triggers = $("a.modalInput").overlay({      
        // custom top position
        top: 272,
     
        // some expose tweaks suitable for facebox-looking dialogs
        expose: {

            // you might also consider a "transparent" color for the mask
            color: '#fff',

            // load mask a little faster
            loadSpeed: 200,

            // highly transparent
            opacity: 0.5
        },

        // disable this for modal dialog-type of overlays
        closeOnClick: false,

        close: 'blah'
    });

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

