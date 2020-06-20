$(function(){
  $('.MessageHeader').on('click', function(e){
    e.preventDefault();
    $('.MessageField').animate({scrollTop:0});
  })
});