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
							<a class="nav-link" href="mainIndex.do">Home<span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link show-services" href="mainIndex.do">제품 및 솔루션</a>
						</li>
						<li class="nav-item">
							<a class="nav-link show-contact" href="mainIndex.do">고객지원</a>
						</li>
						<li class="nav-item">
							<a class="nav-link btn btn-success" href="login.do">로그인/회원가입</a>
							<!-- controller에 추가해서 만들어야함 -->
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="page-body-wrapper">
			<section class="login-form" id="login-area" style="padding-top: 200px;">
				<div class="container">
					<div class="row mb-5 pb-5 login-center">
						<div class="col-sm-7 loginform-center" data-aos="fade-up" data-aos-offset="-500">
							<h3 class="font-weight-medium text-dark mt-5 mt-lg-0">로그인하기</h3>
							<h5 class="text-dark mb-5">서비스를 이용하기 위해서는 <br>로그인이 필요합니다.</h5>
							<form class="loginform-center" action="loginSelect.do" method="post">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<input type="text" class="form-control" id="id" placeholder="아이디" name="mb_id">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<input type="password" class="form-control" id="password" placeholder="비밀번호" name="mb_pwd">
										</div>
									</div>
									<div class="col-sm-12">
										<input type="submit" class="btn btn-secondary" value="로그인하기">
										<!-- submit 누르면 index.html갈 수 있도록 설정하기 -->
									</div>
									<div class="col-sm-12">
										<a class="btn btn-group-sm" href="join.do">회원이 아니시라면?</a>
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