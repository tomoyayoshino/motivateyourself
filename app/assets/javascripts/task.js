$(function(){
  
  $(".TaskTitle").on('click', function(e){
    e.preventDefault();
    $(this).toggleClass("line-through");
  })
});