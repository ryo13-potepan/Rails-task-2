$(document).on('turbolinks:load', function(){
  $(".user-info").on("click" ,function(){
      $(this).next().slideToggle();
  });
});   