<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<a class="nav-link" href="myDevices.do?mb_id=${info.mb_id}" style="color: #ffd900;">나의 선별기 관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="streaming.do?mb_id=${info.mb_id}">실시간 판별영상</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="data.do?mb_id=${info.mb_id}">나의 데이터관리</a>
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
					<div class="row backbutton">
						<a href="summary.do"><img class="backButton" alt="마이페이지로" src="<c:url value="/resources/images/back-button.png" />"></a>
					</div>
					<div class="row  mt-md-0 mt-lg-5">
						<div class="col-sm-12" data-aos="fade-up">
                                <h5>기기 관리</h5>
                                <div class="updateDevice">
                                	<table class="deviceTable" style="width: 20%;">
                                		<tr>
                                			<td class="deviceTd registerDevice" data-toggle="modal" data-target="#myModal1">등록</td>
                                		<!-- 	<td class="deviceTd modifyDevice" data-toggle="modal" data-target="#myModal2">수정</td>
                                			<td class="deviceTd deleteDevice" data-toggle="modal" data-target="#myModal3">삭제</td> -->
                                		</tr>
                                	</table>
                                </div><!-- 등록버튼 있는 테이블 영역 끝 -->
								<!-- Modal -->
								<div class="modal1 fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModal1Label" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<p class="modal-title" id="myModal1Label" style="font-size: 20px;">선별기 등록</p>
											</div>
											<div class="modal-body">
												<form class="loginform" action="registerDevice.do" method="post">
													<div class="row">
														<div class="col-sm-4">
															<p>선별기 이름</p>
														</div>
														<div class="col-sm-10">
															<div class="form-group">
																<input type="text" class="form-control" id="deviceName" name="m_name" placeholder="선별기 이름을 입력하세요">
																<input type="hidden" name="mb_id" value="${info.mb_id}">
															</div>
														</div>
														<div class="col-sm-4">
															<p>선별기 설치 일자</p>
														</div>
														<div class="col-sm-10">
															<div class="form-group">
																
																<input type="date" class="form-control" id="deviceDate" name="m_installation">
															</div>
														</div>
														<div class="col-sm-4">
															<p>모델 선택</p>
																<div class="djangoSendAppleKind">
                            										<select name="deep_id" class="form-control">
                            											<option>----</option>
                            											<option value="1">사과</option>
                            											<option value="2">토마토</option>
                            											<option value="3">배</option>
                            										</select>
                            									</div>
														</div>
														
                            							<div class="col-sm-4">
                            								<p>종류 선택</p>
														<div class="djangoSendAppleKind">
                            								<select name="fruit_kind" class="form-control">
                            									<option>----</option>
                            									<option value="fuji">푸지</option>
                            									<option value="yanggwang">양광</option>
                            								</select>
                            							</div>
														</div>
														<div class="col-sm-6">
															<input type="submit" class="btn btn-success" value="등록">
															<!-- submit 누르면  DB에 저장하기 -->
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
											</div>
										</div>
									</div>
								</div>
								
								<!-- /modal -->
								
							<!-- 테이블 영역 -->
                                <div class="tableDevice">
                                	<form action="" method="post">
	                                    <table class="table-striped table-hover table-device">
	                                        <tr>
	                                            <td>선별기 이름</td>
	                                            <td>설치 일자</td>
	                                            <td>수정</td>
	                                            <td>삭제</td>
	                                        </tr>
	                                        <c:forEach var="vo" items="${list}">
		                                        <tr>
		                                            <td>${vo.m_name}</td>
		                                            <td>${vo.m_installation }</td>
		                                            <td><a href="selectDevice.do?m_id=${vo.m_id}" data-toggle="modal" data-target="#myModal2">수정</a></td>
		                                            <td><a href="deviceDelete.do?m_id=${vo.m_id}&mb_id=${vo.mb_id}">삭제</a></td>
		                                        </tr>
		                                     </c:forEach>
	                                        <!-- 선별기 table에서 입력된 값 받아오기 -->
	                                    </table>
                                	</form>
                                	<!-- modal2 -->
                                	<div class="modal2 fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal2Label" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<p class="modal-title" id="myModal2Label" style="font-size: 20px;">선별기 수정</p>
											</div>
											<div class="modal-body">
												<form class="loginform" action="updateDevice.do" method="post">
													<div class="row">
														<div class="col-sm-10">
															<div class="form-group">
																<select class="form-control">
																	<c:forEach var="vo" items="${list}">
																	<option class="form-control">${vo.m_name}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-sm-10">
														<div class="col-sm-4">
															<p>선별기 이름</p>
														</div>
															<div class="form-group">
																<input type="text" class="form-control" id="deviceName" name="m_name" value="${dvo.m_name}">
																<input type="hidden" name="m_id" value="${dvo.m_id}">
															</div>
														</div>
														<div class="col-sm-6">
															<input type="submit" class="btn btn-success" value="수정">
															<!-- submit 누르면  DB에 저장하기 -->
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
											</div>
										</div>
									</div>
								</div><!-- modal2끄읕 -->
                                </div><!-- 테이블 영역 끝 -->
                                
						</div><!--col-sm의 닫는 태그  -->
					</div><!--row의 닫는 태그  -->
				</div><!-- container의 닫는 태그 -->
			</section>
		</div><!-- page-body 닫는 태그 -->
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
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="<c:url value="/resources/js/template.js" />" ></script>
		
		<script>
			
		
		</script>
</body>
</html>