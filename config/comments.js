$(document).on('ready turbolinks:load', function() {
  // Crear comentarios
  $('[name=commit]').on('click', function(e){
    e.preventDefault(); // Evitamos el comportamiento del formulario
    var $new_content = $('[name="comment[content]"]');
    $.ajax({
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      type: "POST",
      url: "/comments",
      data: {comment: {content: $new_content.val()}},
      dataType: "script",
      success: function(){
        $new_content.val('');
      }
    });
  })
  // Filtrar comentarios
  $('[name=q]').on('keyup', function(){
    if ($(this).val().length > 2){
      $.ajax({
        type: "GET",
        url: "/comments",
        data: { q: $(this).val() },
        dataType: "script"
      });
    };
    //Libera
    if ($(this).val().length == 0){
        $.ajax({
          type: "GET",
          url: "/comments",
          dataType: "script"
        });
    }
  })
})
