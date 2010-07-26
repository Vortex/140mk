var overlayObject;
var overlayOptions = {
        // custom top position
        top: 272,

        target: '#tweet',

        // turn on API
        api: true,

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
    }

// Endless page
var current_page = 2;

var nearBottomOfPage = function (){
  return scrollDistanceFromBottom() < 150;
}

var scrollDistanceFromBottom = function (argument){
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

var pageHeight = function(){
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}

var checkScroll = function (url) {
  if (nearBottomOfPage()) {
    $.ajax({
      type: "GET",
      url: url + _current_id + '.js',
      //beforeSend: function (xhr) { xhr.setRequestHeader('Accept', 'text/javascript') },
      //dataType: "script",
      data: "page=" + current_page,
      success: function (result) {
        //$('#loading').hide()

        //result = eval('(' + text + ')');
        var divs = $('#category_show .tweets');

        // append tweets
        if (result.tweets.length > 1) {
          $(divs[0]).append(result.tweets);
        }

        // append users
        if (result.users.length > 1) {
          $(divs[1]).append(result.users);
        }

        // continue checking scroll position if of tweets or users is not blank
        if (result.tweets.length > 1 || result.users.length > 1) {
          current_page += 1;
          checkScroll(url);
        }
      },
      loading: function(){
        //$('#loading').show()
      }
    });
  } else {
    setTimeout(function () {checkScroll(url)}, 250);
  }
}


$(document).ready( function () {
    if ($('body').attr('id') === 'categories_show') {
      checkScroll('/categories/'); // start checking scroll position
    }

    if ($('body').attr('id') === "tags_show") {
      checkScroll('/tags/'); // start checking scroll position
    }

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
         var category_id = Number(ui.draggable.attr("id").match(/\d+/)[0], 10)
         $.post("subscriptions/" + category_id + ".js", { _method: "delete" });
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
         var category_id = Number(ui.draggable.attr("id").match(/\d+/)[0], 10)
         $.post("subscriptions.js", { category_id: category_id });
        }
    });
    }

    // Overlay for tweeting
    overlayObject = $("a.modalInput").overlay(overlayOptions);

    // .bind('click', function() { triggers.load() });

    // Attach event on reply
    $(".reply").live('click', function() {
        var id = $("a", this).attr("id");
        var screen_name = id.split('_')[1];
        $('#tweet textarea').val('@' + screen_name + ' ');
        $('#tweet textarea').focus();
        return false;
    });

    // Attach event on reply
    $(".retweet").live('click', function(event) {
        var id = $("a", this).attr("id");
        var id_number = id.split('_', 3)[1];
        var text = $("#tweet_" + id_number + " .text").text();
        var screen_name = $("#tweet_" + id_number + " .who").text();
        $('#tweet textarea').val('RT: @' + screen_name + ': ' + text);
        $('#tweet textarea').focus();
        return false;
    });

    // Attach event on clicking on a tweet
    $(".tweet .handle").live('click', function() {
        $(this).toggleClass('opened');
        var id = $(this).parent().attr("id");
        var id_number = id.split('_', 3)[1];
        var id_category = id_number.split('-')[0];
        $("#info_" +id_number).toggle('slow');
        $("#tweets_" + id_category).attr('id', "tweets_" + id_category + "_clicked");
    });

    $('.user .handle').live('click', function() {
        $(this).toggleClass('opened');
        var id = $(this).parent().attr("id");
        var id_number = id.split('_', 3)[1];
        $("#info_" +id_number).toggle('slow')        
    });

    // Character limiter
    $("textarea#tweet").charCount();

    // Disable "send" button if over limit
    $("textarea#tweet").keyup(function() {
        if ($(this).val().length <= 140) {
            $('#tweet_submit').attr("disabled", false);
        } else {
            $('#tweet_submit').attr("disabled", true);
        }

    });

    // Activate the masonry plugin
    // $('#categories').masonry({ singleMode: true });

    // Initialize pagination for trending tags
    $('#hashtag_filter .left').attr('disabled', true);
    $('#hashtag_filter .left').addClass("disabled");

    $('#hashtag_filter .left').live('click', function() {
        var hashtagVal = $(this).attr('data-hashtag');
        var offsetVal = $(this).attr('data-offset');
        offsetVal =  parseInt(offsetVal) - 5;

        if (offsetVal < 0) { offsetVal = 0 }

        $(this).attr('data-offset', offsetVal);
        $('#hashtag_filter .right').attr('data-offset', offsetVal);
        $.post('/tweets/by_hashtag', { hashtag: hashtagVal, offset: offsetVal}, function(data) {
            if (offsetVal == 0) {
                $('#tweets_hashtag_clicked').attr('id', 'tweets_hashtag');
                $('#tweets_hashtag').html(data);
                $('#hashtag_filter .left').attr('disabled', true);
                $('#hashtag_filter .left').addClass("disabled")
            } else {
                $('#tweets_hashtag_clicked').html(data);
            }
            reBindOverlays();
        });
        return false;
    });

    $('#hashtag_filter .right').live('click', function() {
        var hashtagVal = $(this).attr('data-hashtag');
        var offsetVal = $(this).attr('data-offset');
        offsetVal =  parseInt(offsetVal) + 5;
        $(this).attr('data-offset', offsetVal);
        $('#hashtag_filter .left').attr('data-offset', offsetVal);
        $.post('/tweets/by_hashtag', { hashtag: hashtagVal, offset: offsetVal}, function(data, statusText) {
            $('#tweets_hashtag').attr('id', 'tweets_hashtag_clicked');
            $('#tweets_hashtag_clicked').html(data);
            $('#hashtag_filter .left').attr('disabled', false);
            $('#hashtag_filter .left').removeClass("disabled");
            reBindOverlays();
        });

        return false;
    });

    // Check the cookies and preselect the tabs
    var cookies = getCookies();
    for(var name in cookies) {            
            if (name.indexOf('selected_tab') >= 0) {
                // Get the category id
                var categoryId = name.split('_')[3];

                // Update selected tabs
                $("#category_" + categoryId + " .users_link").removeClass("selected");
                $("#category_" + categoryId + " .tweets_link").addClass("selected");
                $("#category_" + categoryId + " .tweets").show();
                $("#category_" + categoryId + " .users").hide();
            }
    }
});

function switch_to_tweets(category_id) {
    $("#" + category_id + " .users_link").removeClass("selected");
    $("#" + category_id + " .tweets_link").addClass("selected");
    $("#" + category_id + " .tweets").show('slow');
    $("#" + category_id + " .users").hide('slow');
    $.cookie('selected_tab_' + category_id, '1', { expires: 365 });
}

function switch_to_users(category_id) {
    $("#" + category_id + " .users_link").addClass("selected");
    $("#" + category_id + " .tweets_link").removeClass("selected");
    $("#" + category_id + " .tweets").hide('slow');
    $("#" + category_id + " .users").show('slow');
    $.cookie('selected_tab_' + category_id, null);
}

function closeOverlays() {
    jQuery("a.modalInput").each(function() {
        $('#tweet textarea').val('');
        jQuery(this).overlay().close();
    });
}

function reBindOverlays() {
    // console.log('Overlay rebind');
    overlayObject = $("a.modalInput").overlay(overlayOptions);
    twttr.anywhere(function(twitter) {
        twitter.hovercards();
    });
}

function getCookies() {
    var cookies = { };

    if (document.cookie && document.cookie != '') {
        var split = document.cookie.split(';');
        for (var i = 0; i < split.length; i++) {
            var name_value = split[i].split("=");
            name_value[0] = name_value[0].replace(/^ /, '');
            cookies[decodeURIComponent(name_value[0])] = decodeURIComponent(name_value[1]);
        }
    }

    return cookies;
}


