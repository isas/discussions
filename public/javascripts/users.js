$(document).ready(function(){
  new_user.call(this);
  save_new_user.call(this);
  cancel.call(this);
  edit_user.call(this);
  edit_cancel.call(this);
  update_user.call(this);
})

function new_user(){
  $("a#new_user").live("click", function(){
    var $this = $(this);
    var tr = $("tr.new_tr")
    tr.html("<td><div class='loading'></div></td>");

    $.ajax({
        url: "/users/new",
        data: {},
        type: "GET",
        success: function(data) {
          tr.html(data);
          $("td.td_new").fadeIn("slow");
          tr.removeClass("new_tr");
          tr.after("<tr class='new_tr'><td colspan='7'><a id='new_user' href='/users/new'>New user</a></td></tr>");
          focus_in(tr);
        }
    });
    
    
    return false;
  });
}

function edit_user()
{
    $("a.edit_user").live("click", function(){
       var $this = $(this);
       var tr = $this.closest("tr");
       tr.hide();
       tr.after("<tr></tr>");
       tr = tr.next();
       
      $.ajax({
          url: "/users/" + $this.attr("id") + "/edit",
          data: {},
          type: "GET",
          success: function(data) {
              tr.html(data);
              $("td.td_edit").fadeIn("slow");
              focus_in(tr);
          }
        });
       
       return false;
    });
}

function edit_cancel()
{
    $("a.cancel_edit").live("click", function(){
       var $this = $(this);
       var tr = $this.closest("tr");
       tr.hide();
       tr.prev().fadeIn("slow");
       
       return false;
    });
}

function update_user()
{
    $("input.edit_user_submit").live("click", function(){
      var $this = $(this);
      var tr = $this.closest("tr");
      var params = $this.closest("form").serialize();
      
    $this.closest("td").html("<div class='loading'></div>");

    $.ajax({
      url: "/users/" + $this.next().attr("id"),
      data: params,
      type: "put",
      success: function(data) {
          tr.html(data);
          $("td.td_edit").fadeIn("slow");
          focus_in(tr);
      }
    });
       
       return false;
    });
}

function save_new_user()
{
    $("input.new_user_submit").live("click", function(){
      var $this = $(this);
      var tr = $this.closest("tr");
      var params = $this.closest("form").serialize();
      
    $this.closest("td").html("<div class='loading'></div>");

    $.ajax({
      url: "/users/",
      data: params,
      type: "post",
      success: function(data) {
          tr.html(data);
          $("td.td_new").fadeIn("slow");
          focus_in(tr);
      }
    });
       
       return false;
    });
}

function cancel()
{
    $("a.cancel").live("click", function(){
       var $this = $(this);
       var tr = $this.closest("tr");
       
       tr.fadeOut("slow");
       
       return false;
    });
}