$(function() {

    $(".dropdown-icon").on("click", function() {
        $(".fa-angle-down").toggleClass("flip");
        $(".fa-angle-down").css("transition", "all ease .5s");
    });
    
    $("#logoutout").on("click",function(){
    	Swal.fire({
			  icon: 'success',
			  title: '로그아웃 완료',
			  showConfirmButton: false,
			  timer: 800
		}).then((result) => {
			self.location ="/user/logout";
		})
    });
    
    var role = $("#role").val();
  $(document).ready(function(){  
	  if ( role == "0" ) {
	    	$(".nav-link.add-creater").show();
	    	$(".nav-link.go-creater-center").hide();
	    }
	    else if ( role == "1" ) {
	    	$(".nav-link.add-creater").hide();
	    	$(".nav-link.go-creater-center").show();
	    }else{
	    	$(".nav-link.add-creater").show();
	    	$(".nav-link.go-creater-center").hide();
	    }
	  console.log($("#role").val());

  });
   
   
});