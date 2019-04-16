$(document).on('turbolinks:load', function() {

// 編集（更新時の画像ドロップゾーンviewを調整
    var previewarea = document.getElementsByClassName('previewfield');
    var previewareacount = previewarea.length;

    if (previewareacount >= 10)
      {$('#itemnew_img_field__method').hide();}
    else if(previewareacount >= 5)
      {$('#itemnew_img_field__method').height(100);}
    else
      {$('#itemnew_img_field__method').height(200);}


    // プレビューの削除
  $(document).on("click", ".img_del", function removeFile(e) {
    e.preventDefault();
      var num=$(this).parent().parent()[0].getAttribute('data-num');
// del_targetは更新時に画像を削除するためのもの
      var del_target= $("#item_images_attributes_"+num+"__destroy");
       del_target.prop('checked', true);
      $(this).parent().parent().remove();

      $('#itemnew_img_field__method').show();

      var previewarea = document.getElementsByClassName('previewfield');
      var previewareacount = previewarea.length;
// view調整
    if (previewareacount >= 10)
      {$('#itemnew_img_field__method').hide();}
    else if(previewareacount >= 5)
      {$('#itemnew_img_field__method').height(100);}
    else
      {$('#itemnew_img_field__method').height(200);}
     }
  );
// 新規出品
  $("#itemnew__sell__form").on('submit', function(e) {
    e.preventDefault();

    var formData = new FormData(this);
// validationチェック
    formvalidation();

 for (var [key, value] of formData.entries()) {
  console.log(key, value);
}


    var formcheck=
    $('.sell__form__itemdescription__right__profit__input__box').val();
    if(formcheck >=300 && formcheck <= 9999999 ){$('#validation_price').hide();}
    else{$('#validation_price').show();}

// 画像関係のフォームデータをリセット
    formData.delete( "images[name][]") ;
// プレビューのデータを取得
    var previewzone=document.getElementsByClassName('itempreview')
// input type=fileのデータを取得
    var nodeList = document.getElementsByName('images[name][]') ;

    var pricecheck=
    $('.sell__form__itemdescription__right__profit__input__box').val();
        // プレビューが0なら更新処理をしない
    if(previewzone.length == 0)
    {$("#itemimage_uproad_none").show();}
    else
      if (pricecheck >=300 && pricecheck <= 9999999 )
    {
// プレビューのうち、ファイル名が一致するもののみ、formdataに加える
      {  for(var h = 0; h < previewzone.length; h = h + 1)
          {
            loop:  for(var i = 0; i < nodeList.length; i = i + 1)
              {for(var j = 0; j < nodeList[i].files.length; j = j + 1)
                {var tmpfile=nodeList[i].files[j];

                if (unescape(previewzone[h].getAttribute('data-file'))==tmpfile.name)
                  {formData.append('images[name][]',tmpfile);
                   break loop;
                  }
                }
              }
            }

          $.ajax({
              type : 'POST',
              url: '/items',
              contentType:false,
              processData: false,
              data : formData,
              })

          .done(function() {

                })
          .fail(function() {

            })
         }
     }
// if(previewzone.length!== 0)はここまで
    return false;
  });
// 更新
  $("#itemnew__edit__form").on('submit', function(e) {
    e.preventDefault();

    var formData = new FormData(this);
// validationチェック
    formvalidation();

    var formcheck=
    $('.sell__form__itemdescription__right__profit__input__box').val();
    if(formcheck >=300 && formcheck <= 9999999 ){$('#validation_price').hide();}
    else{$('#validation_price').show();}

    formData.delete( "images[name][]" ) ;

    var previewzone=document.getElementsByClassName('itempreview')
    var nodeList = document.getElementsByName('images[name][]') ;

    var pricecheck=
    $('.sell__form__itemdescription__right__profit__input__box').val();
    // プレビューが0なら更新処理をしない
    if(previewzone.length == 0)
    {$("#itemimage_uproad_none").show();}
    else
      if (pricecheck >=300 && pricecheck <= 9999999 )
    {
      { for(var h = 0; h < previewzone.length; h = h + 1){
          loop:  for(var i = 0; i < nodeList.length; i = i + 1)
            {for(var j = 0; j < nodeList[i].files.length; j = j + 1)
              {var tmpfile=nodeList[i].files[j];
                if (unescape(previewzone[h].getAttribute('data-file'))==tmpfile.name){
                  formData.append('images[name][]',tmpfile);
                  break loop; }
              }
            }
          }

        var edit_item_id=document.getElementById('edit__path').getAttribute('data-update-path');
        var edit__path='/items/'+edit_item_id;

        $.ajax({
            type : 'PATCH',
            url: edit__path,
            contentType:false,
            processData: false,
            data : formData,
            })

        .done(function() {

          })
        .fail(function() {

          })
        }
      }
      // if(previewzone.length!== 0)はここまで
    return false;
    });
// 数字をカンマ区切り
  function separate(num){
    // 文字列にする
    num = String(num);
    var len = num.length;

    // 再帰的に呼び出すよ
    if(len > 3){
        // 前半を引数に再帰呼び出し + 後半3桁
        return separate(num.substring(0,len-3))+','+num.substring(len-3);
    } else {
        return num;
    }
  }
// カテゴリーのセレクトボックスを動的に追加
  function appendCategory(sub_category) {
    var html=`<option value='${sub_category.id}'>${sub_category.name}</option>`
    $("#selectitembox1").append(html);
  }

  $('#selectitembox').change(function()  {
    var test = $('#selectitembox').val();
        if($(this).val() !== "")
        {$("#selectitembox1").show();
        }else{$("#selectitembox1").hide();
            $("#selectitembox2").hide();
            $("#selectitembox1").val("");
            $("#selectitembox2").val("");
        }
       for(var i=document.getElementById('selectitembox1').options.length -1; 1 <= i ; --i){
    document.getElementById('selectitembox1').options[i] = null;
      }

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: { category_id: test},
      dataType: 'json'
    })

    .done(function(sub_categories) {
    sub_categories.forEach(function(sub_category){
       appendCategory(sub_category);
     });
    })

    .fail(function() {
    })
  })

  function appendCategory2(sub_category) {
    var html=`<option value='${sub_category.id}'>${sub_category.name}</option>`
    $("#selectitembox2").append(html);
  }

  $('#selectitembox1').change(function()  {
      var test = $('#selectitembox1').val();
          if($(this).val() !== "")
        {$("#selectitembox2").show();
        }else{$("#selectitembox2").hide();
              $("#selectitembox2").val("");
        }

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: { category_id: test},
      dataType: 'json'
    })

    .done(function(sub_categories) {
    for(var i=document.getElementById('selectitembox2').options.length -1; 1 <= i ; --i){
    document.getElementById('selectitembox2').options[i] = null;
      }

    sub_categories.forEach(function(sub_category){
       appendCategory2(sub_category);
     });
    })

    .fail(function() {
    })
  })

// 手数料と利益計算
  $("#item_price").on('keyup',$("#item_price"), function() {
   var price = $(this).val();
   var mercari_margin = price * 0.1 ;
   var mercari_margin = Math.floor(mercari_margin);
   var saler_margin = price - mercari_margin;
   var mercari_margin = separate(mercari_margin);
   var saler_margin = separate(saler_margin);

    if(price >= 300){
      $('#mercari_margin').text("¥"+mercari_margin);
      $('#saler_margin').text("¥"+saler_margin);
      }
    else{
      $('#mercari_margin').text("-");
      $('#saler_margin').text("-");
      }
  })

  $("#selectitemdelivery").change(function()  {
  if($(this).val() !== "")
    {$(".selectitemdelivery1").show();
    }else{$(".selectitemdelivery1").hide();
          $("#selectitemdelivery1").val("");
    }
   });
// 画像をドラッグ&ドロップで投稿
   $(".drop-zone").on("drop",function(e){
    e.preventDefault();
    $(this).removeClass("dragover");
    var inputboxcount = document.getElementById('itemnew_img_field__method').getAttribute('data-count');
    var fileInput = document.getElementById('itemnew_file'+inputboxcount);
// ドロップされた画像データをinput type=fileに代入する
    var tmpfiles = e.originalEvent.dataTransfer.files;
    fileInput.files = tmpfiles;
    console.log(fileInput.files);
  });
  $(".drop-zone").on("dragover",function(e){
    e.preventDefault();
    $(this).addClass("dragover");
  });
  $(".drop-zone").on("dragleave",function(e){
    e.preventDefault();
    $(this).removeClass("dragover");
  });

    function formvalidation(){
    var formcheck=$('.sell__form__itemname__input').val();
    if(formcheck==""){$('#validation_itemname').show();}
    else{$('#validation_itemname').hide();}

    var formcheck=$('.sell__form__itemname__explanationinput').val();
    if(formcheck==""){$('#validation_itemdescription').show();}
    else{$('#validation_itemdescription').hide();}

    var formcheck=$('#selectitembox').val();
    if(formcheck==""){$('#validation_itemcategory').show();}
    else{$('#validation_itemcategory').hide();}

    var formcheck=$('#selectitembox').val();
    if(formcheck==""){$('#validation_itemcategory').show();}
    else{$('#validation_itemcategory').hide();}

    var formcheck=$('#selectitembox1').val();
    if(formcheck==""){$('#validation_itemcategory').show();}
    else{$('#validation_itemcategory').hide();}

    var formcheck=$('#selectitembox2').val();
    if(formcheck==""){$('#validation_itemcategory').show();}
    else{$('#validation_itemcategory').hide();}

    var formcheck=$('#select_item_conditon').val();
    if(formcheck==""){$('#validation_itemcondition').show();}
    else{$('#validation_itemcondition').hide();}

    var formcheck=$('#selectitemdelivery').val();
    if(formcheck==""){$('#validation_postage').show();}
    else{$('#validation_postage').hide();}

    var formcheck=$('#selectitemdelivery1').val();
    if(formcheck==""){$('#validation_delivery').show();}
    else{$('#validation_delivery').hide();}

    var formcheck=$('#select_item_region').val();
    if(formcheck==""){$('#validation_region').show();}
    else{$('#validation_region').hide();}

    var formcheck=$('#select_item_shipping_date').val();
    if(formcheck==""){$('#validation_shipping_date ').show();}
    else{$('#validation_shipping_date').hide();}
   }


});
// $(document).on('turbolinks:load', function()はここまで

// 画像のプレビュー表示、turbolinks:load内だと重複するため、外で記述。
$(function() {
  $fileField = $('.itemnew_file')

  $(document).on('change', $fileField, function(evt) {
    var files = evt.target.files;
    var previewarea = document.getElementsByClassName('previewfield');
    var previewareacount = previewarea.length;
    $("#itemimage_uproad_none").hide();
    if (files !== null && files !== undefined && previewareacount+files.length <= 10)
      { for (var i = 0, f; f = files[i]; i++) {
        if (!f.type.match('image.*')) {
          continue;}

        var reader = new FileReader();

        reader.onload = (function(theFile) {
          return function(e) {
            var div = document.createElement('div');
            div.className = 'previewfield';
            div.innerHTML = ['<img class="itempreview" src="', e.target.result,
                              '" data-file="', escape(theFile.name), '"/>'].join('');
            div.insertAdjacentHTML('beforeend', '<div class="img_view"><div class="img_view__cover"><a  class="img_edit">編集</a></div><a href=""  class="img_del">削除</a></div>');
            var reference = document.querySelector('.drop-zone');
            document.getElementById('itemnew_img_field').insertBefore(div, reference);
            };
          })(f);

        reader.readAsDataURL(f);
        }

      var counter=document.getElementsByName('images[name][]').length+1;
      var next_click=`$("#itemnew_file${counter}").click()`;

      $("#itemnew_img_field__method").attr('onClick',next_click);

      var next_input=`<input type="file" multiple="true" name="images[name][]" id="itemnew_file${counter}" class="itemnew_file" style="display:none">`
      $('.sell__form__image__uproad').append(next_input);

      if (previewareacount+files.length >= 10)
        {$('#itemnew_img_field__method').hide();}
      else if(previewareacount+files.length >= 5)
        {$('#itemnew_img_field__method').height(100);}
      else
        {$('#itemnew_img_field__method').height(200);}

      var dataget= $('#itemnew_img_field__method').attr('data-count');
      var next_input_id= Number(dataget)+1;
      $('#itemnew_img_field__method').attr('data-count',next_input_id);
    }
    // forはここまで

      if (files !== null && files !== undefined)
       {if (previewareacount+files.length > 10)
        { $("#itemimage_uproad_over").show();}
       else{$("#itemimage_uproad_over").hide();}
        }
  })


})







