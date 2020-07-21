$(function(){
  $('.EventIndex__main__header').on('click', function(e){
    e.preventDefault();
    $('.EventIndex__main__contents').animate({scrollTop:0});
  })
});
