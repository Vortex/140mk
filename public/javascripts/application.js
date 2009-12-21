$(document).ready(function() {

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
