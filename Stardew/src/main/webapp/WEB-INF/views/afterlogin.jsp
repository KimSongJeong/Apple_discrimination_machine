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
						<a class="nav-link" href="summary.do">판별요약</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="streaming.do">실시간 판별영상</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="data.do">나의 농산물관리</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="page-body-wrapper">
			<section id="home" class="home">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="main-banner">
								<div class="d-sm-flex justify-content-between">
									<div data-aos="zoom-in-up">
										<div class="banner-title">
												<h3 class="font-weight-medium">저희는 스타듀빌리지 입니다.</h3>
										</div>
										<p class="mt-3">우리는 굉장히 좋은 학습모델을 만들어서 아주아주 좋은 결과를 당신에게 줄것입니다요! 진짜로 리얼로 이거는 우리가 굉장히 노력해서 만든것이기 때문이지</p>
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
			<section class="our-services" id="services">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h5 class="text-dark">제품소개</h5>
							<h3 class="font-weight-medium text-dark mb-5">ABC solution</h3>
						</div>
					</div>
					<div class="row" data-aos="fade-up">
						<div class="img-fluid large-img">
							<img src="<c:url value="/resources/images/pageimages/ai-hub.png"/>" alt="ai-hub" class="large-image" data-aos-duration="1500">
						</div>
						<div class="services-box">
							<h4 class="font-weight-medium text-dark mb-5">딥러닝을 통한 작물의 양품/불량품 판별 AI 솔루션</h4>
							<h6 class="mt-3">BIGWATCHER는 현장에 설치되어 있는 다양한 장비들로부터 수집된 빅데이터를 통해 사용자가 손쉽게 설정한 알고리즘을 이용한 데이터 학습이 가능합니다. 학습된 데이터를 통해 사용자에게 미리 장비부품 및 장비 교체 시기, 점검 시기 등을 알려주므로 사용자는 손쉽게 예측감시/예지보전/예방정비를 할 수 있습니다. 다양한 데이터베이스에 저장되어 있는 히스토리 빅데이터 뿐만 아니라 X-DAS의 OPC-UA 통신을 통해 실시간으로 수집하는 빅데이터들을 분석에 적용하여 운영할 수 있습니다. 공정별 데이터 분석을 통하여 최종생산품의 품질여부에 영향을 미치는 요소들을 체계적으로 관리하여 생산품의 양품 결과 데이터를 예측할 수 있습니다.</h6>
							<h6 class="mt-3">BIGWATCHER는 현장에 설치되어 있는 다양한 장비들로부터 수집된 빅데이터를 통해 사용자가 손쉽게 설정한 알고리즘을 이용한 데이터 학습이 가능합니다. 학습된 데이터를 통해 사용자에게 미리 장비부품 및 장비 교체 시기, 점검 시기 등을 알려주므로 사용자는 손쉽게 예측감시/예지보전/예방정비를 할 수 있습니다. 다양한 데이터베이스에 저장되어 있는 히스토리 빅데이터 뿐만 아니라 X-DAS의 OPC-UA 통신을 통해 실시간으로 수집하는 빅데이터들을 분석에 적용하여 운영할 수 있습니다. 공정별 데이터 분석을 통하여 최종생산품의 품질여부에 영향을 미치는 요소들을 체계적으로 관리하여 생산품의 양품 결과 데이터를 예측할 수 있습니다.</h6>
							<h6 class="mt-3">BIGWATCHER는 현장에 설치되어 있는 다양한 장비들로부터 수집된 빅데이터를 통해 사용자가 손쉽게 설정한 알고리즘을 이용한 데이터 학습이 가능합니다. 학습된 데이터를 통해 사용자에게 미리 장비부품 및 장비 교체 시기, 점검 시기 등을 알려주므로 사용자는 손쉽게 예측감시/예지보전/예방정비를 할 수 있습니다. 다양한 데이터베이스에 저장되어 있는 히스토리 빅데이터 뿐만 아니라 X-DAS의 OPC-UA 통신을 통해 실시간으로 수집하는 빅데이터들을 분석에 적용하여 운영할 수 있습니다. 공정별 데이터 분석을 통하여 최종생산품의 품질여부에 영향을 미치는 요소들을 체계적으로 관리하여 생산품의 양품 결과 데이터를 예측할 수 있습니다.</h6>
						</div>
					</div>
				</div>
			</section>
			<section class="pricing-list" id="plans">
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
								<img src="<c:url value="/resources/images/premium.svg"/>" alt="starter">
								<h6 class="font-weight-medium title-text">사과 판별 <br>AI 학습모델</h6>
								<a href="<c:url value="/resources/images/pageimages/laptop.png"/>" download><button class="btn btn-primary">다운로드</button></a>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pricing-box">
								<img src="<c:url value="/resources/images/premium.svg"/>" alt="starter">
								<h6 class="font-weight-medium title-text">토마토 판별 <br>AI 학습모델</h6>
								<a href="<c:url value="/resources/images/pageimages/laptop.png"/>" download><button class="btn btn-primary">다운로드</button></a>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pricing-box">
								<img src="<c:url value="/resources/images/premium.svg"/>" alt="starter">
								<h6 class="font-weight-medium title-text">배 판별 <br>AI 학습모델</h6>
								<a href="<c:url value="/resources/images/pageimages/laptop.png"/>" download><button class="btn btn-primary">다운로드</button></a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="contactus" id="contact">
				<div class="container">
					<div class="row mb-5 pb-5">
						<div class="col-sm-5" data-aos="fade-up" data-aos-offset="-500">
							<img src="<c:url value="/resources/images/contact.jpg"/>" alt="contact" class="img-fluid">
						</div>
						<div class="col-sm-7" data-aos="fade-up" data-aos-offset="-500">
							<h3 class="font-weight-medium text-dark mt-5 mt-lg-0">고객지원 요청사항</h3>
							<h5 class="text-dark mb-5">문의사항이 있으시면 입력해주세요.</h5>
							<form>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input type="text" class="form-control" id="name" placeholder="작성자">
										</div>
									</div>
									
									<div class="col-sm-12">
										<div class="form-group">
											<input type="email" class="form-control" id="mail" placeholder="이메일">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<textarea name="title" id="title" class="form-control" placeholder="제목을 입력하세요" rows="1"></textarea>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<textarea name="message" id="message" class="form-control" placeholder="내용을 입력하세요" rows="5"></textarea>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="imgInput" class="btn btn-outline-primary">파일 업로드</label>
											<input type="file" id="imgInput" class="imgeInputFile" accept="img/*" style="display: none;" required multiple>
										</div>
									</div>
									<div class="col-sm-6">
										<input type="submit" class="btn btn-secondary" value="문의하기">
										<!-- <a href="#contact" class="btn btn-secondary">문의하기</a> -->
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