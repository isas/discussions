$(document).ready(function() {
    slide_tweets.call(this);
    show_tweets.call(this);
});


function slide_tweets()
{
    var arr = $(".tweet");
    arr=arr.toArray().reverse();
    repeat_slide(arr);
    setTimeout(function(){ 
        $("div.loading").hide();
    }, 10000);
}

function repeat_slide(arr)
{
    var a = arr.pop();
    setTimeout(function(){ 
        if (a)
        {
            repeat_slide(arr);
        }
        $(a).slideDown(2000);
    }, 900);
}

function show_tweets()
{
    $("select#twitter_name").live("change", function(){
        var $this = $(this);
        window.location = $this.attr("href") + "?user_id=" + $this.val();
        return true;
    });
}