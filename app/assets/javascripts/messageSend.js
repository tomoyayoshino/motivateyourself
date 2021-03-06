$(function(){
  function buildHTML(m){
    if (m.image){
      let html = 
      `<div class="MessageBox" data-message-id=${m.id}>
        <div class="MessageBox__current">
          <div class="MessageBox__current--flex">
            <div class="MessageBox__current--date">
              ${m.created_at}
            </div>
            <div class="MessageBox__current--parent">
              <a href="${m.image}" rel="lightbox">
                <img src="${m.image}" class: 'MessageBox--image' width='66' height='50'>
              </a>
              <p>
                ${m.content}
              </p>
            </div>
          </div>
        </div>
      </div>`
      return html;
    } else {
    let html = 
    `<div class="MessageBox" data-message-id=${m.id}>
      <div class="MessageBox__current">
        <div class="MessageBox__current--flex">
          <div class="MessageBox__current--date">
            ${m.created_at}
          </div>
          <div class="MessageBox__current--parent">
            <p>
              ${m.content}
            </p>
          </div>
        </div>
      </div>
    </div>`
    return html;
    }
  }

  $('.MessageForm__form').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.MessageField').append(html);
      $('form')[0].reset();
      $('.MessageField').animate({ scrollTop: $('.MessageField')[0].scrollHeight});
      $('.MessageForm__submit').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  })
});