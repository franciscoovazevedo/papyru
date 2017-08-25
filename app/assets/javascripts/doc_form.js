
  $("div#btn-doc").on("click", function(){
    $("div#doc").removeClass("hidden");
    $("#create").addClass("hidden")
    $("div#btn-doc").addClass("hidden")
  })
  $("div#doc-show").on("click", function(){
    $("div#doc").addClass("hidden");
    $("#create").removeClass("hidden")
    $("div#btn-doc").removeClass("hidden")
  })



