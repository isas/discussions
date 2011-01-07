$(document).ready(function(){
    show_profile_info.call(this);
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