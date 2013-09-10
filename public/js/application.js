$(document).ready(function() {
  // $('div#ajaxify').prepend('<img src="ajax-loader.gif />'); 
  //  $('div#ajaxify').hide();

  $('form').submit(function(event){
    event.preventDefault();
    $('p.error').hide();
    var tweet = {};
    tweet.tweet = $('.tweet-input').val();

    // disable the form
    $('.tweet-input').prop('disabled', true);
    $('.tweet-button').prop('disabled', true);

    // append a message
    $('form').append('<p class="wait">You tweet is being sent!</p>');

    $.ajax({
      type: "POST",
      url: '/tweet',
      data: tweet,
      success: function(success){
        $('body').html(success);
      }
    });
  });

//@user.fetch_tweets!
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
