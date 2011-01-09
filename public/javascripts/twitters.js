$(document).ready(function() {
    slide_tweets.call(this);
});


function slide_tweets()
{
    var arr = $(".tweet");
    arr=arr.toArray().reverse();
    repeat_slide(arr);
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