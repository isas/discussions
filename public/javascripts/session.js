$(document).ready(function(){
  register.call(this);
  save_new_user.call(this);
})

function register(){
  $("a.register").live("click", function(){
    var $this = $(this);
    $("div#content").html("<div class='loading'></div>");

    $.ajax({
        url: "/users/new",
        data: {},
        type: "GET",
        success: function(data) {
          $("div#content").html(data);
        }
    });
    
    return false;
  });
}

function save_new_user()
{
    $("input#user_submit").live("click", function(){
      var $this = $(this);
      $("div#content").html("<div class='loading'></div>");

      var params = $this.closest("form").serialize();

    $.ajax({
      url: "/users/",
      data: params,
      type: "post",
      success: function(data) {
        $("div#content").html(data);
      }
    });
       
       return false;
    });
}