$(document).ready(function(){
    save_comment.call(this);
})

function save_comment()
{
    $(".save_comment").live("click", function(){
        var $this = $(this);
        var params = $this.closest("form").serialize();
        var parent_div = $this.closest("div")
        
        parent_div.html("<div class='loading'></div>");

        $.ajax({
            url: "/comments/",
            data: params,
            type: "post",
            success: function(data) {
                parent_div.html(data);
                $(".need_to_show").fadeIn("slow");
            }
        });
        
        return false;
    });
}