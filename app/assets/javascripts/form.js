$( ".input" ).focusin(function() {
  $( this ).find( "span" ).animate({"opacity":"0"}, 200);
});

$( ".input" ).focusout(function() {
  $( this ).find( "span" ).animate({"opacity":"1"}, 300);
});

$( "#forgot-pwd" ).click(function() {
  $( "#forgot-pwd-form" ).toggleClass( "hidden", 1000 );
});
