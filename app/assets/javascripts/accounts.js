// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  $(".tweet:last").css("border-radius", "0 0 6px 6px");

  $(".form-control").keyup(function () {
    var max = 140;
    var len = $(this).val().length;
    if (len >= max) {
      $(".charsleft").text(' you have reached the limit');
    } else {
      var char = max - len;
      $(".charsleft").text(char + ' characters left');
    }
  });
});

$('.post form').bootstrapValidator({
    fields: {
        'post[body]': {
            validators: {
                notEmpty: {
                    message: 'Post content is required'
                },
                stringLength: {
                    message: 'Post content must be less than 120 characters',
                    max: function (value, validator, $field) {
                        return 120 - (value.match(/\r/g) || []).length;
                    }
                }
            }
        }
    }
});

!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

type="text/javascript" src="/path/to/jquery/jquery-1.10.2.min.js";
type="text/javascript" src="/path/to/bootstrap/js/bootstrap.min.js";
type="text/javascript" src="/path/to/dist/js/bootstrapValidator.js";

