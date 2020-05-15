$(document).on('turbolinks:load', function(){
  $(".alert").delay(1000).slideUp(500, function(){
        $(".alert").alert('close');
    });
  });




