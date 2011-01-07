$(document).ready(function(){
    type_title.call(this);
    new_subject.call(this);
})

function type_title(){
    $(".title_textfield").live("keyup", function(){
        $("h2").children().html($(this).val());
    
        return true;
    });
}

function new_subject()
{
    $(".new_subject").live("click", function(){
    
        var html = "<div title='Subject type'><div class='new' style='display:none;' > TODO <br/> Choose subject type and get right new page</div></div>";
        $(html).dialog({
            modal: true, 
            width: 600, 
            heigth: 600, 
            closeOnEscape: true, 
            position: 'top'
        });
        $("div.new").fadeIn("slow");
    
        return false;
    });
}