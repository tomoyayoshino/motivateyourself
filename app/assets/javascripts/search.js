$(function() {
  let search_list = $(".Timeline__main");

  function appendPost(post){
    if(post.user_sign_in && post.user_sign_in.id == post.user_id){
      let html =
      `c`
      search_list.append(html);
    } else {
      let html =
      `a`
      search_list.append(html);
    }
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }


  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      search_list.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});