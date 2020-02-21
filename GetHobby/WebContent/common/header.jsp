<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="/admin/user/listUserAdmin">
                    <div class="sidebar-svg">
                    	<svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M18 21v-2c0-2.347-1.495-6-6-6s-6 3.653-6 6v2H4v-2c0-2.826 1.607-6.544 5.505-7.666A4.997 4.997 0 017 7c0-2.762 2.238-5 5-5 2.763 0 5 2.238 5 5a4.997 4.997 0 01-2.505 4.334C18.393 12.456 20 16.174 20 19v2h-2zm-6-11c1.658 0 3-1.342 3-3s-1.342-3-3-3-3 1.342-3 3 1.342 3 3 3z"></path></svg>
                    </div>
           	        <div class="sidebar-text">
						회원
           	        </div>
                 	</a>                   
                </li>
                <li>
                    <a href="/admin/hobbyClass/getHobbyClassListAdmin">
           			<div class="sidebar-svg">
						<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
							<path d="M0 0h24v24H0V0z" fill="none"/>
							<path d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM9 4h2v5l-1-.75L9 9V4zm9 16H6V4h1v9l3-2.25L13 13V4h5v16z"/>
						</svg>
					</div>
					<div class="sidebar-text">
						 클래스
					</div>   
                   </a>
                </li>
                <li>
                    <a href="#pageSubmenu">
                    <div class="sidebar-svg">
						<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
							<path d="M0 0h24v24H0V0z" fill="none"/>
							<path d="M8.66 13.07c.15 0 .29-.01.43-.03C9.56 14.19 10.69 15 12 15s2.44-.81 2.91-1.96c.14.02.29.03.43.03 1.73 0 3.14-1.41 3.14-3.14 0-.71-.25-1.39-.67-1.93.43-.54.67-1.22.67-1.93 0-1.73-1.41-3.14-3.14-3.14-.15 0-.29.01-.43.03C14.44 1.81 13.31 1 12 1s-2.44.81-2.91 1.96c-.14-.02-.29-.03-.43-.03-1.73 0-3.14 1.41-3.14 3.14 0 .71.25 1.39.67 1.93-.43.54-.68 1.22-.68 1.93 0 1.73 1.41 3.14 3.15 3.14zM12 13c-.62 0-1.12-.49-1.14-1.1l.12-1.09c.32.12.66.19 1.02.19s.71-.07 1.03-.19l.11 1.09c-.02.61-.52 1.1-1.14 1.1zm3.34-1.93c-.24 0-.46-.07-.64-.2l-.81-.57c.55-.45.94-1.09 1.06-1.83l.88.42c.4.19.66.59.66 1.03 0 .64-.52 1.15-1.15 1.15zm-.65-5.94c.2-.13.42-.2.65-.2.63 0 1.14.51 1.14 1.14 0 .44-.25.83-.66 1.03l-.88.42c-.12-.74-.51-1.38-1.07-1.83l.82-.56zM12 3c.62 0 1.12.49 1.14 1.1l-.11 1.09C12.71 5.07 12.36 5 12 5s-.7.07-1.02.19l-.12-1.09c.02-.61.52-1.1 1.14-1.1zM8.66 4.93c.24 0 .46.07.64.2l.81.56c-.55.45-.94 1.09-1.06 1.83l-.88-.42c-.4-.2-.66-.59-.66-1.03 0-.63.52-1.14 1.15-1.14zM8.17 8.9l.88-.42c.12.74.51 1.38 1.07 1.83l-.81.55c-.2.13-.42.2-.65.2-.63 0-1.14-.51-1.14-1.14-.01-.43.25-.82.65-1.02zM12 22c4.97 0 9-4.03 9-9-4.97 0-9 4.03-9 9zm2.44-2.44c.71-1.9 2.22-3.42 4.12-4.12-.71 1.9-2.22 3.41-4.12 4.12zM3 13c0 4.97 4.03 9 9 9 0-4.97-4.03-9-9-9zm2.44 2.44c1.9.71 3.42 2.22 4.12 4.12-1.9-.71-3.41-2.22-4.12-4.12z"/>
						</svg>					
					</div>  
                    <div class="sidebar-text">
						이벤트
           	        </div>
           	        </a>                    
                </li>
                <li>
                    <a href="/admin/purchase/getPaymentHistoryListAdmin">
           			<div class="sidebar-svg">
						<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
							<path d="M0 0h24v24H0V0z" fill="none"/>
							<path d="M20 4H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4v-6h16v6zm0-10H4V6h16v2z"/>
						</svg>
					</div>
                    <div class="sidebar-text">
						구매
           	        </div>           
                    </a>
                </li>
                <li>
                    <a href="#">
           			<div class="sidebar-svg">
						<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
							<path d="M0 0h24v24H0V0z" fill="none"/>
								<circle cx="12" cy="19" r="2"/>
							<path d="M12 3c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2s2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
						</svg>
						</div>   
                    <div class="sidebar-text">
						신고
           	        </div>        
                    </a>
                </li>
            </ul>        
        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light header-navbar">
               <div class="container-fluid" style="padding:0px 16px; background-color:black; height:100%; width:100%;">

                   <div href="/index.jsp" id="sidebarCollapse" class="test" style="border:0; outline:none; background-color: black; display:flex; justify-content: left;">   
                   	                    
					<img src="/resources/image/logo/logo-favicon.png">	
					<a href="/index.jsp" style="float:left; color:white; font-size:22px; font-weight:bold; line-height:32px; margin-left:12px; etter-spacing: -0.4px;">
                   	  GetHobby
                   </a>
                   </div>
					<div style="display: flex; justify-content: right;">
                   <a href="/searchhobbyclass/getSearchHobbyClassList.jsp" class="header-title-box-single">
                   			클래스
                   </a>
                   <a href="/event/eventList" class="header-title-box-single">
                   	이벤트
                   </a>
                   
                   <!-- Get취미 커뮤니티 -->
                   <div class="dropdown d-flex justify-content-end">
			                <div class="dropdown-icon header-mynemo-check-mylist" data-toggle="dropdown" aria-expanded="false" style="justify-content: space-between; display:flex; align-items: center;">
			                	<span class="header-title-box-single">
			                    	Get취미 커뮤니티
			                    </span>
			                    
			                    <div class="header-mynemo-profile-flow-one fa-angle-down">
									<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
										<path d="M12 8l-6 6 1.41 1.41L12 10.83l4.59 4.58L18 14z" fill="#ffffff"/>
										<path d="M0 0h24v24H0z" fill="none"/>
									</svg>
								</div>
			                </div>
			
							<!-- 마이페이지 미니메뉴 -->
							<div class="dropdown-menu dropdown-menu-right header-dropdown mt-3 p-2 border-0 first-load-div" style="position:absolute; top: -100px;">
				                <div class="header-mynemo-out-div" style="padding:0px;">
				                
		
				                
					                <div color="#1b1c1d" class="header-mynemo-logout-div">
					                	<a href="/article/getBoardArticleList?boardCode=0" class="header-mynemo-logout-span" style="float:left;">자유게시판</a>
					                	<a href="/article/getBoardArticleList?boardCode=1" class="header-mynemo-logout-span" style="float:left;">사진게시판</a>
					                </div>
					                
				                </div>
			                </div>
			                
			            </div>
                   
                   <c:if test="${ ! empty user }">
	                   <c:if test="${ sessionScope.user.role == '1' }">
	                   <a href="/hobbyclass/getMyHobbyClassList" id="c1" class="header-title-box-single">
	                   	크리에이터 센터
	                   </a>
	                   </c:if>
	                   <c:if test="${ sessionScope.user.role == '0' }">
	                   <a href="/user/changeUserCreator" id="c2" class="header-title-box-single">
	                  	 크리에이터 지원
	                   </a>
	                   </c:if>
                   </c:if>
                   
                   <c:if test="${ empty user }">
                   <a href="/user/addUser" id="h1" class="header-title-box-single">
                   	회원가입
                   </a>
                   <a href="/user/captcha" id="h2" class="header-title-box-single">
                  	 로그인
                   </a>
                   </c:if>
                   
                   <c:if test="${ ! empty user }">
                   <div style="margin:0px 24px; padding:0px; color:white; font-size:24px; font-weight:bold; line-height:32px; etter-spacing: -0.4px;">
                   		
                   		<!-- 프로필 -->
			            <div class="dropdown d-flex justify-content-end">
			                <div class="dropdown-icon header-mynemo-check-mylist" data-toggle="dropdown" aria-expanded="false" style="justify-content: space-between; display:flex; align-items: center;">
			                	<span class="header-mynemo-first-span">
			                    	<img src="/resources/image/gon/0123456789123.jpg" class="header-mynemo-proimage-image">
			                    </span>
			                    
			                    <div class="header-mynemo-profile-flow-one fa-angle-down">
									<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
										<path d="M12 8l-6 6 1.41 1.41L12 10.83l4.59 4.58L18 14z" fill="#ffffff"/>
										<path d="M0 0h24v24H0z" fill="none"/>
									</svg>
								</div>
			                </div>
			
							<!-- 마이페이지 미니메뉴 -->
							<div class="dropdown-menu dropdown-menu-right header-dropdown mt-3 p-2 border-0 first-load-div" style="position:absolute; top: -100px;">
				                <div class="header-mynemo-out-div">
				                <a class="header-mynemo-first-a" href="/user/mypageUser">
					                <span class="header-mynemo-first-span">
					                	<img src="/resources/image/gon/0123456789123.jpg" class="header-mynemo-proimage-image">
					                </span>
					                <div class="header-mynemo-span-next-first-div">
						                <div class="header-mynemo-span-next-first-div-in-div">
						                	${user.nickName}
						                </div>
						                <span class="header-mynemo-span-next-first-div-in-span">
							                <div color="#fd7e14" class="header-mynemo-span-next-first-div-in-mypage-text">
							                	마이페이지
							                </div>
							                <svg width="12" height="12" viewBox="0 0 24 24">
							                	<path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z" />
							                </svg>
						                </span>
					                </div>
				                </a>
		
				                <div><hr class="header-mynemo-logout-hr">
				                <div color="#1b1c1d" class="header-mynemo-logout-div">
				                <a href="/user/logout" class="header-mynemo-logout-span">로그아웃</a></div></div></div>
			                </div>
			                
			            </div>
			       
			        </div>
			        </c:if>
			        
                   </div>
               </div>
           </nav>
  
        </div>
    </div>
