$(document).ready(function(){
    focus.call(this);
})

function focus()
{
    //$(".title_textfield").focus();
    //$("#login").focus();
    $("form input[type=text]:first").focus();
}

function focus_in($element)
{
    $element.find("form input[type=text]:first").focus();
}