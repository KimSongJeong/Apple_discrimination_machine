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
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="page-body-wrapper">
			<section id="empty" class="empty">
				<div class="empty"></div>
			</section>
			<section class="our-projects admin-section" id="projects">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-sm-12">
                            <div class="d-sm-flex justify-content-between align-items-center mb-2">
                                <h3 class="font-weight-medium text-dark ">관리자 대시보드</h3>
                            </div>
							<div class="container nav-second">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active nav-a-tag" data-toggle="tab" href="#memberAdmin">회원관리</a></li>
									<li class="nav-item"><a class="nav-link nav-a-tag" data-toggle="tab" href="#question">고객 문의 사항 접수 목록</a></li>
									<li class="nav-item"><a class="nav-link nav-a-tag" data-toggle="tab" href="#answer">응답 현황</a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="col-sm-12 tab-pane fade show active" id="memberAdmin">
										<table class="table-member table-striped table-hover">
											<tr>
												<td>회원 아이디</td>
												<td>이름</td>
												<td>주소</td>
												<td>전화번호</td>
												<td>가입일자</td>
												<td>회원 유형</td>
											</tr>
											<!-- 회원의 정보를 가져올 수 있도록 만들기 -->
											<tr>
												<td>mb_id</td>
												<td>mb_name</td>
												<td>mb_addr</td>
												<td>mb_phone</td>
												<td>mb_joindate</td>
												<td>mb_type</td>
											</tr>
								</table>
								</div>
								<div class="col-sm-12 tab-pane fade" id="question">
										<table class="table-member table-striped table-hover">
											<tr>
												<td>질문 번호</td>
												<td>질문 제목</td>
												<td>질문 내용</td>
												<td>작성 일자</td>
												<td>질문 파일</td>
												<td>질문 작성자</td>
											</tr>
											<!-- 질문지 정보를 가져올 수 있도록 만들기 -->
											<tr>
												<td>q_seq</td>
												<td>q_title</td>
												<td>q_content</td>
												<td>reg_date</td>
												<td>q_file</td>
												<td>mb_id</td>
											</tr>
										</table>
								</div>
								<div class="col-sm-12 tab-pane fade" id="answer">
										<table class="table-member table-striped table-hover">
											<tr>
												<td>응답 순번</td>
												<td>질문 번호</td>
												<td>응답 내용</td>
												<td>작성 일자</td>
												<td>답변 작성자</td>
											</tr>
											<!-- 질문지 정보를 가져올 수 있도록 만들기 -->
											<tr>
												<td>a_seq</td>
												<td>q_seq</td>
												<td>a_content</td>
												<td>reg_date</td>
												<td>mb_id</td>
											</tr>
										</table>
								</div>
						</div>
					</div>
                    </div>
                </div>
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
		<script src="<c:url value="/resources/js/template.js" />" ></script>
		<script src="<c:url value="/resources/js/chart.js" />" ></script>
</body>
</html>