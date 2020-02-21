<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>Insert title here</title>
	<!-- 웹사이트 파비콘 -->
    <link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
    <link rel="icon" href="/resources/image/logo/logo-favicon.png">
    
    <!-- favicon 404 에러 안보이게  -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- 웹 폰트 (나눔고딕) -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">


    <!--부트스트랩 CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />



    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">

    <!-- 메인 메뉴 CSS -->
    <link rel="stylesheet" href="/resources/css/header.css">
    <!-- 메인 메뉴 js -->
    <script src="/resources/javascript/header.js"></script>
    
    <!-- highchart CDN -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
    
	<script type="text/javascript">
		var startDate = []; 
		
		$(function(){
			// 바로 collapse를 표시하기 위해 document.ready시 ajax로 날짜 가져옴 -----------------------
			$.ajax(
					{
						url : "/myHobbyClass/json/getHobbyClassBuyerDateStats",
						method : "post", 
						dataType : "json", 
						async : false,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : $('.hidden-class-number').val() 
						}), 
						success : function(JSONData, status) {
							
							for(var i = 0; i < JSONData.calendarNameList.length; i++) {
								// 날짜 비교를 위해 현재시간 가져옴 
								var today = new Date();
								var nowMonth = today.getMonth() + 1;
								var nowYear = today.getFullYear();
								
								// 전체 통계를 위한 배열 push 
								startDate.push(JSONData.calendarList[i]);
								
								// JSON으로 가져온 날짜 년/월/일로 parsing  
								var dataSplit = JSONData.calendarList[i].split('-');
								
								$("button[name='selectDateButton']").attr('class', 'btn btn-outline-secondary btn-sm');
								
								
								if ( nowYear < dataSplit[0] ) {		// 현재 년도가 데이터 년도보다 작다면 
									$("button[name='selectDateButton']").eq(i + 1).attr('disabled', true);
								}
								else if ( nowYear >= dataSplit[0] && nowMonth < dataSplit[1] ) {	// 현재 년도가 데이터 년도보다 크거나 같지만 현재 달이 데이터 달보다 작다면 
									$("button[name='selectDateButton']").eq(i + 1).attr('disabled', true);
								}
								else { // 그외에는 버튼 동작 
									$("button[name='selectDateButton']").attr('disabled', false);
								}
								
								// 전체 버튼을 제외한 나머지 버튼에 데이터 setting 
								console.log(JSONData.calendarNameList[i]);
								$("button[name='selectDateButton']").eq(i + 1).text(JSONData.calendarNameList[i]);
								$("button[name='selectDateButton']").eq(i + 1).val(JSONData.calendarList[i]);
								
							}
						}
					}
			);
			// 바로 collapse를 표시하기 위해 document.ready시 ajax로 날짜 가져옴 -----------------------
			
			// 그냥 날짜 버튼 바로 보여줌 
			$('#selectDateCollapse').collapse('show');
			
			// 날짜 버튼 클릭시 -------------------------------------------------
			$('button[name="selectDateButton"]').on('click', function(){
				// 버튼 this로 가져옴 
				var selectDateButton = $(this);
				
				var url = '';
				
				$('input[name="targetValue"]').val(selectDateButton.val());
				
				// 전체 버튼이 아닐 때 
				if ( selectDateButton.val() != 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAgeStats';
				}
				// 전체 버튼일 때 
				if ( selectDateButton.val() == 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAllAgeStats';
				}
				console.log('now url ? : ' + url);
				$.ajax(
						{
							url : url, 
							method : "post", 
							dataType : "json", 
							headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							}, 
							data : JSON.stringify({
								// hobbyClassNo 그냥 10000이라고 침 
								hobbyClassNo : $('.hidden-class-number').val(),  
								dateTarget : selectDateButton.val() 
							}), 
							success : function(JSONData, status) {
								if ( JSONData.checkValue != 0 ) {
									console.log(JSONData);
									$('#chart_div').highcharts({
										colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 연령대 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '10대',
									       			y : JSONData.one
									       		}, 
									       		{
									       			name : '20대',
									       			y : JSONData.two
									       		},
									       		{
									       			name : '30대',
									       			y : JSONData.three
									       		},
									       		{
									       			name : '40대',
									       			y : JSONData.four
									       		},
									       		{
									       			name : '50대 이상',
									       			y : JSONData.overFive 
									       		}
									        ]
									    }]
									});
								}
								else {
									console.log('데이터가 읎읍니다');
									/*
									$('#chart_div').remove();
									$('span[name="buttonSpan"]').html('');
									$('.pie-chart-div').prepend('<div id="chart_div"><span class="no-purchase-data-span">구매 내력이 없습니다.</span></div>');
									*/
									$('#chart_div').highcharts({
										colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 연령대 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '10대',
									       			y : 0
									       		}, 
									       		{
									       			name : '20대',
									       			y : 0
									       		},
									       		{
									       			name : '30대',
									       			y : 0
									       		},
									       		{
									       			name : '40대',
									       			y : 0
									       		},
									       		{
									       			name : '50대 이상',
									       			y : 0
									       		}
									        ]
									    }]
									});
								}
								var display = "<button type='button' class='btn btn-outline-secondary btn-sm' name='ageButton' disabled>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm' name='maleButton'>성별</button>";
								$('span[name="buttonSpan"]').html(display);
								
								$('#buyerStateCollapse').collapse('show');
							}
						}
				)
				
				
			});
			// 날짜 버튼 클릭시 -------------------------------------------------
			
			// 성별 버튼 클릭 시 ------------------------------------------------------
			$(document).on('click', 'button[name="maleButton"]', function(){
				
				var selectDateButtonValue = $('input[name="targetValue"]').val();
				
				var url = '';
				
				// 전체 버튼이 아닐 때 
				if ( selectDateButtonValue != 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAgeStats';
				}
				
				// 전체 버튼일 때 
				if ( selectDateButtonValue == 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAllAgeStats';	
				}
				
				$.ajax(
						{
							url : url, 
							method : "post", 
							dataType : "json", 
							headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							}, 
							data : JSON.stringify({
								// hobbyClassNo 그냥 10000이라고 침 
								hobbyClassNo : $('.hidden-class-number').val(), 
								dateTarget : selectDateButtonValue 
							}), 
							success : function(JSONData, status) {
								if ( JSONData.checkValue != 0 ) {
									console.log(JSONData);
									$('#chart_div').highcharts({
										colors: ['#18A6E3', '#E01A1A'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 성별 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '남성',
									       			y : JSONData.male
									       		}, 
									       		{
									       			name : '여성',
									       			y : JSONData.female
									       		}
									        ]
									    }]
									});
									
									
								}
								else {
									$('#chart_div').highcharts({
										colors: ['#18A6E3', '#E01A1A'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 성별 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '남성',
									       			y : 0
									       		}, 
									       		{
									       			name : '여성',
									       			y : 0
									       		}
									        ]
									    }]
									});
								}
								var display = "<button type='button' class='btn btn-outline-secondary btn-sm' name='ageButton'>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm' name='maleButton' disabled>성별</button>";
								$('span[name="buttonSpan"]').html(display);
								
								$('#buyerStateCollapse').collapse('show');
							}
						}
				)
			})
			// 성별 버튼 클릭 시 ------------------------------------------------------
			
			// 연령대 버튼 클릭 시 ------------------------------------------------------
			$(document).on('click', 'button[name="ageButton"]', function(){
				
				var selectDateButtonValue = $('input[name="targetValue"]').val();
				
				var url = '';
				
				// 전체 버튼이 아닐 때 
				if ( selectDateButtonValue != 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAgeStats';
				}
				
				// 전체 버튼일 때 
				if ( selectDateButtonValue == 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAllAgeStats';	
				}
				$.ajax(
						{
							url : url, 
							method : "post", 
							dataType : "json", 
							headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							}, 
							data : JSON.stringify({
								// hobbyClassNo 그냥 10000이라고 침 
								hobbyClassNo : $('.hidden-class-number').val(),  
								dateTarget : selectDateButtonValue 
							}), 
							success : function(JSONData, status) {
								if ( JSONData.checkValue != 0 ) {
									console.log(JSONData);
									$('#chart_div').highcharts({
										colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 연령대 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									        	{ 
									       			name : '10대',
									       			y : JSONData.one
									       		}, 
									       		{
									       			name : '20대',
									       			y : JSONData.two
									       		},
									       		{
									       			name : '30대',
									       			y : JSONData.three
									       		},
									       		{
									       			name : '40대',
									       			y : JSONData.four
									       		},
									       		{
									       			name : '50대 이상',
									       			y : JSONData.overFive 
									       		}
									        ]
									    }]
									});
								}
								var display = "<button type='button' class='btn btn-outline-secondary btn-sm' name='ageButton' disabled>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm' name='maleButton'>성별</button>";
								$('span[name="buttonSpan"]').html(display);
								
								$('#buyerStateCollapse').collapse('show');
								
							}
						}
				)
			})
			// 연령대 버튼 클릭 시 ------------------------------------------------------
			
			// 전체 연령대 통계 ajax ---------------------------------------------------
			console.log("-------------bstartDate ? : " + startDate);
			
			for(var i = 0; i < startDate.length; i++) {
				var newData = startDate[i].split('-')[0] + ' 년 ' + startDate[i].split('-')[1] + ' 월';
				console.log('newData ? : ' + newData);
				startDate.splice(i, 1, newData);
			}
			console.log("-------------astartDate ? : " + startDate);
			$.ajax(
					{
						url : "/myHobbyClass/json/getHobbyClassBuyerStats",
						method : "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : $('.hidden-class-number').val() 
						}),
						success : function(JSONData, status) {
							
							var oneData = []; 
							var twoData = [];
							var threeData = [];
							var fourData = [];
							var overFiveData = [];
							var maleData = [];
							var femaleData = [];
							var totalData = [];
							console.log('-------------total length ? : ' + JSONData.statsList.length);
							for (var i = 0; i < JSONData.statsList.length; i++) {
								oneData.push(JSONData.statsList[i].data.one);
								twoData.push(JSONData.statsList[i].data.two);
								threeData.push(JSONData.statsList[i].data.three);
								fourData.push(JSONData.statsList[i].data.four);
								overFiveData.push(JSONData.statsList[i].data.overFive);
								maleData.push(JSONData.statsList[i].data.male);
								femaleData.push(JSONData.statsList[i].data.female);
								totalData.push(JSONData.statsList[i].data.total);
							}
						
							console.log(oneData);
							$('#total_chart_div').highcharts({
								chart: {
							        type: 'line'
							    },
							    title: {
							        text: '수강생 전체 통계'
							    },
							    subtitle: {
							        text: '성별 / 연령대'
							    },
							    xAxis: {
							    	categories : startDate 
							    },
							    yAxis: {
							        title: {
							            text: '인원 (명)'
							        }
							    },
							    plotOptions: {
							        line: {
							            enableMouseTracking: true 
							        },
							    	series : {
							    		dataLabels: {
							                enabled: false
							            }
							    	},
							        label: {
							            enabled: false,
							        }
							    },
							    series : [
							    	{
							       		name: '10대',
							       		color : '#8000FF',
							        	data: oneData, 
							        	label: {
								            enabled: false,
								        }
							    	}, 
							    	{
							        	name: '20대',
							        	color : '#0489B1',
							        	data: twoData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '30대',
							        	color : '#298A08',
							        	data: threeData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '40대',
							        	color : '#886A08',
							        	data: fourData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '50대 이상',
							        	color : '#FE9A2E',
							        	data: overFiveData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '남성',
							        	color : '#013ADF',
							        	data: maleData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '여성',
							        	color : '#FF0000', 
							        	data: femaleData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '전체',
							        	color: '#000000', 
							        	data: totalData,
							        	label: {
								            enabled: false,
								        }
							    	}
							    ]
							});

						}
					}
			)
			// 전체 연령대 통계 ajax ---------------------------------------------------
			
			
			// 삭제시도
			$('.highcharts-color-none').find('text').text('');
			console.log( $('.highcharts-color-none').find('text') );
		})
	</script>
	
	<script type="text/javascript">
		$(function(){
			$.ajax(
					{
						url : "/myHobbyClass/json/getHobbyClassBuyerAllAgeStats", 
						method : "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : $('.hidden-class-number').val(),  
							dateTarget : "all" 
						}), 
						success : function(JSONData, status) {
							if ( JSONData.checkValue != 0 ) {
								console.log(JSONData);
								$('#chart_div').highcharts({
									colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
									chart: {
								        plotBackgroundColor: null,
								        plotBorderWidth: null,
								        plotShadow: false,
								        type: 'pie'
								    },
								    title: {
								        text: '수강생 연령대 통계'
								    },
								    tooltip: {
								        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
								    },
								    plotOptions: {
								        pie: {
								            allowPointSelect: true,
								            cursor: 'pointer',
								            dataLabels: {
								                enabled: false
								            },
								            showInLegend: true
								        }
								    },
								    series: [{
								        name: '연령대',
								        colorByPoint: true,
								        data: [
								        	{ 
								       			name : '10대',
								       			y : JSONData.one
								       		}, 
								       		{
								       			name : '20대',
								       			y : JSONData.two
								       		},
								       		{
								       			name : '30대',
								       			y : JSONData.three
								       		},
								       		{
								       			name : '40대',
								       			y : JSONData.four
								       		},
								       		{
								       			name : '50대 이상',
								       			y : JSONData.overFive 
								       		}
								        ]
								    }]
								});
							}
							var display = "<button type='button' class='btn btn-outline-secondary btn-sm' name='ageButton' disabled>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm' name='maleButton'>성별</button>";
							$('span[name="buttonSpan"]').html(display);
							
							$('#buyerStateCollapse').collapse('show');
							
						}
					}
			)
		})
	</script>
	
	<style>
		.card-chart-body {
			position: relative;
			display: flex;
			flex-direction: column;
			min-width: 0;
			word-wrap: break-word;
			background-color: #FFF;
			border: 0px solid rgba(0,0,0,.125); /*EDIT this part*/
			border-radius: 0.25rem;
		}
		
		.total-chart-contaier {
			margin-top : 50px;
		}
	</style>
 </head>
 <body>
 	<input type="hidden" class="hidden-class-number" value="10025" />
	<br/><br/><br/><br/><br/>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<button class="btn btn-secondary btn-lg btn-block" name="selectDate" type="button" data-toggle="collapse" data-target="#selectDateCollapse" aria-expanded="false" aria-controls="#selectDateCollapse">날짜선택</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<div class="collapse" id="selectDateCollapse">
					<div class="card card-body">
						<button type="button" class="btn btn-outline-secondary btn-sm" name="selectDateButton" value="all">전체</button>
			    		<br/>
			    		<button type="button" class="btn btn-outline-secondary btn-sm" name="selectDateButton"></button>
			    		<br/>
			    		<button type="button" class="btn btn-outline-secondary btn-sm" name="selectDateButton"></button>
			    		<br/>
			    		<button type="button" class="btn btn-outline-secondary btn-sm" name="selectDateButton"></button>
			    		<br/>
			    		<button type="button" class="btn btn-outline-secondary btn-sm" name="selectDateButton"></button>
			    		<br/>
					</div>
				</div>
			</div>
			<div class="col-lg-1">
				
			</div>
			<div class="col-lg-8">
				<div class="collapse" id="buyerStateCollapse">
					<div class="card card-body card-chart-body margin-0 pie-chart-div">
						<div id="chart_div"></div>
						<span name="buttonSpan"></span>
						<input type="hidden" name="targetValue" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container total-chart-contaier">
		<div class="row">
			<div class="col-lg">
				<div id="total_chart_div">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
