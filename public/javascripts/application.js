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
     
        // some expose tweaks
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

        onClose: function(event) {
          $('#tweet textarea').val('');
        }
    });

    // Attach event on reply
    $(".reply").click(function() {
        var id = $("a", this).attr("id");
        var screen_name = id.split('_')[1];
        $('#tweet textarea').val('@' + screen_name + ' ');
        $('#tweet textarea').focus();
        return false;
    })    

    // Attach event on reply
    $(".retweet").click(function() {
        var id = $("a", this).attr("id");
        var id_number = id.split('_', 3)[1];
        var text = $("#tweet_" + id_number + " .text").text();
        var screen_name = $("#tweet_" + id_number + " .who").text();
        $('#tweet textarea').val('RT: @' + screen_name + ': ' + text);
        $('#tweet textarea').focus()
        return false;
    })

    // Attach event on clicking on a tweet
    $(".tweet").click(function() {
        var id = $(this).attr("id");
        var id_number = id.split('_', 3)[1];
        $("#info_" +id_number).toggle('slow')

    })

    // Character limiter
    $("textarea#tweet").charCount();

    // Disable "send" button if over limit
    $("textarea#tweet").keyup(function() {
        if ($(this).val().length <= 140) {
            $('#tweet_submit').attr("disabled", false);
        } else {
            $('#tweet_submit').attr("disabled", true);
        }

    })

    // Activate the masonry plugin
    // $('#categories').masonry({ singleMode: true });

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

function closeOverlays() {
    jQuery("a.modalInput").each(function() {
        $('#tweet textarea').val('');
        jQuery(this).overlay().close();
    });
}


