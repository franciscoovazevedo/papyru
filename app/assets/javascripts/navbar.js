var value = 0;
var delta = 180;

$("#subjects-btn").click(function(){
    value += delta;
    delta = -delta;
    $("#down-arrow").rotate({ animateTo: value });
});
