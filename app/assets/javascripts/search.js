$(function() {
  let search_list = $(".Timeline__main");

  function appendPost(post){
    if(post.image){
      let html =
      `<div class='ContentBox'>
        <div class='ContentBox__info'>
          <div class='ContentBox__info--image'>
            <img src="${post.icon}" width='50' height '50'>
          </div>
          <div class='ContentBox__info--name'>
            <a href="/users/${post.user_id}">
              ${post.name}
            </a>
          </div>
          <div class='ContentBox__info--follow'></div>
        </div>
        <div class='ContentBox__contents'>
          <div class='ContentBox__contents--text'>
            <p>${post.content}</p>
          </div>
          <div class='ContentBox__contents--image'>
            <a href="${post.image}" rel="lightbox">
              <img src="${post.image}" class: 'ContentBox__contents--image'>
            </a>
          </div>
        </div>
        <div class='ContentBox__tags'>
        </div>
        <div class='ContentBox__actionBar'>
          <div class='ContentBox__actionBar--date'>
            ${post.created_at}
          </div>
          <div>
          </div>
          <div class='ContentBox__actionBar--detail'>
            <a href="posts/${post.id}">
              詳細
            </a>
          </div>
        </div>
      </div>`
      search_list.append(html);
    } else {
      let html =
      `<div class='ContentBox'>
        <div class='ContentBox__info'>
          <div class='ContentBox__info--image'>
            <img src="${post.icon}" width='50' height '50'>
          </div>
          <div class='ContentBox__info--name'>
            <a href="/users/${post.user_id}">
              ${post.name}
            </a>
          </div>
          <div class='ContentBox__info--follow'></div>
        </div>
        <div class='ContentBox__contents'>
          <div class='ContentBox__contents--text'>
            <p>${post.content}</p>
          </div>
        </div>
        <div class='ContentBox__tags'>
        </div>
        <div class='ContentBox__actionBar'>
          <div class='ContentBox__actionBar--date'>
            ${post.created_at}
          </div>
          <div>
          </div>
          <div class='ContentBox__actionBar--detail'>
            <a href="posts/${post.id}">
              詳細
            </a>
          </div>
        </div>
      </div>`
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