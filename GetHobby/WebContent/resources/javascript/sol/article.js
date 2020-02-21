        $(function () {

            $(".sol-to-the-top").on("click", function () {

                //window.scrollTo(0, 0);

            	$('body,html').animate({
    				scrollTop: 0
    			}, 200);
            	
    			return false;

            	

            });

        });




        function fncGetBoardReplyList() {
        	var articleNo = $('input[name="articleNo"]').val();
        	
        	 //alert("게시글 번호?" + articleNo);
        	 //var articleNo = $('input[name="articleNo"]').val();
        	 //var articleNo = "${article.articleNo}";
        	
        	 var userId = $('input[name="sessionUserId"]').val();
        	
        	var search = new Object();
        	search.currentPage = 0;
        	

        	$.ajax(
        			{
        				url : "/article/json/getBoardReplyList", 
        				method :  "post", 
        				dataType : "json", 
        				headers : {
        					"Accept" : "application/json", 
        					"Content-Type" : "application/json"
        				}, 
        				data : JSON.stringify({
        					search : search, 
        					articleNo : articleNo
        				}), 
        				success : function(JSONData, status) {
        					//alert("게시글 번호?" + articleNo);
        					var display = "";
        					
        					for(var i = 0; i < JSONData.list.length; i++) {
        						
        						console.log("userId?????" + userId);
        						
        						if(JSONData.list[i].user.userId != userId || userId == null || userId.length < 1) {
        							
        							display += '<li class="media my-4">';
        							
        							if (JSONData.list[i].user.profileImage != null) {
        								display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3" alt="...">';	
        							} else {
        								display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3" alt="...">';
        							}
        							
        				            display += '<div class="media-body">';   
        				            display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">'; 
        				            display += '<span><strong>' + JSONData.list[i].user.nickName + '</strong> <small class="text-muted"> ' + JSONData.list[i].regDate + '</small></span>';
        				            display += '<span><small class="text-muted"> 신고 </small></span>';
        				            display += '</h6>';
        				            display += '<p>' + JSONData.list[i].replyContent + '</p>';            
        				            display += '</div>';            
        				            display += '</li>';        
        			            
        						} else if(JSONData.list[i].user.userId == userId) {
        							
        							display += '<li class="media my-4">';
        							
        							if (JSONData.list[i].user.profileImage != null) {
        								display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3" alt="...">';	
        							} else {
        								display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3" alt="...">';
        							}
        							display += "<input type='hidden' name='replyNo' value='"+JSONData.list[i].replyNo+"' data-no='"+JSONData.list[i].replyNo+"'>";
        							display += '<div class="media-body my-reply">';
        							display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
        							//display += "<input type='hidden' name='replyNo' value='"+JSONData.list[i].replyNo+"'>";
        							display += '<span><strong>' + JSONData.list[i].user.nickName + '</strong> <small class="text-muted"> ' + JSONData.list[i].regDate + '</small></span>';
        							display += '<span><small class="text-muted"> 수정 </small> <small class="text-muted"> 삭제 </small></span>';
        							display += '</h6>';
        							display += '<p class="mb-0 text-primary">' + JSONData.list[i].replyContent + '</p>';
        							display += '</div>';            
        				            
        							display += '<div class="media-body my-reply-update">';
        				            display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
        				            //display += "<input type='hidden' name='replyNo' value='"+JSONData.list[i].replyNo+"'>";
        				            display += '<span><strong>' + JSONData.list[i].user.nickName + '</strong> <small class="text-muted"> ' + JSONData.list[i].regDate + '</small></span>';
        				            display += '<span><small class="text-muted"> 등록 </small> <small class="text-muted"> 취소 </small></span>';
        				            display += '</h6>';
        				            display += '<textarea class="form-control" rows="3" maxlength="500">' + JSONData.list[i].replyContent + '</textarea>';
        							display += '<span class="m-1"><strong class="text-danger">0</strong> / 500자</span>';
        							display += '</div>';
        							
        							
        							display += '</li>';       
        				            
        				            
        							
        						}

        					}
        					
        					console.log("댓글 다시 불러오기");
        					$(".sol-reply-container ul.list-unstyled").html(display);
        					$(".sol-reply-container ul.list-unstyled .my-reply-update").hide();
        					$(".sol-reply-count span").text("(" + JSONData.totalCount + ")");
        					
        				}
        			}
        	);
        }



        $(document).ready(function(){
        	fncGetBoardReplyList();
        	//console.log("게시글 번호" + articleNo);
        });

        $(function() {
        	var articleNo = $('input[name="articleNo"]').val();
        	var userId = $('input[name="sessionUserId"]').val();
        	$(".sol-reply-container button:contains('등록')").on("click", function(){
        		//alert(articleNo);
        		var userId = $('input[name="sessionUserId"]').val();
        		if(userId == null || userId.length < 1) {
        			var result = confirm("로그인이 필요한 서비스 입니다. 로그인하시겠습니까?");
        			if(result) {
        				self.location = '/user/captcha';
        			} else {
        				
        				return false;
        			}
        		}	
        		var reply = new Object();
        		reply.replyContent = $('textarea[name="replyContent"]').val();
        		
        		
        		//var articleNo = $('input[name="articleNo"]').val();
        		//reply.article.articleNo = articleNo;
        		reply.article = {
        				articleNo : articleNo	
        		}
        		reply.user = {
        				userId : userId
        		}
        		console.log(reply);
        		
        		//reply.user.userId = "a@google.com";
        		
        		$.ajax(
        				{
        					url : "/article/json/addBoardReply", 
        					method :  "post", 
        					dataType : "json",
        					contentType: "application/json",
        					data : JSON.stringify(
        						reply 
        					),  
        					headers : {
        						"Accept" : "application/json", 
        						"Content-Type" : "application/json"
        					},  
        					success : function(JSONData, status) {
        						console.log(JSONData);
        						//alert("게시글 번호?" + articleNo);
        						fncGetBoardReplyList();
        						$('textarea[name="replyContent"]').val(null);
        						$('#counter').text("0");
        						//$(".sol-reply-container").scrollTop($(document).height());
        						var scrollHeight = $(document).height();
        		        		//$('#homedown').click(function () {
        		        			$('body,html').animate({
        		        				scrollTop: scrollHeight
        		        			}, 500);
        		        			return false;
        		        		//});
        						
        					},
        					
        					error : function (JSONData, status) {
        						console.log(JSONData);
        						console.log(status);
        					}
        				}
        		);
        		
        		
        		
        	});
        	

        	
        	$(document).on("click","small.text-muted:contains('삭제')",function(event){
                // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
                //alert($(this).text());
                var replyNo = $(this).parent().parent().parent().prev().val();
                //alert($(this).parent().parent().parent().prev().val());
        		var result = confirm("댓글을 삭제하시겠습니까?");
        		if(result) {
        		 		$.ajax(
        					{
        						url : "/article/json/deleteBoardReply/" + replyNo, 
        						method :  "get", 
        						dataType : "json", 
        						headers : {
        							"Accept" : "application/json", 
        							"Content-Type" : "application/json"
        						},  
        						success : function(JSONData, status) {
        							console.log(JSONData)
        							//alert("게시글 번호?" + articleNo);
        							fncGetBoardReplyList();
        							
        							
        						}
        					}
        			);
        			
        		} else{
        			
        			return false;
        		}
        		

        		
              });
        	
        	
        		
        	$(document).on("click","small.text-muted:contains('수정')",function(event){
                // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
                //alert($(this).text());
                var replyNo = $(this).parent().parent().parent().prev().val();
        		//var result = confirm("댓글을 삭제하시겠습니까?");
        		//var replyContent = $(this).closest('.sol-reply-container ul.list-unstyled .my-reply ').text();
        		//console.log(replyContent)
        		var display = "";

        		var content = $(this).parent().parent().parent().next().find("textarea").val();
        		$(this).parent().parent().parent().next().find("strong.text-danger").text(content.length);
                console.log("///////" + content);
        		//alert(replyNo);
        	/* 	display += '<div class="input-group mb-3 container">';
        		display += "<input type='hidden' name='replyNo' value='" + replyNo + "'>";
        		display += '<input type="text" class="form-control" name="replyContent" value="' + replyContent + '" >';
        		display += '<div class="input-group-append">';
        		display += '<button class="btn btn-outline-secondary" type="button" id="button-addon2">등록</button>';
        		display += '<button class="btn btn-outline-secondary" type="button" id="button-addon3">취소</button>';
        		display += '</div>';
        		display += '</div>';
        		$(this).parent().html(display); */
        		
        		//$(this).$(".sol-reply-container ul.list-unstyled .my-reply").hide();
        		//$(this).$(".sol-reply-container ul.list-unstyled .my-reply-update").show();
        		
        		$(".sol-reply-container ul.list-unstyled .my-reply-update").hide();
        		$(".sol-reply-container ul.list-unstyled .my-reply").show();
        		
        		
        		/* display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
                display += "<input type='hidden' name='replyNo' value='" + replyNo + "'>";
                display += '<span><strong>' + user.nickName + '</strong> <small class="text-muted"> ' + JSONData.list[i].regDate + '</small></span>';
                display += '<span><small class="text-muted"> 등록 </small> <small class="text-muted"> 취소 </small></span>';
                display += '</h6>';
                display += '<textarea class="form-control" rows="3" maxlength="500">' + JSONData.list[i].replyContent + '</textarea>';
        		display += '<span class="m-1"><strong class="text-danger">0</strong> / 500자</span>'; */
        		
        		//$(this).closest('.sol-reply-container ul.list-unstyled .my-reply-update').show();
        		$(this).parent().parent().parent().hide();
        		$(this).parent().parent().parent().next().show();
        		console.log($(this).closest('.sol-reply-container ul.list-unstyled .my-reply-update').html());
        		//$(this).closest('.sol-reply-container ul.list-unstyled .my-reply').hide();
        		
        		console.log($(this).closest('.sol-reply-container ul.list-unstyled .my-reply').html());
        		//$(this).closest('.sol-reply-container ul.list-unstyled .my-reply').hide().closest('.sol-reply-container ul.list-unstyled .my-reply-update').show();
        		//console.log($(this).closest('.sol-reply-container ul.list-unstyled .my-reply-update').html());
        		//$(this).closest('.sol-reply-container ul.list-unstyled .my-reply-update').show();
        		
        		$("input[name='replyContent']").focus();
        		//$("input[name='replyContent']").focus().setCursorPosition($("input[name='replyContent']").val().length);
        		//alert($("input[name='replyContent']").text());
        		/* alert($("input[name='replyContent']").val()); */
        		//setCaretAtEnd($("input[name='replyContent']"));
        		//getReplyContent();	
        		
        		
        		/* $("input[name='replyContent']").focusout(function() {
        			
        			//alert("focus out!");
        			var display = "";
        			display += "<div class='alert alert-dark reply' role='alert'>";
        			display += "<input type='hidden' name='replyNo' value='" + replyNo + "'>";
        			display += ("<div class='reply-content'>" + replyContent + "</div>");
        			display += "<button type='button' class='close justify-content-end'><span>&times;</span></button>";
        			display += "<button type='button' class='btn btn-primary update'><span>수정</span></button>";
        			display += "</div>";
        			//$(this).parent().parent().html(display);
        			
        			//console.log($(this).parent().parent());
        			
        		});  */
        		
        		
              });
        	
        /* 	function getReplyContent() {
        		alert($("input[name='replyContent']"));
        		alert($("input[name='replyContent']").val());
        	} */
        	
        	$(document).on("click", "small.text-muted:contains('등록')", function(event){
                // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
                //alert($(this).text());
                
                var reply = new Object();
                //var replyNo = $(this).siblings($('input[name="replyNo"]')).val();
                reply.replyContent = $(this).parent().parent().next().val();
        		//reply.replyNo = $(this).parent().prev().prev().val();
        		reply.replyNo = $(this).parent().parent().parent().prev().prev().val();
        		console.log("/////////////////");
        		console.log(reply.replyContent);
        		console.log(reply.replyNo);
        		
                 $.ajax(
        				{
        					url : "/article/json/updateBoardReply", 
        					method :  "post", 
        					dataType : "json",
        					contentType: "application/json",
        					data : JSON.stringify(
        						reply 
        					),
        					headers : {
        						"Accept" : "application/json", 
        						"Content-Type" : "application/json"
        					},  
        					success : function(JSONData, status) {
        						console.log(JSONData)
        						//alert("게시글 번호?" + articleNo);
        						fncGetBoardReplyList();
        						//alert("댓굴 수정");
        						
        					}
        				}
        		); 
        		

        		
              });
        	
        	
        	
        	$(document).on("click", "small.text-muted:contains('취소')", function(event){
                // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
                //alert($(this).text());
                
        		$(".sol-reply-container ul.list-unstyled .my-reply-update").hide();
        		$(".sol-reply-container ul.list-unstyled .my-reply").show();
        		

        		
              });

        	
        	$(document).on("click", ".sol-article-etc button:has(i.far)", function(event){
        		var favor = new Object();
                favor.article = {
                		articleNo : articleNo
                }
                favor.user = {
                		userId : userId
                }
        		console.log("/////////////////");
        		console.log(favor.article);
        		console.log(favor.user);
        		
        		var totalFavor = parseInt($(".sol-article-etc button span").text());
        		

        		$(".sol-article-etc button span").text(totalFavor);
                 $.ajax(
        				{
        					url : "/article/json/addFavor", 
        					method :  "post", 
        					dataType : "json",
        					data : JSON.stringify(
        						favor 
        					),  
        					headers : {
        						"Accept" : "application/json", 
        						"Content-Type" : "application/json"
        					},  
        					success : function(JSONData, status) {
        						console.log(JSONData);
        						console.log(totalFavor);
        						
        						$('.sol-article-etc i').removeClass("far");
        						$('.sol-article-etc i').addClass("fas");
        						totalFavor = totalFavor + 1;
        						$(".sol-article-etc button span").text(totalFavor);
        						//alert(totalFavor);
        					}
        				}
        		);  
        	});
        	
        	
        	$(document).on("click", ".sol-article-etc button:has(i.fas)", function(event){
        		var favor = new Object();
                favor.article = {
                		articleNo : articleNo
                }
                favor.user = {
                		userId : userId
                }
        		console.log("/////////////////");
        		console.log(favor.article);
        		console.log(favor.user);
        		
        		var totalFavor = parseInt($(".sol-article-etc button span").text());
        		

        		$(".sol-article-etc button span").text(totalFavor);
                 $.ajax(
        				{
        					url : "/article/json/deleteFavor", 
        					method :  "post", 
        					dataType : "json",
        					data : JSON.stringify(
        						favor 
        					),  
        					headers : {
        						"Accept" : "application/json", 
        						"Content-Type" : "application/json"
        					},  
        					success : function(JSONData, status) {
        						console.log(JSONData);
        						console.log(totalFavor);
        						
        						$('.sol-article-etc i').removeClass("fas");
        						$('.sol-article-etc i').addClass("far");
        						totalFavor = totalFavor - 1;
        						$(".sol-article-etc button span").text(totalFavor);
        						//alert(totalFavor);
        					}
        				}
        		);  
        	});
        	
        	
        	
        	$(document).on("keyup",".my-reply-update textarea",function(event){
        		var content = $(this).val();
                $('.my-reply-update strong.text-danger').text(content.length);
              });
        	$(document).on("keyup",".my-reply-update textarea",function(event){
              });
        	
        	
        });

        $(function() {
              $('#reply-textarea').keyup(function (e){
                  var content = $(this).val();
                  $('#counter').text(content.length);
              });
              $('#reply-textarea').keyup();
              
        });


        	


