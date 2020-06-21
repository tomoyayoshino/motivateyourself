$(function() {

  let search_list = $(".UserIndex__main");

  function appendUser(user) {
    let html = 
    `<div class="UserIndexBox">
      <div class="UserIndexBox__info">
        <div class="UserIndexBox__info--icon">
          <img src="${user.image}" width='50' height '50'>
        </div>
        <div class="UserIndexBox__info--name">
          <a href="/users/${user.id}">
            ${user.name}
          </a>
        </div>
      </div>
      <p>${user.profile}</p>
    </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".UserSearchInput").on("keyup", function() {
    let input = $(".UserSearchInput").val();
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      search_list.empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendErrMsgToHTML("一致するユーザーはいません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});