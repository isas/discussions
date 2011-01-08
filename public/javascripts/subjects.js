$(document).ready(function(){
    type_title.call(this);
    new_subject.call(this);
    new_subject_change.call(this);
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
        var option0 = "<option value=''></option>";
        var option1 = "<option value='books'>Book</option>";
        var option2 = "<option value='movies'>Movie</option>";
        var option3 = "<option value='music_artists'>Music artist</option>";
        
        
        var select_box = "<select id='subject_id' name='subject'>" +option0+option1+option2+option3 +"</select>";
        var html = "<div title='Subject type'><div class='new' style='display:none;'> Chose category: <b>New </b>"+select_box+"</div></div>";
        $(html).dialog({
            dialogClass: 'alert',
            modal: true, 
            minWidth: 300, 
            minHeigth: 100,
            maxWidth: 300, 
            maxHeigth: 100,
            closeOnEscape: true, 
            position: 'center',
            draggable: false,
            resizable: false,
            //hide: 'slide', 
            buttons: { "Close": function() { $(this).dialog("close"); } }
        });
        $("div.new").fadeIn("slow");
    
        return false;
    });
}

function new_subject_change()
{
    $("select#subject_id").live("change", function(){
       var $this = $(this);
       window.location = "/" + $this.val() + "/new"
       $(".new").html("<div class='loading'></div>");
       return false;
    });
}