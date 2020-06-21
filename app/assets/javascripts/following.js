$(function(){
  $('.follows__header').on('click', function(e){
    e.preventDefault();
    $('.follows__contents').animate({scrollTop:0});
  })
});