$(document).on('turbolinks:load', function() {
  $fileField = $('#itemnew_file')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    filecount = document.querySelector('input[type=file]').files.length;

      $preview = $("#itemnew_img_field");
      $preview.empty();

    for(var i = 0; i < filecount ; i = i + 1){
      file = e.target.files[i]
      reader = new FileReader(),


      reader.onload = (function(file) {
        return function(e) {

          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            class: "itempreview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    }
  });
});

