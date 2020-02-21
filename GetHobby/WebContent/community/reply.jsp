<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listCommunity</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
    	  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- include libraries(jQuery, bootstrap) -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script>


/*
 * 댓글 등록하기(Ajax)
 */
 function fn_reply(articleNo, replyContent){
	
	//==>추후 연결될때 클래스상세보기 시 Controller에서 model에 담은 hobbyclassNo뽑아올 것 
	//var hobbyClassNo = $(hobbyClass.hobbyClassNo).val();
	var hobbyClassNo = "10013";
	//alert(hobbyClassNo);
	var articleNo = articleNo;
	//alert(articleNo);
	var replyContent = replyContent;
	//alert(replyContent);
	//var replyContent = $("textarea.replyInput").val();
	//폼에 있는 데이터 한꺼번에 보내는 함수 serialize()사용
	//var data = $("form[name='replyForm']").serialize()+"&articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo;
	//alert(data); ==> Rest에서 Map으로 받을수있다 
	var hobbyClass = {
			"hobbyClassNo" : hobbyClassNo
	};
	
	var article = {
			"articleNo" : articleNo,
			"hobbyClass" : hobbyClass
	}; //=>Reply.java에  Article이 필드로 들어있으므로 이렇게 필요한 값 쓰고 Reply에 매핑. 
	
	var reply = {
	
	"article" : article,
	"replyContent": replyContent
	};
	
	alert("ajax진입");	
    $.ajax(
    		{
        url : "/community/json/addCommunityReply",
        method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		dataType: "json", 
		data : JSON.stringify//({ //jsonString
			//data : data //key:value => 이렇게 var data에 다 때려박아서 Rest에서 Map으로 받을수도있음
			(reply), //=> Reply도메인에 매핑해서 JsonString으로 보낼 것임.
       /* -	name: value 	=> jsonObject  => queryString
		  -	JSON.stringify({
				name: value
			}) 				==> jsonString => {"name":"value", "name":"value"} 
							=> Rest에서 @RequestBody사용시 domain객체로 바인딩해줌  */
			
		//}),  => data : data 로 넣어줄 시 필요
        success : function(data){
        	if(data.success=="200"){
        		alert("등록되었습니다")
        		getCommunityReplyList(articleNo);
        	}
        },
        error:function(request,status,error){
            alert("ajax과정 실패");
       }
        
    });
};
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
/* $(function(){
    
	getCommunityReplyList();
	var articleNo = ${param.articleNo};
	var regDate = "${param.regDate}";
    //alert(articleNo);
	//alert("Ajax진입 getCommunityReplyList");
}); */
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommunityReplyList(articleNo){
	
	//alert("Ajax진입 getCommunityReplyList");
	//alert(articleNo);
	//값이 나오는데 값을 list의 사이즈만큼 돌려서 data(결과값)값이 2개면 2갸를 list의 사이즈만큼 배치
    $.ajax(
    		{
        url : "/community/json/getReplyListUnderArticle/"+articleNo,
    	method:"GET",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		}, 
        dataType : "json",
        success : function(data){
            console.log(data.length);
            //console.log(data);
            alert(data);
        	//alert("Ajax 성공");
            var displayReply = "";
            var count = data.length; 
            
//            if(data.length > 0){
				
                 for(var i=0; i<data.length; i++){
            //     	 displayReply += "<div>";
                	 displayReply += "<div class='reply_container'><div class='replyProfileImage'>";
                 	 displayReply += "<span class='replyProfileImageSpan'><img alt='댓글작성자프로필 사진'></span></div>";
                	 displayReply += "<div class='replyUserProfile'><h3 class='replyUserNameProfile'>댓글 작성자 이름</h3>";
                	 displayReply += "<h4 class='replyRegDate'>"+data[i].regDate+"</h4></div></div>";
                	 displayReply += "<div class='reply_container'><div class='replyContent'>";
                	 displayReply += "<span class='replyContent'>"+data[i].replyContent+"</span>";
                	 displayReply += "</div></div></div>";  
                	 displayReply += "<div>";
                	 //displayReply += data[i].replyContent;
                	 displayReply += "<div>";
                	 
                } 
//            } 
            //else {
            		$(".replyList").html(displayReply);
                
/*                 html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>"; */
                
           // }
             $("#count").html(count+"개의 댓글");
            
        },
        error:function(request,status,error){
        	//alert("ajax  실패 getCommunityReplyList");
       } 
        
    });
}
 
</script>
    	  
</head>
<body>

			<!-- 댓글 파트 -->
				<div id="count"></div>
			<div class="replyList">
				<div class="reply_container">  
					<!-- 댓글 작성자 프로필 파트 -->
					<div class="replyProfileImage">
						<span class="replyProfileImageSpan">
							<img alt="댓글작성자프로필 사진" src="">
						</span>
					</div> 
					
					<!-- 댓글 작성자 프로필 중 이름 및 작성날짜 -->
					<div class="replyUserProfile">
						<h3 class="replyUserNameProfile">댓글 작성자 이름</h3>
						<h4 class="replyRegDate">${param.regDate}</h4>
					</div>
				</div> 
				
				<!-- 댓글 내용 -->
				<div class="reply_container">
					<div class="replyContent">
						<span class="replyContent">${param.replyContent}</span>
					</div>
				</div>
			</div> 
			
<!-- 댓글 등록시 -->
<!-- 
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div>
        
        </div>
    </form>
</div> -->
			
<!-- 댓글 작성 -->
<!--  
<div class="container">
	
 	<form id="replyForm" name="replyForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Reply</strong></span> <span id="cCnt"></span>
            </div>
            
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 800px" rows="3" cols="30" class="replyInput" id="replyInput" name="replyInput" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_reply('${param.articleNo}')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>
-->

 
 
</body>
</html> --%>