$(document).ready(function(){
    show_profile_info.call(this);
    profile_click.call(this);
})

function show_profile_info()
{
    $(".profile_info").live("click",function(){
        var $this = $(this);
        
        $.ajax({
            url: "/users/" + $this.attr("id"),
            data: {},
            type: "get",
            success: function(data) {
                var html = "<div class='profile' title='Profile info'>"+data+"</div>";
                $(html).dialog({
                    modal: true, 
                    width: 600, 
                    heigth: 600, 
                    closeOnEscape: true, 
                    position: 'top'
                });
                $("div.profile_info").fadeIn("slow");
            }
        });
        
        
        
        return false;
    });
}

function profile_click()
{
    $(".profile a").live("click",function(){
        var $this = $(this);
        $this.parent().html("<div class='loading'></div>");
        window.location = $this.attr("href");
        
        return false;
    });
}