function sign_up_logic(){
  if ($("#user_type").val() === "Student"){
    $("#mayor-input").removeClass("hidden");
  }else{
    $("#mayor-input").addClass("hidden");
  }
};

