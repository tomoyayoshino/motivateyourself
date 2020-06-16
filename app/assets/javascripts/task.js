$(function(){
  
  $(".TaskTitle").on('click', function(e){
    $(this).toggleClass("line-through");
  })

  $(".TaskShow").on('click', function(e){
    $(this).next().fadeToggle();
    $(this).toggleClass("active");
  })
});