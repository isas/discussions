$(document).ready(function(){
  type_title.call(this);
})

function type_title(){
  $(".title_textfield").live("keyup", function(){
    $("h2").children().html($(this).val());
    
    return true;
  });
}