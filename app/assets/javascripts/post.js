$(function(){
  $('.Timeline__header').on('click', function(e){
    e.preventDefault();
    $('.Timeline__main').animate({scrollTop:0});
  })
});