$(function(){
  
  function tabFavorite() {
    $("#userPostButton").removeClass("active");
    $("#userFavoriteButton").addClass("active");
    $(".UserPosts").removeClass("show");
    $(".UserFavorites").addClass("show");
  }
  function tabPost() {
    $("#userFavoriteButton").removeClass("active");
    $("#userPostButton").addClass("active");
    $(".UserFavorites").removeClass("show");
    $(".UserPosts").addClass("show");
  }

  $("#userFavoriteButton").on("click", tabFavorite);
  $("#userPostButton").on("click", tabPost);

});