$(document).ready(function(){
    save_favorite.call(this);
})

function save_favorite()
{
    $(".favorite_button").live("click", function(){
        var $this = $(this);
        var params = $this.closest("form").serialize();
        var div = $this.closest("div.subject_favorites");
        var favorite_id = $("input#favorite_id").val();
        var type = "post"
        
        if (favorite_id != "") type = "put" 
        
        div.html("<div class='loading'></div>");
        
        $.ajax({
            url: "/favorites/" + favorite_id,
            data: params,
            type: type,
            success: function(data) {
                div.addClass("hide");
                div.html(data);
                div.fadeIn("slow");
                //div.removeClass("hide");
                hide_flash();
                reload_favorites();
            }
        });
        
        return true; 
    });
}

function hide_flash()
{
    setTimeout(function(){ 
        $("div#flashes").fadeOut(1000);
    }, 2500);
}

function reload_favorites()
{
    var category = $("#category");
    $.ajax({
        url: "/favorites/",
        data: {},
        type: "GET",
        success: function(data) {
            category.addClass("hide");
            $("#category").html(data);
            category.fadeIn("slow");
            //category.removeClass("hide");
        }
    });
}