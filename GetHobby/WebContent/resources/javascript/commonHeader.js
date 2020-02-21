$(document).ready(function () {
        	
        	// 프로필 화살표 애니메이션
        	$(".dropdown-icon").on("click", function() {
                $(".fa-angle-down").toggleClass("flip");
                $(".fa-angle-down").css("transition", "all ease .5s");
            });
        	
        	// 마이페이지 이동
        	$(document).on("click", ".header-mynemo-span-next-first-div-in-mypage-text", function(){
        		self.location = "/user/mypageUser";
        	});
        	
        	
        	$(".header-title-box-single").focus(function(){
        		$(this).css("background-color","red");
        	});
        	
        	$(".header-title-box-single").focusout(function(){
        		$(this).css("background-color","blue");
        	});
        	
			// sideBar
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });