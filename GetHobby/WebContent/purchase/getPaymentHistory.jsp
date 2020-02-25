<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%-- //2020-02-24 Git Commit --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>  
  <link rel="stylesheet" href="/resources/css/purchase.css">
<style>
	body{
		margin: 0px;
		padding: 0px;
	}
	@media (max-width: 580px) {
   		.paymentHistory-main-div {
	   		display: block;
	    	margin-top: 0em;
	    	width: 100%;
	    	margin: auto;
   		}
   		.paymentHistory-content-div {
			margin: auto;
			width: 100%;
		}
   	}
	@media (min-width: 581px) {
		.paymentHistory-main-div {
	   		display: block;
	    	margin-top: 0em;
	    	width: 640px;
	    	margin: auto;
   		}
   		.paymentHistory-content-div {
			margin: auto;
			width: 640px;
		}
   	}
   	.paymentHistory-title-div{
   		position: relative;
	    background-color: rgb(255, 255, 255);
	    padding: 24px;
   	}
   	.paymentHistory-title-title {
   		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(133, 138, 141);
	    margin: 0px;
	    padding: 0px;
	    position: relative;
	    width: 100%;
	    height: 18px;
   	}
   	.paymentHistory-title-content {
   		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-top: 12px;
   	}
   	.title-same {
   		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(133, 138, 141);
	    padding: 0px;
	    display: inline-block;
	    
   	}
   	.title-same-div {
   		
   	}
   	
   	.title-noSame {
   		color: rgb(27, 28, 29);
   	}
   	.title-content-div {
   		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
   	}
   	.title-content-spanOne{
   		font-size: 20px;
	    font-weight: bold;
	    color: rgb(62, 64, 66);
	    line-height: 28px;
	    letter-spacing: -0.3px;
	    margin: 0px;
   	}
   	.title-content-spanTwo{
   		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(133, 138, 141);
	    margin: 0px 0px 0px 8px;
   	}
   	.title-a-same{
   		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: inherit;
	    margin: 0px;
	    vertical-align: middle;
   	}
   	.history-blank-div {
   		background-color: rgb(248, 248, 249);
	    width: 100%;
	    height: 8px;
   	}
   	.history-blank-line-div {
   		background-color: rgb(248, 248, 249);
	    width: 100%;
	    height: 10px;
   	}
   	.history-content-blank-div {
   		background-color: rgb(248, 248, 249);
	    width: 100%;
	    height: 2px;
   	}
   	.noBuyClass-div {
   		display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    height: 100%;
	    width: 100%;
	    padding-top: 16px;
	    padding-bottom: 52px;
   	}
   	.noBuyImage {
   		vertical-align: middle;
	    border-style: none;
	    width: 40%;
   	}
   	.noBuyClass-span {
   		font-size: 16px;
	    color: rgb(168, 174, 179);
	    font-weight: 300;
   	}
   	.history-content-section {
   		padding: 20px 24px;
   	}
   	.history-content-button-text {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    vertical-align: middle;
	    margin: 0px;
	    text-align: center;
	    -webkit-box-align: center;
	}
	
	.history-content-button-buy {
		position: relative;
	    width: 100%;

	    text-align: left;
	    padding: 12px 16px;
	    border-width: 0px;
	    border-style: initial;
	    border-color: initial;
	    border-image: initial;
	    outline: none;   
	    font-family: inherit;			
	    cursor: pointer;
	    background-color: rgb(255, 146, 43);
	}
	.history-content-button-buy-text {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    vertical-align: middle;
	    margin: 0px;
	    text-align: center;
	    -webkit-box-align: center;
	}
	
	.history-content-button {
		position: relative;
	    width: 100%;

	    text-align: left;
	    padding: 12px 16px;
	    border-width: 0px;
	    border-style: initial;
	    border-color: initial;
	    border-image: initial;
	    outline: none;   
	    font-family: inherit;			
	    cursor: pointer;
	    background-color: rgb(213, 218, 221);
	}
	.history-content-section-top {
		width:100%;
		padding:0px;
		margin-top: 20px;
	}
	.history-content-section-in {
		
	}
	.history-content-title-h4 {
		margin-bottom: 10px;
		margin-top: 0px;
	}
	.history-content-kit-title-h4 {
		margin-bottom: 10px;
		margin-top: 0px;
		color: rgb(42, 143, 180);
		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	}
	.history-content-div-out {
		display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    align-content: flex-start;
	    margin-bottom: 16px;
	}
	.history-content-div-out-exit {
		display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    align-content: flex-start;
	}
	.history-content-div-in-image {
		width: 120px;
		height: 90px;
		float: left;
		margin-right: 16px;
	}
	.history-content-div-kit-image {
		width: 120px;
		height: 100px;
		float: left;
		margin-right: 16px;
	}
	.history-content-div-in-content {
		float: left;
	}
	.history-content-div-in-content-title {
		font-size: 14px;
	    font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(62, 64, 66);
	}
	.history-content-div-in-content-content {
		font-size: 11px;
	    font-weight: normal;
	    line-height: 8px;
	    letter-spacing: normal;
	    color: rgb(168, 174, 179);
	    white-space: pre-line;
	    
	}
	.history-content-top-title {
		display: flex;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    flex-wrap: wrap;
	    padding: 14px 0px;	
	}
	.history-content-top-title-one {
		-webkit-box-flex: 1;
	    flex-grow: 1;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 14px;
	    
	}
	.history-content-top-title-button {
		-webkit-appearance: button;
		display: inline-flex;
	    vertical-align: middle;
	    font-size: 14px;
	    font-weight: 500;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    background: none;
	    transition: color 0.1s ease 0s;
	    border: 0;
	    outline: none;
	    color: rgb(253, 126, 20);
	    cursor: pointer;
	}
	.text-left {
		text-align: left;
	}
</style>


</head>
<body>
	<input type="hidden" id="maxPage" value="${purchaseMap.maxPage}">
	<div class="paymentHistory-main-div">
	<div class="paymentHistoryList">
		<div class="paymentHistory-title-div">
			<div class="paymentHistory-title-title">
				<div class="title-same">
					<a class="title-a-same" href="/user/mypageUser">
						마이페이지
					</a>
					<!-- <img src="/images/ic-chevron-gray.png" class=""> -->
				</div>
				<div disabled="" class="title-same title-noSame">
					<a class="title-a-same" href="/purchase/getPaymentHistoryList">
						주문 및 배송
					</a>
				</div>
			</div>
			<div class="paymentHistory-title-content" style="margin-top: 12px;">
				<div class="title-content-div">
					<span class="title-content-spanOne">
						주문 및 배송
					</span>
					<span class="title-content-spanTwo">
						${purchaseMap.totalCount} 개
					</span>
				</div>
			</div>
		</div>
		<div class="history-blank-div"></div>
		
		<c:if test="${purchaseMap.totalCount} == 0">
		<div class="noBuyClass-div">
		<img src="/resources/image/gon/empty-pay.png" class="noBuyImage">
		<span class="noBuyClass-span">
		아직 구매하신 클래스가 없어요
		</span>
		</div>
		</c:if>
		
		<div class="row">
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${purchaseMap.purchaseList}">
		<c:set var="i" value="${i+1}" />
		
			<div class="paymentHistory-content-div">
				<section class="history-content-section">
					
					<div class="history-content-top-title">
						<div class="history-content-top-title-one test">
							${fn:substring( purchase.purchaseDate,0,4 ) }.${fn:substring( purchase.purchaseDate,5,7 ) }.${fn:substring( purchase.purchaseDate,8,10 ) }
						</div>
						<input type="hidden" name="purchaseId" value="${purchase.purchaseId}">
						<button class="history-content-top-title-button">				
							주문상세보기						
							<svg width="16" height="16" viewBox="0 0 24 16"><path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z"></path></svg>	
						</button>
					</div>
					<div class="history-content-blank-div"></div>
					<div>
					<div class="history-content-section-top">
						<div class="history-content-section-in">
							<h4 class="history-content-title-h4">
							<c:if test="${purchase.purchaseState == '0' || purchase.purchaseState == '1' || purchase.purchaseState == '2'}">						
							결제 성공
							</c:if>	
							<c:if test="${purchase.purchaseState == '3'}">
							<div class="history-content-kit-title-h4">
								주문 취소 대기 중입니다.
							</div>
							</c:if>
							<c:if test="${purchase.purchaseState == '4'}">
							취소 성공
							</c:if>											
							</h4>
						</div>
						<div class="history-content-div-out">
							<div class="history-content-div-in-image">
								<img class="history-content-div-in-image" alt="" src="/images/hobbyclass/${purchase.hobbyClass.hobbyClassImage}">
							</div>
							<div class="history-content-div-in-content">
								<div class="history-content-div-in-content-title">
									${purchase.hobbyClass.hobbyClassName}
								</div>
								<div class="history-content-div-in-content-content">
									15주 수강권
								</div>
							</div>
						</div>
					</div>
					<c:if test="${purchase.purchaseState == '1' || purchase.purchaseState == '2'}">
					<button data-test-id="payment-method-CARD" type="button" class="history-content-button gph-alsb" style="margin-bottom:16px;">
						<div class="history-content-button-text">
						앱에서 수강하기
						<input type="hidden" name="history-list-hobbyClassNo-val" value="${purchase.hobbyClass.hobbyClassNo}">
						</div>
					</button>
					</c:if>
					</div>
					<div class="history-content-blank-div"></div>
					
					<c:if test="${purchase.componentOption == '1'}">
					<div class="history-content-section-top">
						<div class="history-content-section-in">
							<h4 class="history-content-kit-title-h4">
								<c:if test="${purchase.purchaseState == '1'}">
								상품이 배송 중입니다.
								</c:if>
								<c:if test="${purchase.purchaseState == '2'}">
								<h4 class="history-content-title-h4">
									배송 완료
								</h4>
								
								</c:if>
							</h4>
						</div>
						<div class="history-content-div-out">
							<div class="history-content-div-kit-image">
								<img class="history-content-div-kit-image" alt="" src="/images/hobbyclass/${purchase.hobbyClass.kitImage}">
							</div>
							<div class="history-content-div-in-content">
								<div class="history-content-div-in-content-title">
									${purchase.hobbyClass.kitName}
								</div>
							</div>
						</div>
					</div>
					<c:if test="${purchase.purchaseState == '1' || purchase.purchaseState == '2'}">
					<button type="button" class="history-content-button">
						<div class="history-content-button-text">
						배송 조회
						</div>
					</button>
					</c:if>
					</c:if>
					
				</section>
			
			
			</div>
				
		</c:forEach>
		</div>
	</div>
		
		
		
		<div class="history-blank-line-div"></div>

			<div class="detailPaymentHistory" style="display: none">
			<!-- 주문 상세 내역 -->
			<div class="paymentHistory-title-div">
			<div class="paymentHistory-title-title">
				<div class="title-same">
					<a class="title-a-same" href="/user/mypageUser">
						마이페이지
					</a>
					<!-- <img src="/images/ic-chevron-gray.png" class=""> -->
				</div>
				<div disabled="" class="title-same title-noSame">
					<a class="title-a-same" href="/purchase/getPaymentHistoryList">
						주문 및 배송
					</a>
				</div>
				<div disabled="" class="title-same title-noSame">
					<a class="title-a-same" href="">
						주문 상세
					</a>
				</div>
			</div>
			<div class="paymentHistory-title-content" style="margin-top: 12px;">
				<div class="title-content-div">
					<span class="title-content-spanOne history-purchaseDate">
						
					</span>
					<span class="title-content-spanOne" style="margin-left: 8px;">
						주문 상세 내역
					</span>
				</div>
			</div>
		</div>
		<div class="history-blank-div"></div>
		
		<section class="final-price-info-section" style="padding: 24px 24px 0px 24px;">
						<div class="price-info-out-div">
							<div class="price-info-in-div">
								<h4 class="info-title-h4 history-purchaseState">
									
								</h4>
							</div>
						</div>
						<table class="final-price-info-table">
						<tbody>
							<tr>
								<th style="width:100px;">
									결제 수단
								</th>
								<td class="payment-totalPrice" style="text-align: left;">
									<b class="history-payMethod"></b>
								</td>
							</tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr>
								<th>
									총 상품 금액
								</th>
								<td class="payment-totalPrice history-totalPrice">
									
								</td>
							</tr>
							<tr>
								<th>
									상품 할인 금액
								</th>
								<td class="history-salePrice">
									
								</td>
							</tr>
							<tr>
								<th>
									배송료
								</th>
								<td class="paymentSalePrice">
									0원
								</td>
							</tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
						</tbody>
						<tfoot>
							<tr >
								<th class="final-price-out-th">
								<div class="final-price-in-div">
									<strong>
										총 결제 금액
									</strong>
								</div>
								</th>
								<td class="final-price-in-result-td">
									<div class="final-price-in-result-div">
										<strong>
											<span class="paymentTotalPrice history-finalPrice">
												
											</span>
										</strong>
									</div>
								</td>
							</tr>
						</tfoot>
						</table>
						<div class="final-price-blank-div"></div>
					</section>
					
					<section class="final-price-info-section history-dlvy-section" style="padding: 24px 24px 0px 24px;">
						<div class="history-content-top-title">
							<div class="history-content-top-title-one">
								<h4 class="info-title-h4">
									배송 정보
								</h4>
							</div>
						</div>
						<table class="final-price-info-table">
						<tbody>
							<tr>
								<th style="width:96px;">
									받는 분
								</th>
								<td class="payment-totalPrice text-left history-receiverName">
									
								</td>
							</tr>
							<tr>
								<th>
									연락처
								</th>
								<td class=" text-left history-receiverPhone">
									
								</td>
							</tr>
							<tr>
								<th>
									배송 주소
								</th>
								<td class="paymentSalePrice text-left history-dlvyAddress">
									
								</td>
							</tr>
							<tr>
								<th>
									배송 요청사항
								</th>
								<td class="paymentSalePrice text-left history-dlvyRequest">
									
								</td>
							</tr>
							
						</tbody>
						</table>
						<div class="final-price-blank-div"></div>
					</section>
					
					
			<section class="history-content-section">
			
				<div class="history-content-blank-div"></div>
				<div>
				<div class="history-content-section-top">
					<div class="history-content-section-in">
						<h4 class="info-title-h4">
							구매 물품
						</h4>		
					</div>
					<div class="history-content-div-out">
						<div class="history-content-div-in-image">
							<img class="history-content-div-in-image history-hobbyClassImage" alt="" src="/images/hobbyclass/${purchase.hobbyClass.hobbyClassImage}">
						</div>
						<div class="history-content-div-in-content">
							<div class="history-content-div-in-content-title history-hobbyClassName">
								
							</div>
							<div class="history-content-div-in-content-content">
								15주 수강권
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="history-hobbyClassNo" value="">
				<input type="hidden" name="history-lessonNo" value="">
				<button data-test-id="payment-method-CARD" type="button" class="history-content-button history-lesson-button" style="margin-bottom:16px;">
					<div class="history-content-button-text">
					앱에서 수강하기
					</div>
				</button>
				</div>
				<div class="history-content-blank-div"></div>
				
				<div class="history-content-section-top history-kit-div">
					<div class="history-content-section-in">
						<h4 class="history-content-kit-title-h4 history-dlvy-state">
							
						</h4>
					</div>
					<div class="history-content-div-out">
						<div class="history-content-div-kit-image">
							<img class="history-content-div-kit-image history-kitImage" alt="" src="/images/hobbyclass/${purchase.hobbyClass.kitImage}">
						</div>
						<div class="history-content-div-in-content">
							<div class="history-content-div-in-content-title history-kitName">
								
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="history-content-button-buy history-getdlvy-button">
					<div class="history-content-button-buy-text">
					배송 조회
					</div>
				</button>
				<input type="hidden" name="history-purchaseId" value=""> 
				<input type="hidden" name="history-purchasePrice" value=""> 
				<button type="button" class="history-content-button history-refund-button" style="margin-top:32px;">
					<div class="history-content-button-text">
					주문 취소하기
					</div>
				</button>
				
			</section>
			</div>		
					
					
					
			
	
	</div>
	
	<script type="text/javascript">
		
	function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(function(){

		$(document).on("mouseover",".history-content-button" , function(){
			$(this).css("background-color","rgb(183, 188, 191)");
		});
		$(document).on("mouseleave",".history-content-button", function(){
			$(this).css("background-color","rgb(213, 218, 221)");
		});
		$(document).on("mouseover",".history-content-button-buy", function(){
			$(this).css("background-color","rgb(253, 126, 20)");
		});
		$(document).on("mouseleave",".history-content-button-buy", function(){
			$(this).css("background-color","rgb(255, 146, 43)");
		});
		
		
		
		/////////////////////////////////////////////////////////////////////////////////
		$(document).on("click", ".history-lesson-button", function(){
			self.location = "/purchase/getLessonPage?hobbyClassNo="+$("input[name='history-hobbyClassNo']").val();
		});
		
		$(document).on("click", ".gph-alsb", function(){
			self.location = "/purchase/getLessonPage?hobbyClassNo="+$(this).find("input[name='history-list-hobbyClassNo-val']").val();
		});
		
		
		/////////////////////////////////////////////////////////////////////////////////
		
		
		$(document).on("click", ".history-refund-button", function(){
			var refundConfirm = confirm("정말로 취소하시겠습니까? 클래스 혜택을 받지 못하실 수 있습니다.");
			$.ajax (
					{
						url : "/purchase/json/requestRefund",
						method : "POST",
						data : JSON.stringify({
							purchaseId: $(this).parent().find("input[name='history-purchaseId']").val(),
							hobbyClass: {hobbyClassNo: $(this).parent().find("input[name='history-hobbyClassNo']").val()},
							purchasePrice: $(this).parent().find("input[name='history-purchasePrice']").val()
						}),
						dataType : "json" ,
    					headers : {
    						"Accept" : "application/json" ,
    						"Content-Type" : "application/json"
    					} ,
						success: function(JSONData, status){							
							alert("주문 취소 신청이 완료되었습니다.");
							$(".history-finalPrice").text( numberFormat(JSONData.purchasePrice)+"원" );
							$(".history-purchaseState").html('<div class="history-content-kit-title-h4">주문 취소 대기 중입니다.</div>');
							$(".history-lesson-button").css("display","none");
							$(".history-refund-button").css("display","none");
							$(".history-getdlvy-button").css("display","none");
							$(".history-dlvy-state").text("반품이 완료되었습니다.");
							
						}
			
			});
		});
		
		$(document).on("click",".history-content-top-title-button", function(){
			$.ajax (
					{
						url : "/purchase/json/getPaymentHistory",
						method : "POST",
						data : JSON.stringify({
							purchaseId: $(this).parent().find("input[name='purchaseId']").val()
						}),
						dataType : "json" ,
    					headers : {
    						"Accept" : "application/json" ,
    						"Content-Type" : "application/json"
    					} ,
						success: function(JSONData){
							// Display Navigation
							$(".detailPaymentHistory").css("display","block");
							$(".paymentHistoryList").css("display","none");
							if( JSONData.componentOption == '0'){
								$(".history-dlvy-section").css("display","none");
								$(".history-kit-div").css("display","none");
								$(".history-getdlvy-button").css("display","none");
								$(".history-refund-button").css("display","none");
								
							}else if( JSONData.componentOption == '1'){
								$(".history-dlvy-section").css("display","block");
								$(".history-kit-div").css("display","block");
								$(".history-getdlvy-button").css("display","block");
								$(".history-refund-button").css("display","block");
							}
							if( JSONData.purchaseState == '0' ){
								$(".history-purchaseState").text("결제 성공");
								$(".history-lesson-button").css("display","none");
								$(".history-refund-button").css("display","block");
								$(".history-getdlvy-button").css("display","none");
								if( JSONData.componentOption == '1'){
									$(".history-dlvy-state").text("상품이 배송 준비 중입니다.");
								}
							}else if( JSONData.purchaseState == '1' ){
								if( JSONData.componentOption == '1'){
									$(".history-refund-button").css("display","block");
									$(".history-dlvy-state").text("상품이 배송 중입니다.");
								}else if( JSONData.componentOption == '0' ){
									$(".history-lesson-button").css("display","block");
								}
							}else if( JSONData.purchaseState == '2' ){
								if( JSONData.componentOption == '1'){
									$(".history-refund-button").css("display","block");
									$(".history-dlvy-state").html('<h4 style="color:black; margin:0px;">배송 완료</h4>'); ////
								}else if( JSONData.componentOption == '0' ){
									$(".history-lesson-button").css("display","block");
								}
							}else if( JSONData.purchaseState == '3' ){
								$(".history-purchaseState").html('<div class="history-content-kit-title-h4">주문 취소 대기 중입니다.</div>');
								$(".history-lesson-button").css("display","none");
								$(".history-refund-button").css("display","none");
								$(".history-getdlvy-button").css("display","none");
								if( JSONData.componentOption == '1'){
									$(".history-dlvy-state").text("반품이 완료되었습니다.");
								}
							}else if( JSONData.purchaseState == '4' ){
								$(".history-purchaseState").text("취소 성공");
								$(".history-lesson-button").css("display","none");
								$(".history-refund-button").css("display","none");
								$(".history-getdlvy-button").css("display","none");
								if( JSONData.componentOption == '1'){
									$(".history-dlvy-state").text("반품이 완료되었습니다.");
								}
							}
							
							// Data
							var payMethod;
							if ( JSONData.payMethod == 0){
								payMethod = '카드';
							}else if( JSONData.payMethod == 1){
								payMethod = '휴대폰'
							}							
							var purchaseDate = JSONData.purchaseDate.substring(0,4) + "."
							+ JSONData.purchaseDate.substring(5,7) + "."
							+ JSONData.purchaseDate.substring(8,10);
							var totalPrice;
							if( JSONData.componentOption == '0' ){
								totalPrice = JSONData.hobbyClass.hobbyClassPrice;
							}else if( JSONData.componentOption == '1' ){
								totalPrice = JSONData.hobbyClass.hobbyClassPrice + JSONData.hobbyClass.kitPrice;
							}
							var salePrice = totalPrice - JSONData.purchasePrice;
							var finalPrice = totalPrice - salePrice;
							$(".history-payMethod").text(payMethod);
							$(".history-purchaseDate").text(purchaseDate);
							$(".history-totalPrice").text( numberFormat(totalPrice)+"원" );
							$(".history-salePrice").text( numberFormat(salePrice)+"원" );
							$(".history-finalPrice").text( numberFormat(finalPrice)+"원" );
							$(".history-receiverName").text(JSONData.receiverName);
							$(".history-receiverPhone").text(JSONData.receiverPhone);
							$(".history-dlvyAddress").text( JSONData.dlvyAddr+" "+JSONData.dlvyDetailAddr);
							$(".history-dlvyRequest").text(JSONData.dlvyRequest);
							$(".history-hobbyClassName").text(JSONData.hobbyClass.hobbyClassName);
							$(".history-kitName").text(JSONData.hobbyClass.kitName);
							$(".history-hobbyClassImage").attr("src","/images/hobbyclass/"+JSONData.hobbyClass.hobbyClassImage);
							$(".history-kitImage").attr("src","/images/hobbyclass/"+JSONData.hobbyClass.kitImage);
							$("input[name='history-purchaseId']").val(JSONData.purchaseId);
							$("input[name='history-purchasePrice']").val(JSONData.purchasePrice);
							$("input[name='history-hobbyClassNo']").val(JSONData.hobbyClass.hobbyClassNo);
							$("input[name='history-lessonNo']").val(JSONData.lesson.lessonNo);
							
						}
				})//end of ajax
			
		});

	});	
//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////
	$(function(){
		var bool = true;
		var currentPage = 2;
		$(window).scroll(function(){
			var window = $(this);
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();            
            
            if(bool){          	
	            if( scrollTop + windowHeight + 300 > documentHeight ){
	            	bool = false;
	            	//쓰로틀링 설정
	            	var timeout = setTimeout(function(){
	            		bool = true;
	            		
	            		
	            	},1000);//end of setTimeout

	            	//쓰로틀링 종료
	            	if( $("#maxPage").val() == currentPage ){
	            		clearTimeout(timeout);
	            	}//end of clearTimeout
	            	
	            		$.ajax(
	            				{
	            					url : "/purchase/json/getPaymentHistoryList" ,
	            					method : "POST" ,
	            					data : JSON.stringify({
	            						currentPage : currentPage
	            					}) ,
	            					dataType : "json" ,
	            					headers : {
	            						"Accept" : "application/json" ,
	            						"Content-Type" : "application/json"
	            					} ,
	            					success : function(JSONData , status){
										var displayValue = "";
										for(var i=0; i<JSONData.purchaseList.length; i++){				
											var purchaseDate = JSONData.purchaseList[i].purchaseDate.substring(0,4) + "."
														+ JSONData.purchaseList[i].purchaseDate.substring(5,7) + "."
														+ JSONData.purchaseList[i].purchaseDate.substring(8,10);
											var displayHtml = '<div class="paymentHistory-content-div">'
																+'<section class="history-content-section">'
																+'<div class="history-content-top-title">'
																+'<div class="history-content-top-title-one test">'
																+purchaseDate
																+'</div>'
																+'<input type="hidden" name="purchaseId" value="'+JSONData.purchaseList[i].purchaseId+'">'
																+'<button class="history-content-top-title-button">'
																+'주문상세보기'
																+'<svg width="16" height="16" viewBox="0 0 24 16">'
																+'<path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z">'
																+'</path></svg></button></div>'
																+'<div class="history-content-blank-div"></div><div>'
																+'<div class="history-content-section-top">'
																+'<div class="history-content-section-in">'
																+'<h4 class="history-content-title-h4">';
											
																if( JSONData.purchaseList[i].purchaseState == 0 || 
																		JSONData.purchaseList[i].purchaseState == 1 ||
																		JSONData.purchaseList[i].purchaseState == 2 ){
																	displayHtml +='결제 성공';
																}else if( JSONData.purchaseList.purchaseState == 3 ){
																	displayHtml +='<div class="history-content-kit-title-h4">주문 취소 대기 중입니다.</div>';
																}else if( JSONData.purchaseList[i].purchaseState == 4 ){
																	displayHtml +='취소 성공';
																}
												displayHtml +=				
																'</h4>'
																+'</div>'
																+'<div class="history-content-div-out">'
																+'<div class="history-content-div-in-image">'
																+'<img class="history-content-div-in-image" alt="" src="/images/hobbyclass/'+JSONData.purchaseList[i].hobbyClass.hobbyClassImage+'">'
																+'</div>'
																+'<div class="history-content-div-in-content">'
																+'<div class="history-content-div-in-content-title">'
																+JSONData.purchaseList[i].hobbyClass.hobbyClassName
																+'</div>'
																+'<div class="history-content-div-in-content-content">'
																+'15주 수강권'
																+'</div>'
																+'</div>'
																+'</div>'
																+'</div>';
																if( JSONData.purchaseList[i].purchaseState == '1' || 
																		JSONData.purchaseList[i].purchaseState == '2' ){
																	displayHtml +='<button data-test-id="payment-method-CARD" type="button" class="history-content-button" style="margin-bottom:16px;">';
																	displayHtml +='<div class="history-content-button-text">';
																	displayHtml +='앱에서 수강하기';
																	displayHtml +='</div>';
																	displayHtml +='</button>';
																}
												displayHtml +=	
																'</div>'
																+'<div class="history-content-blank-div"></div>';
																if( JSONData.purchaseList[i].componentOption == '1' ){
																	displayHtml +='<div class="history-content-section-top">';
																	displayHtml +='<div class="history-content-section-in">';
																	displayHtml +='<h4 class="history-content-kit-title-h4">';
																	if( JSONData.purchaseList[i].purchaseState == '1' ){
																		displayHtml +='상품이 배송 중입니다.';
																	}else if( JSONData.purchaseList[i].purchaseState == '2' ){
																		displayHtml +='<div class="history-content-title-h4">';
																		displayHtml +='배송 완료';
																		displayHtml +='</div>';
																	}
												displayHtml +=				
																	'</h4>'
																	+'</div>'
																	+'<div class="history-content-div-out">'
																	+'<div class="history-content-div-kit-image">'
																	+'<img class="history-content-div-kit-image" alt="" src="/images/hobbyclass/'+JSONData.purchaseList[i].hobbyClass.kitImage+'">'
																	+'</div>'
																	+'<div class="history-content-div-in-content">'
																	+'<div class="history-content-div-in-content-title">'
																	+JSONData.purchaseList[i].hobbyClass.kitName
																	+'</div>'
																	+'</div>'
																	+'</div>'
																	+'</div>';
																	if( JSONData.purchaseList[i].purchaseState == '1' ||
																			JSONData.purchaseList[i].purchaseState == '2' ){
																		displayHtml +='<button type="button" class="history-content-button">';
																		displayHtml +='<div class="history-content-button-text">';
																		displayHtml +='배송 조회';
																		displayHtml +='</div>';
																		displayHtml +='</button>';
																	}
																}
													displayHtml +=		
																'</section>'
																+'</div>';
																
											displayValue += displayHtml;
											
										}										
										$(".row").append(displayValue);
										currentPage ++;
	            					}//end of Call Back Function
	            				})//end of ajax
	            	
	            } 
            }
            
        });//end of scroll
	});//end of function
	//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////
	</script>
</body>
</html>