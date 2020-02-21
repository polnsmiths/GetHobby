<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>    
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- header CSS -->
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	<!-- header js -->
	<script src="/resources/javascript/commonHeader.js"></script>
<script type="text/javascript">
	
	
	//////////////////////주소찾기 //////////////////////////////
	function postcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }		                
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postCode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
	
	//////해쉬태그 5개 선택///////////
	var maxCheck = 5;
	var totalChecked = 0;
	
	function CountChecked(field){			
		
		if(field.checked){
			totalChecked += 1;
			if(totalChecked > maxCheck){
				Swal.fire({
					  icon: 'warning',
					  title: '5개 까지 선택 가능합니다',
					  showConfirmButton: false,
					  timer: 800
					})
				field.checked = false;
				totalChecked -= 1;
			}
		}else{
			totalChecked -= 1;
		
		}
	}
	
//////추가정보 전송//////////

	function fncUserSNSInfo(){
		var birth = $("input[name='birth']").val();
		var name = $("input[name='name']").val();
		
		if(name == "" || name == null || name.length <1){
			Swal.fire({
				  icon: 'warning',
				  title: '이름을 반드시 입력하세요',
				  showConfirmButton: false,
				  timer: 800
				}).then((result) => {
					$("#name").focus();
					return;	
				})		
		}else if(birth == null || birth.length <8 ){
			Swal.fire({
				  icon: 'warning',
				  title: '생년월일 8자리 반드시 입력하세요',
				  showConfirmButton: false,
				  timer: 800
				}).then((result) => {
					$("#birth").focus();
					return;	
				})
		}else{		 
		////////////해쉬태그 배열에 담기///////////////
		 var hash = [];
			$("input[type='checkbox']:checked").each(function(){
				
				hash.push($(this).val());	
								
			}); 
			
		$("#hashtag").val(hash);
		
		Swal.fire({
			  icon: 'success',
			  title: '회원 가입 완료',
			  showConfirmButton: false,
			  timer: 800
			}).then((result) => {
				$("form#pulsAddUserInfo").attr("method","POST").attr("action","/user/addUserSNSInfo").submit();
			})
		
		}
	}
	
	/////////////전송////////////////
	$(function(){
		$("#addsubmit").on("click",function(){
			fncUserSNSInfo();	
		});		
		
/////////////////validation check/////////////
		///////<h6> 숨기기///////////
		$(document).ready(function(){			
			$("h6").hide();
		}); 


		$("#name").on("blur",function(){
			
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noname").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noname").hide();
			}
			
		});

		$("#birth").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.8jabirth").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nobirth").show();
			}else if($(this).val().length < 8){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nobirth").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.8jabirth").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nobirth").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.8jabirth").hide();
			}			
		});	
		
		$("#phone").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nohyphen").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nophone").show();
			}else if($(this).val().indexOf('-') > 1){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nophone").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nohyphen").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nophone").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nohyphen").hide();
			}			
		});
		$("#nickName").on("blur",function(){
			
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nonickname").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nonickname").hide();
			}
			
		});
	});
	
/////////////////////////이미지 미리보기////////////////////
	function preview(input, target){
		if(input.files && input.files[0]){
			var fileName = input.files[0].name;
			var ext = fileName.substr(fileName.length-3,fileName.length);
			var isCheck=false;
			if(ext.toLowerCase() =='jpg' || ext.toLowerCase() =='gif'|| ext.toLowerCase() =='png' ){
				isCheck=true;
			}
			
			if(isCheck=false){
				Swal.fire({
					  icon: 'error',
					  title: '이미지 파일을 올려주세요',
					  showConfirmButton: false,
					  timer: 800
					}).then((result)=>{
						$("input[type='file']").val("");
						return;
					})
				
			
			}
			
			var reader = new FileReader();
			reader.readAsDataURL(input.files[0]);
			reader.onload = function(e){
				$(".RatioImage__Img-wwqqoo-1.gRslZu").attr('src', e.target.result);
			}
			
			
		}
	}
	
	
	
	
</script>
<style >
div {
    display: block;
}
*, ::before, ::after {
    box-sizing: border-box;
}
.dGxVjn {
    position: relative;
}
.hPYuYW {
    background-color: white;
    min-height: 1px;
    box-shadow: rgb(248, 248, 249) 0px -1px inset;
}
.hPYuYW {
    position: sticky;
    top: 0px;
    z-index: 3000;
    box-shadow: rgb(237, 239, 240) 0px -1px inset;
}
article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
    display: block;
}
.iexDaY {
    background-color: white;
    padding: 64px 0px 128px;
}
.inUTcFFF {
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
.inUTcFFF {
    margin-left: 24px;
    margin-right: 24px;
}
.QtLBlll {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: center;
    align-content: stretch;
    margin-right: -12px;
    margin-left: -12px;
}
.QtLBlll {
    margin-right: -4px;
    margin-left: -4px;
}
.bXUojH {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bXUojH {
    width: 100%;
    padding-right: 4px;
    padding-left: 4px;
}
.bXUojH {
    width: 35%;
}
h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h1 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 40px;
    font-size: 36px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.iexDaY h1 {
    font-size: 32px;
    line-height: 44px;
    letter-spacing: -0.6px;
    margin: 16px 0px 48px;
}
form {
    display: block;
    margin-top: 0em;
}
.gNPcmC {
    display: flex;
    flex-direction: column;
    margin: 0px 0px 16px;
}
.hGLglh {
    margin-bottom: 16px;
}
label {
    cursor: default;
}
label {
    display: inline-block;
}
.cvzQqA {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    margin: 0px 0px 4px;
}
.bdbgMM {
    display: block;
}
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.cNSGNe {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    background-color: white;
    height: 48px;
    width: 100%;
    color: rgb(62, 64, 66);
    box-sizing: border-box;
    margin: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(221, 224, 226);
    border-image: initial;
    flex: 1 1 auto;
    padding: 0px 16px;
    border-radius: 3px;
}
.cNSGNe.error {
    border-width: 1px;
    border-style: solid;
    border-color: rgb(255, 82, 82);
    border-image: initial;
}
h6 {
    display: block;
    font-size: 0.67em;
    margin-block-start: 2.33em;
    margin-block-end: 2.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h6 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 16px;
    font-size: 14px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.bNBuwd {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(255, 82, 82);
    margin: 2px 0px;
}
svg[Attributes Style] {
    width: 16;
    height: 16;
}
svg:not(:root) {
    overflow: hidden;
}
/* :not(svg) {
    transform-origin: 0px 0px;
} */

path[Attributes Style] {
    fill: rgb(62, 64, 66);
    fill-rule: evenodd;
    d: path("M 21.872 19.51 A 1 1 0 0 1 21 21 H 3 a 1 1 0 0 1 -0.872 -1.49 l 9 -16 a 1 1 0 0 1 1.744 0 l 9 16 Z M 13 15 V 9 h -2 v 6 h 2 Z m 0 3 v -2 h -2 v 2 h 2 Z");
}
.bNBuwd path {
    fill: rgb(255, 82, 82);
}
.bgbHMA {
    font-size: 11px;
    line-height: 16px;
    font-weight: normal;
    display: flex;
}
* + .bgbHMA {
    margin-left: 2px;
}
button {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: buttonface;
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}
button, input {
    overflow: visible;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.flMyeK {
    box-sizing: border-box;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex-direction: row;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
    outline: none;
    margin: 0px;
    padding: 0px;
    flex: initial;
}
.eYKibL {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(255, 255, 255);
    background-color: rgb(255, 146, 43);
    font-weight: 700;
    font-size: 16px;
    letter-spacing: -0.2px;
    height: 48px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 20px;
    transition: background-color 0.1s ease 0s;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
.kVAMqa {
    margin-top: 14px;
}
.eYKibL:hover, .eYKibL:active {
    background-color: rgb(247, 120, 0);
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.iexDaY button > span {
    vertical-align: middle;
}
button, input {
    overflow: visible;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}

.btEexr {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(62, 64, 66);
    background-color: rgb(248, 248, 249);
    font-weight: 700;
    font-size: 16px;
    letter-spacing: -0.2px;
    height: 48px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 20px;
    transition: background-color 0.1s ease 0s;
}
.dPbiof {
    margin-bottom: 16px;
    color: rgb(62, 64, 66);
    background-color: rgb(255, 232, 18) !important;
    border-radius: 2px;
    transition: filter 0.1s ease 0s;
}
.dPbiof:hover {
    filter: hue-rotate(-12deg) brightness(97%);
}
.jwdpRj {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 0px;
    width: 24px;
    height: 24px;
    margin-right: 4px;
    flex: 0 0 auto;
}
svg[Attributes Style] {
    width: 24;
    height: 24;
}
svg:not(:root) {
    overflow: hidden;
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.bRQEnB {
    margin-bottom: 16px;
    color: rgb(255, 255, 255);
    background-color: rgb(0, 199, 60) !important;
    border-radius: 2px;
    transition: filter 0.1s ease 0s;
}
.bRQEnB:hover {
    filter: hue-rotate(-12deg) brightness(97%);
}
img {
    vertical-align: middle;
    border-style: none;
}
.bRQEnB img {
    width: 24px;
    height: 24px;
    margin-right: 4px;
}
.aDress {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    background-color: white;
    height: 48px;
    width: 50%;
    color: rgb(62, 64, 66);
    box-sizing: border-box;
    margin: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(221, 224, 226);
    border-image: initial;
    flex: 1 1 auto;
    padding: 0px 16px;
    border-radius: 3px;
}
.form-control {
    display: block;
    width: 40%;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 0.8rem;
    font-weight: 400;
    text-align: left;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
input[type=checkbox], input[type=radio] {
    box-sizing: border-box;
    padding: 0;
    cursor: default;
}
.form-check-inline {
    display: -ms-inline-flexbox;
    display: inline-flex;
    -ms-flex-align: center;
    align-items: center;
    padding-left: 0;
    margin-right: .75rem;
    cursor: default;
}


.carousel-control-next-icon {
  height: 100px;
  width: 100px;
  outline: black;
  background-size: 100%, 100%;
  border-radius: 50%;
  background-image: none;
}
.carousel-control-prev-icon {
  height: 100px;
  width: 100px;
  outline: black;
  background-size: 100%, 100%;
  border-radius: 50%;
  background-image: none;
}

.carousel-control-next-icon:after
{
  content: '>';
  font-size: 50px;
  color: black;
}

.carousel-control-prev-icon:after {
  content: '<';
  font-size: 50px;
  color: black;
}


/* /* /* /* /* /* 이미지 미리보기 */ 

.cRNLYZ {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    margin: 24px 0px;
}
.logKjs {
    display: inline-block;
    cursor: pointer;
}
.jLGbZG {
    position: relative;
    width: 88px;
    height: 88px;
}
.kgaAUr {
    position: relative;
    width: 110px;
    height: 110px;
    background-color: rgb(255, 255, 255);
    border-radius: 50%;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(237, 239, 240);
    border-image: initial;
}
.eAfAEc {
    display: block;
    position: relative;
    font-size: 0px;
    overflow: hidden;
}
.bKTweb {
    width: 100%;
    height: 100%;
    line-height: 0;
    border-radius: 50%;
}
.gRslZu {
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: relative;
    opacity: 1;
    transition: opacity 0.1s linear 0s;
}
img {
    vertical-align: middle;
    border-style: none;
}
.eYYvSv {
    position: absolute;
    right: 0px;
    bottom: 0px;
    width: 28px;
    height: 28px;
    background-color: rgb(27, 28, 29);
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 4px;
    border-radius: 14px;
}
path[Attributes Style] {
    fill: rgb(255, 255, 255);
    fill-rule: evenodd;
    d: path("M 4 21 a 1 1 0 0 1 -1 -1 v -4 a 1 1 0 0 1 0.293 -0.707 l 11 -11 a 3.828 3.828 0 0 1 5.414 5.414 l -11 11 A 1 1 0 0 1 8 21 H 4 Z m 1 -2 h 2.586 l 0.707 -0.707 l -2.586 -2.586 l -0.707 0.707 V 19 Z");
}
.logKjs input[type="file"] {
    display: none;
}

</style>
</head>
<body>
 <jsp:include page="/common/header.jsp"/>
<div id="root">
	<div id="wrapper">
		<div class="pages__Body-sc-1xw23vo-0 dGxVjn">
		<div class="MainHeader__CategoryNavigationWrapper-sc-4sw7cl-1 hPYuYW">
		</div>
			<main class="pages__Main-sc-1xw23vo-1 gulakV">
				<div class="RegisterPage__Container-sc-1vwt6wy-0 iexDaY">
					<div class="sc-eerKOB inUTcFFF">
						<div class="sc-eilVRo QtLBlll">
							<div class="sc-gHboQg bXUojH" style="margin-top: 60px;">
								<h1>필수 추가정보</h1>
								<form id="pulsAddUserInfo" enctype="multipart/form-data">
									 <input type="hidden" id="userId" name="userId" value='${sessionScope.user.userId}'>
									  <input type="hidden" id="password" name="password" value='${sessionScope.user.password}'>
									  <div class="Profile__EditProfileImageWrapper-sc-1sl3brv-1 cRNLYZ">
										  <label class="S3UploadButton__Container-a68j44-0 logKjs">								
											  <input type="file" id="file" name="file" onchange="preview(this,$('#image_section'));">
											  <div size="88" class="ProfileImageUploadHandler__Container-sc-1advxtt-0 jLGbZG">
												  <div size="88" class="ProfileImage__Container-sc-1h9kedz-0 kgaAUr">
													  <span class="RatioImage__Container-wwqqoo-0 eAfAEc ProfileImage__UserProfileImage-sc-1h9kedz-1 bKTweb">
													 	 <img  src="" alt="" class="RatioImage__Img-wwqqoo-1 gRslZu" id="image_section">
													  </span>
												  </div>
												  <div class="ProfileImageUploadHandler__EditIconWrapper-sc-1advxtt-1 eYYvSv" style="top: 80px;left: 80px;">
													  <svg width="24" height="24" viewBox="0 0 24 24">
														  <path fill="#FFF" fill-rule="evenodd" d="M4 21a1 1 0 01-1-1v-4a1 1 0 01.293-.707l11-11a3.828 3.828 0 015.414 5.414l-11 11A1 1 0 018 21H4zm1-2h2.586l.707-.707-2.586-2.586-.707.707V19z">
														  </path>
													  </svg>
												  </div>
											  </div>
										  </label>
									  </div>   
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">이름
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe" type="text" name="name" id="name" placeholder="홍길동" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd noname"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">이름을 입력해주세요</span>
												</h6>
											</div>
									</div>
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">생년월일 (8자리)
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="birth" id="birth" placeholder="생년월일" autocomplete="off" value="" maxlength="8">
												<h6  class="sc-bwCtUz bNBuwd nobirth"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">생년월일을 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd 8jabirth"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">8자로 입력해 주세요</span>
												</h6>
											</div>
									</div>									
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">휴대전화 번호
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="phone" id="phone" placeholder="-를 제외한 휴대폰 번호를 입력해주세요" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd nophone"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">번호를 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd nohyphen"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">-를 제외 입력해주세요</span>
												</h6>
											</div>
									</div>									
									
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">닉네임
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="nickName" id="nickName" placeholder="홍길동" autocomplete="off" value="">
											<h6  class="sc-bwCtUz bNBuwd nonickname"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">닉네임을 입력해주세요</span>
												</h6>
											</div>
									</div>									
									<div class="form-gorup">
										<label class="sc-esjQYD cvzQqA"> 성 별 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  			<input class="form-check-input" type="radio" name="sex" id="male" value='M' checked>
							  			<label class="form-check-label" for="male"> 남 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  			<input class="form-check-input" type="radio" name="sex" id="female" value='F'>
							  			<label class="form-check-label" for="female"> 여</label>
									</div>
								<div id="carouselExampleControls" class="carousel slide" data-interval="false" >
								<label class="sc-esjQYD cvzQqA"> 관심사 선택(최대5개)</label><br>
									  <div class="carousel-inner cvzQqA">
									  <input type="hidden" id="hashtag" name="hashtag" />
									    <div class="carousel-item active" style="text-align:center;">									    
									    <input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H00" >플라워/꽂꽂이
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="H01">뜨개질/위빙
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H02">가구/목공예
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H03">가죽공예<br>
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H04">천연비누/화장품
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H05">디퓨저/향수
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H06">캔들/석고공예<br>
							  			<input onclick="CountChecked(this)" class="aks checkSelect" type="checkbox"  value="H07">도자공예
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="H08">금속/악세사리공예
								  		<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="H09">바느질/재봉틀
								    </div>
								    <div class="carousel-item" style="text-align:center;">
								      <input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C00" >한식
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="C01">양식
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C02">중식
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C03">일식
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C04">분식<br>
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C05">베이킹
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C06">커피
							  			<input onclick="CountChecked(this)" class="aks checkSelect" type="checkbox"  value="C07">와인
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="C08">칵테일
								  		<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="C09">디저트
								    </div>
								    <div class="carousel-item" style="text-align:center;">
								      	<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A00" >디지털 드로잉
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="A01">아동미술
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A02">미술 회화
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A03">소묘/드로잉<br>
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A04">만화/웹툰
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A05">애니
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A06">동양화
							  			<input onclick="CountChecked(this)" class="aks checkSelect" type="checkbox"  value="A07">팝아트
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="A08">조소
								  		<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="A09">캘리그라피
									    </div>
									<div class="carousel-item" style="text-align:center;">
								      	<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M00" >보컬
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="M01">랩
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M02">디제잉
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M03">미디/컴퓨터작곡
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M04">시창청음/화성학<br>
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M05">피아노/키보드
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M06">기타
							  			<input onclick="CountChecked(this)" class="aks checkSelect" type="checkbox"  value="M07">베이스기타
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="M08">드럼
								  		<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="M09">바이올린
									 </div>
									 <div class="carousel-item" style="text-align:center;">
								      	<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E00" >PT
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="E01">크로스핏
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E02">필라테스
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E03">요가
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E04">스키<br>
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E05">태권도
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E06">복싱
							  			<input onclick="CountChecked(this)" class="aks checkSelect" type="checkbox"  value="E07">체조
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="E08">파쿠르
								  		<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="E09">스케이트보드
									    </div>
									<div class="carousel-item" style="text-align:center;">
								      	<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L00">컴퓨터활용
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="L01">외국어
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L02">수학
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L03">과학
							 			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L04">국어<br>
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L05">사회
							  			<input  onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L06">논술
							  			<input onclick="CountChecked(this)" class="aks checkSelect" type="checkbox"  value="L07">연기
							  			<input onclick="CountChecked(this)" class="checkSelect" type="checkbox"  value="L08">뮤지컬
								  		<input onclick="CountChecked(this)" class="checkSelect" type="checkbox" value="L09">마술
									 </div>
									</div>
											  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" >
											    <span  class="carousel-control-prev-icon" style="height:60px;"></span>
										    <span  class="sr-only">Previous</span>
										  </a>
										  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" >
										    <span class="carousel-control-next-icon" style="height:60px;" ></span>
										    <span class="sr-only">Next</span>
										  </a>
										</div>
								
									 <div class="form-group">
									   	 <label for="ssn" class="cvzQqA">주소</label>
									   	 								   
										    <div >
										      <input type="text" class="aDress" id="postCode" name="postCode" style="float:left" placeholder="우편번호">
											    <button type="button" class="flMyeK eYKibL kVAMqa" onclick="postcode()" style="width:50%;float:right;margin-top:0px;" color="orange" >
											    <span class="">우편번호 찾기</span>
											    </button>
										    										      	      
										      <input type="text" class="cNSGNe" id="address" name="address" placeholder="주소" ><br>
										      <input type="text" class="cNSGNe" id="detailAddress" name="detailAddress" placeholder="상세주소" >
										     </div>										      
										    
									     		    
									  </div>
																
									<button type="button" class="sc-jTzLTM flMyeK sc-kEYyzF eYKibL RegisterPage__SignUpButton-sc-1vwt6wy-3 kVAMqa" id="addsubmit" color="orange" fill="true">
										<span class="sc-fjdhpX kCztpU">저 장</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</div>



 <jsp:include page="/common/footer.jsp"></jsp:include>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>