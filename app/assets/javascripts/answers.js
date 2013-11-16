// function to add answer choices to questions
$(document).ready(function(){
  var rowcount = $("#TextBoxesGroup tr").length;
  var label = rowcount +1;
    var counter = 2;
    $(".addButton").on("click", function () {
 if(counter>5){
            alert("Only 5 textboxes allow");
            return false;
 }  
  
 var newTextBoxDiv = $(document.createElement('tr'))
    .attr("id", 'rownumber' + rowcount);
 newTextBoxDiv.html('<td>' + label + '. <input type="textbox" name="answer_' + label +  '_text" id="answer_' + label + '_text" value="" size="20px"></td>');
 newTextBoxDiv.appendTo("#TextBoxesGroup");
 rowcount++;
 label++;
     });
  });