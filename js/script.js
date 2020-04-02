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
  })
})