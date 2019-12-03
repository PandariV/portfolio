$(document).ready(function(){
  $(window).scroll(function(){
	  var scroll = $(window).scrollTop();
	  //Header
	  if(scroll > 30) {
		$("header").css("background", "black");
	  }
	  else{
		$("header").css("background", "rgba(255, 255, 255, 0)");  	
	  }

	  //Links
	  if((scroll < innerHeight) && (scroll > 30)) {
		$(".one").css("color", "gray");
	  }
	  else{
		$(".one").css("color", "white");  	
	  }

	  if((scroll > innerHeight - 1) && (scroll < innerHeight + 300)) {
		$(".two").css("color", "gray");
	  }
	  else{
		$(".two").css("color", "white");  	
	  }

	  if(scroll > innerHeight + 299) {
		$(".three").css("color", "gray");
	  }
	  else{
		$(".three").css("color", "white");  	
	  }
  })
})