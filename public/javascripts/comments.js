$(document).ready(function(){
    save_comment.call(this);
})

function save_comment()
{
    $(".save_comment").live("click", function(){
        var $this = $(this);
        var params = $this.closest("form").serialize();
        var parent_div = $this.closest("div")
        
        parent_div.html("<div class='loading' style='display:block; height:200px;'></div>");

        $.ajax({
            url: "/comments/",
            data: params,
            type: "post",
            success: function(data) {
                parent_div.html(data);
                $(".need_to_show").fadeIn("slow");
                
                
                if (data.search(/can't be blank/) == -1)
                {
                    var comments_size = parseInt($(".comment_size").val()) + 1
                    $(".comment_size").val(comments_size)
                    $(".comment_size_text").html("Comments (" + comments_size + ")");
                }
            }
        });
        
        return false;
    });
}

