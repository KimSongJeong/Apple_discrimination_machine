<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
							<a class="show-contact nav-link" href="<c:url value="#contact"/>">고객지원</a>
						</li>
						<c:choose>
						<c:when test="${empty info}">
						<li class="nav-item">
							<a class="nav-link btn btn-success" href="login.do">로그인/회원가입</a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="nav-item">
							<a class="nav-link btn btn-success" href="logout.do">로그아웃</a>
						</li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
		<!-- 로그인 하면 뜨는 보조메뉴 뜨게 만들어야 함 -->
		<c:choose>
		<c:when test="${not empty info}">
		<nav class="navbar navbar-expand-lg fixed-second">
			<div class="container nav-second">
				<ul class="navbar-nav ml-auto align-items-center">
					<li class="nav-item">
						<a class="nav-link" href="summary.do?mb_id=${info.mb_id}" style="color: #ffd900;">AI 학습모델 현황</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="myDevices.do?mb_id=${info.mb_id}">나의 선별기 관리</a>
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
		</c:when>
		</c:choose>
		<div class="page-body-wrapper">
			<section id="home" class="home">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="main-banner">
								<div class="d-sm-flex justify-content-between">
									<div data-aos="zoom-in-up">
										<div class="banner-title">
												<h3 class="font-weight-medium"><strong style="color: #ffd900;">스타듀빌리지</strong>는<br> 정확한 데이터 분석을 통해 혁신적인 자동화 분류 솔루션을 지원합니다.</h3>
										</div>
										<p class="mt-3 main-script">ABC(Ai Bigdata Center) solution은 딥러닝을 통한 자동화된 AI 시스템으로서 분류업무, 분석업무, AI, 데이터 매니지먼트 영역에서 여러분이 직면한 문제를 확신을 가지고 해결할 수 있게 지원합니다.</p><br/>
										<a href="<c:url value="#services"/>" class="btn btn-secondary mt-3">더 알아보기</a>
									</div>
									<div class="mt-5 mt-lg-0">
										<img src="<c:url value="/resources/images/group.png"/>" alt="marsmello" class="img-fluid" data-aos="zoom-in-up">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="empty" class="empty">
				<div class="empty"></div>
			</section>
			<section class="main-section our-services " id="services">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h5 class="text-dark">제품소개</h5>
							<h1 class="font-weight-medium text-dark mb-5" style="color: #0a093d !important;">ABC solution</h1>
						</div>
					</div>
					<div class="row" data-aos="fade-up">
						<div class="img-fluid large-img">
							<img src="<c:url value="/resources/images/main-images.png"/>" alt="제품정보" class="large-image" data-aos-duration="1500">
						</div>
					</div>
				</div>
			</section>
			<section class="main-section pricing-list" id="plans">
				<div class="container">
					<div class="row" data-aos="fade-up" data-aos-offset="-500">
						<div class="col-sm-12">
							<div class="d-sm-flex justify-content-between align-items-center mb-2">
								<div>
									<h3 class="font-weight-medium text-dark ">AI 학습모델 다운로드</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="row"  data-aos="fade-up" data-aos-offset="-300">
						<div class="col-sm-4">
							<div class="pricing-box">
								<img class="fruit-img" src="<c:url value="/resources/images/apple.png"/>" alt="starter">
								<h6 class="font-weight-medium title-text">사과 판별 <br>AI 학습모델</h6>
								<a href="<c:url value="/resources/images/pageimages/ABC_apple.zip"/>" download><button class="btn btn-primary">다운로드</button></a>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pricing-box">
								<img class="fruit-img" src="<c:url value="/resources/images/tomato.png"/>" alt="starter">
								<h6 class="font-weight-medium title-text">토마토 판별 <br>AI 학습모델</h6>
								<a href="<c:url value="/resources/images/pageimages/laptop.png"/>" download><button class="btn btn-primary">다운로드</button></a>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pricing-box">
								<img class="fruit-img" src="<c:url value="/resources/images/pear.png"/>" alt="starter">
								<h6 class="font-weight-medium title-text">배 판별 <br>AI 학습모델</h6>
								<a href="<c:url value="/resources/images/pageimages/laptop.png"/>" download><button class="btn btn-primary">다운로드</button></a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="main-section contactus" id="contact">
				<div class="container">
					<div class="row mb-5 pb-5">
						<div class="col-sm-5" data-aos="fade-up" data-aos-offset="-500">
							<img src="<c:url value="/resources/images/contact.jpg"/>" alt="contact" class="img-fluid">
						</div>
						<div class="col-sm-7" data-aos="fade-up" data-aos-offset="-500">
							<h3 class="font-weight-medium text-dark mt-5 mt-lg-0">고객지원 요청사항</h3>
							<h5 class="text-dark mb-5">문의사항이 있으시면 입력해주세요.</h5>
							<form action="insertQuestion.do">
								<div class="row">
									<input type="hidden" name="mb_id" id="mb_id" value="${info.mb_id}">
									<div class="col-sm-12">
										<div class="form-group">
											<textarea id="title" name="q_title" class="form-control" placeholder="제목을 입력하세요" rows="1"></textarea>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<textarea id="message" name="q_content" class="form-control" placeholder="내용을 입력하세요" rows="5"></textarea>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="imgInput" class="btn btn-outline-primary">파일 업로드</label>
											<input type="file" id="imgInput" name="q_file" class="imgeInputFile" accept="img/*" style="display: none;" required multiple>
										</div>
									</div>
									<div class="col-sm-6">
										<input type="submit" class="btn btn-secondary" value="문의하기">
									</div>
								</div>
							</form>
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
</body>
</html>