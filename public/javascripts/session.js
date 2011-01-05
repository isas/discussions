$(document).ready(function(){
  register.call(this);
})

function register(){
  $("a.register").live("click", function(){
    var $this = $(this);
    $("div.login_div").html("<div class='loading'></div>");
    $("div#flashes").html("");

    $.ajax({
        url: "/users/new",
        data: {},
        type: "GET",
        success: function(data) {
          $("h2#sub_header").html("New user");
          $("div.login_div").html(data);
        }
    });
    
    return false;
  });
}