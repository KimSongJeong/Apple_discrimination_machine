<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>ABC solution</title>
		<link rel="stylesheet" href="<c:url value="/resources/vendors/mdi/css/materialdesignicons.min.css" />" >
		<link rel="stylesheet" href="<c:url value="/resources/vendors/owl.carousel/css/owl.carousel.css" />" >
		<link rel="stylesheet" href="<c:url value="/resources/vendors/owl.carousel/css/owl.theme.default.min.css" />" >
		<link rel="stylesheet" href="<c:url value="/resources/vendors/aos/css/aos.css" />" >
		<link rel="stylesheet" href="<c:url value="/resources/vendors/jquery-flipster/css/jquery.flipster.css" />" >
		<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" >
		<link rel="shortcut icon" href="<c:url value="/resources/images/logo_icon.png" />"  />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
		<div id="mobile-menu-overlay"></div>
		<nav class="navbar navbar-expand-lg fixed-top">
			<div class="container">
				<a class="navbar-brand" href="mainIndex.do"><img src="<c:url value="/resources/images/white_logo.png" />" alt="ABCsolution"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"><i class="mdi mdi-menu"> </i></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
					<div class="d-lg-none d-flex justify-content-between px-4 py-3 align-items-center">
						<img src="<c:url value="/resources/images/mobile_logo.png"/>"  class="logo-mobile-menu" alt="ABCsolution">
						<a href="<c:url value="javascript:;"/>" class="close-menu"><i class="mdi mdi-close"></i></a>
					</div>
					<ul class="navbar-nav ml-auto align-items-center">
						<li class="nav-item active">
							<a class="nav-link" href="<c:url value="#home"/>">Home<span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="#services"/>">제품 및 솔루션</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="#contact"/>">고객지원</a>
						</li>
						<li class="nav-item">
							<a class="nav-link btn btn-success" href="login.do">로그아웃</a>
							<!-- controller에 추가해서 만들어야함 -->
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- 로그인 하면 뜨는 보조메뉴 뜨게 만들어야 함 -->
		<nav class="navbar navbar-expand-lg fixed-second">
			<div class="container nav-second">
				<ul class="navbar-nav ml-auto align-items-center">
					<li class="nav-item">
						<a class="nav-link" href="summary.do?mb_id=${info.mb_id}" >AI 학습모델 현황</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="myDevices.do?mb_id=${info.mb_id}">나의 선별기 관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="streaming.do?mb_id=${info.mb_id}">실시간 판별영상</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="data.do?mb_id=${info.mb_id}" style="color: #ffd900;">나의 데이터관리</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="page-body-wrapper">
			<section id="empty" class="empty">
				<div class="empty"></div>
			</section>
			<section class="testimonial" id="testimonial">
				<div class="container big-area">
					<div class="row  mt-md-0 mt-lg-4">
						<div class="col-sm-12" data-aos="fade-up">
							<div id="testimonial-flipster">
                                <h3 style="display: block;">내 작물/데이터 관리</h3>
                                <a href="mychart.do?mb_id=${info.mb_id}"><span class="btn btn-success btn-sm">데이터 내역 살펴보기</span></a>
								<div class="formArea" style="display: block;">
                                    
                                    <div class="boxes-area">
                                    
                                    <c:forEach var="svo" items="${applelistSummary}">
                                        <div class="box-crop01">
                                            <p>사과-${svo.fruit_kind}<input type="checkbox" name="crop01" id="crop01" class="checkedCrop"></p>
                                            <p>최근 선별일 | ${svo.cl_date}</p>
                                            <!-- 최근 선별일자 받아오기 -->
                                            <p>불량률 : 23%</p>
                                            <!-- (전체 데이터-양품)/전체 데이터*100 입력하기 -->
                                        </div>
                                    </c:forEach>
                                        <div class="box-crop02">
                                            <p>사과-황금사과<input type="checkbox" name="crop02" id="crop02" class="checkedCrop"></p>
                                            <p>최근 선별일 | 2021.11.05</p>
                                            <p>불량률 : 27%</p>
                                        </div>
                                    </div><!-- 전체 박스 영역 -->
                                </div><!-- formArea -->
							</div><!-- testo... -->
							<div class="chart-area">
                                        <div class="chart-date">
                                        	<div class="nowDate"><h5><%= sf.format(nowTime) %></h5></div>
                                        </div>
										<div class="container nav-second">
											<ul class="nav nav-tabs nav-third">
												<li class="nav-item"><a class="nav-link active nav-a-tag" data-toggle="tab" href="#chart01">품종별 실시간 불량률</a></li>
												<li class="nav-item"><a class="nav-link nav-a-tag" data-toggle="tab" href="#chart02">기간설정 분류 결과</a></li>
												<li class="nav-item"><a class="nav-link nav-a-tag" data-toggle="tab" href="#chart03">품종별 양품/불량품 비율 비교</a></li>
											</ul>
											<div class="date-area">
												<form action="data.do">
			                                        <label for="inputDate" class="btn btn-outline-primary btn-sm">날짜 선택하기</label>
			                                        <input type="text" id="inputDate" name="cropdate" class="cropdate" value="날짜 선택하기" style="color: white;">
			                                        <input type="hidden" name="mb_id" value="${info.mb_id}">
													<!-- <input type="hidden" class="dateTextStart" name="startDay">
													<input type="hidden" class="dateTextEnd" name="endDay">-->
													<br/>
													<input type="submit" class="btn btn-outline-primary btn-sm" value="차트 업데이트">
												</form>
											</div><!-- 날짜 공간 끄읕 -->
											<div class="tab-content">
													<div class="col-sm-12 tab-pane fade show active" id="chart01" style="width: 80%; margin-left: 10%;"><canvas class="" id="chartDevice"></canvas></div>
													<div class="col-sm-12 tab-pane fade" id="chart02" style="width: 60%; margin-left: 20%;"><canvas class="" id="chartDayby01"></canvas></div>
													<div class="col-sm-12 tab-pane fade" id="chart03" style="width: 80%; margin-left: 10%;"><canvas class="" id="chartDaybyList"></canvas></div>
											</div><!-- tab-content -->
										</div>
								
                           </div><!-- chart영역 끄읕 -->
						</div><!-- col-sm12 -->
					</div><!-- row -->
				</div><!-- big-area -->
			</section>
			<section>
				<div class="willHidden">
									<table class="hiddenDataTable">
										<!-- 품종별 어제대비 오늘 결과별 개수 -->
										<tr>
											<td colspan="4">품종별</td>
										</tr>
										<tr>
											<td>품종</td>
											<td>분류결과</td>
											<td>cnt</td>
										</tr>
										<c:forEach var="cvo" items="${applelistJy}">
											<tr>
												<td>${cvo.fruit_kind}</td>
												<td>${cvo.cl_result}</td>
												<td class="KindTd">${cvo.cnt}</td>
											</tr>
										</c:forEach>
									</table>
									<!-- 품종별 테이블 영역 끝 -->
									<table class="">
										<tr>
											<td colspan="4">기기별</td>
										</tr>
										<tr>
											<td>선별기 종류</td>
											<td>품종</td>
											<td>분류결과</td>
											<td>cnt</td>
										</tr>
										<c:forEach var="cvo" items="${applelistMachine}">
											<tr>
												<td>${cvo.m_id}</td>
												<td>${cvo.fruit_kind}</td>
												<td >${cvo.cl_result}</td>
												<td class="ItsYou">${cvo.cnt}</td>
											</tr>
										</c:forEach>
									</table>
									<table class="hiddenDataTable">
										<tr>
											<td colspan="4">기간 선택해서 하게씀</td>
										</tr>
										<tr>
											<td>분류결과</td>
											<td>cnt</td>
										</tr>
										<c:forEach var="dvo" items="${daterange}">
											<tr>
												<td>${dvo.cl_result}</td>
												<td class="dayday">${dvo.cnt}</td>
											</tr>
										</c:forEach>
									</table>
		
									<table class="hiddenDataTable">
										<tr>
											<td colspan="4">최근 선별</td>
										</tr>
										<tr>
											<td>선별기 종류</td>
											<td>품종</td>
											<td>분류결과</td>
										</tr>
										<c:forEach var="cvo" items="${applelistSummary}">
											<tr>
												<td>${cvo.m_id}</td>
												<td>${cvo.fruit_kind}</td>
												<td>${cvo.cl_date}</td>
											</tr>
										</c:forEach>
									</table>
									<table class="hiddenDataTable">
										<tr>
											<td colspan="4">한시간마다 업데이트한 불량률</td>
											<td colspan="4" class="listlength">${fn:length(livedata)}</td>
										</tr>
										<tr>
											<td>품종</td>
											<td>시간</td>
											<td>분류결과</td>
											<td>개수</td>
										</tr>
										<c:forEach var="live" items="${livedata}">
											<tr>
												<td class="liveKind">${live.kind}</td>
												<td class="liveTime">${live.times}</td>
												<td>${live.result}</td>
												<td class="ratio">${live.rat}</td>
											</tr>
										</c:forEach>
									</table>
									
								</div><!-- table영역 끄읕 -->
			</section>
		</div>
		<footer class="footer">
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<address>
								<p>광주광역시 남구 송암로 60</p>
								<p class="mb-4">스마트인재개발원</p>
								<div class="d-flex align-items-center">
									<p class="mr-4 mb-0">010-1234-5678</p>
									<a href="#" class="footer-link">stardewvillage@mymail.com</a>
								</div>
							</address>
							<div class="social-icons">
								<h6 class="footer-title font-weight-bold">
									Social Share
								</h6>
								<div class="d-flex">
									<a href="#"><i class="mdi mdi-github-circle"></i></a>
									<a href="#"><i class="mdi mdi-facebook-box"></i></a>
									<a href="#"><i class="mdi mdi-twitter"></i></a>
									<a href="#"><i class="mdi mdi-dribbble"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<div class="d-flex justify-content-between align-items-center">
						<div class="d-flex align-items-center">
							<img src="<c:url value="/resources/images/white_logo.png"/>" alt="logo" class="mr-3"></br>
							<p class="mb-0 text-small pt-1">© 2019-2020 <a href="https://www.bootstrapdash.com" class="text-white" target="_blank">BootstrapDash</a>. All rights reserved.</p>
            
							<p class="mb-0 text-small pt-1 pl-4">Distributed By: <a href="https://www.themewagon.com" class="text-white" target="_blank">Themewagon</a></p>
						</div>
           
						<div>
							<div class="d-flex">
								<a href="#" class="text-small text-white mx-2 footer-link">Privacy Policy </a>          
								<a href="#" class="text-small text-white mx-2 footer-link">Customer Support </a>
								<a href="#" class="text-small text-white mx-2 footer-link">Careers Guide</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</footer>
		<script src="<c:url value="/resources/vendors/base/vendor.bundle.base.js" />" ></script>
		<script src="<c:url value="/resources/vendors/owl.carousel/js/owl.carousel.js" />" ></script>
		<script src="<c:url value="/resources/vendors/aos/js/aos.js" />" ></script>
		<script src="<c:url value="/resources/vendors/jquery-flipster/js/jquery.flipster.min.js" />" ></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
		<script src="<c:url value="/resources/js/template.js" />" ></script>
		<script src="<c:url value="/resources/js/manychart.js" />" ></script>
</body>
</html>