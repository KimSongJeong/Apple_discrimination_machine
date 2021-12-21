<%@page import="kr.smhrd.mapper.DeviceVO"%>
<%@page import="java.util.List"%>
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
						<a class="nav-link" href="myDevices.do?mb_id=${info.mb_id}">나의 선별기 관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="streaming.do?mb_id=${info.mb_id}" style="color: #ffd900;">실시간 판별영상</a>
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
			<section class="our-projects" id="projects">
			<div class="container">
				<div class="row  mt-md-0 mt-lg-4">
					<div class="device-area col-sm-3 text-body " data-aos="fade-up">
						<h3 class="font-weight-medium">기기 제어</h3>
						<table>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.m_name}<td>
									<td style="display: none;" class="machines mid">${vo.m_id}<td>
									<td style="display: none;" class="machines mbid">${vo.mb_id}<td>
									<td style="display: none;" class="machines deepid">${vo.deep_id}<td>
									<td style="display: none;" class="machines fruitkind">${vo.fruit_kind}<td>
									<td style="display: none;" class="machines stt">${vo.stt}<td>
									<td>
										<label class="toggle-switch toggle-switch">
										<c:choose>
											<c:when test="${vo.stt == 1}">
												<input type="checkbox" id="${vo.m_id}" class="on">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="${vo.m_id}" class="off">
											</c:otherwise>
										</c:choose>
										
										
										<%-- <%if (${vo.stt} == 1 ){ %>
										<input type="checkbox" id="${vo.m_id}" class="on">
										<%}else{ %>
										<input type="checkbox" id="${vo.m_id}" class="off">
										<%} %> --%>
										<span class="toggle-slider round"></span>
										</label>
									</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<!-- 디바이스 -->
					<div class="col-sm-8" data-aos="fade-up">
						<div id="testimonial-flipster">
							<table>
								<tr>
									<td><h3 style="margin-right: 40%">실시간 판별 영상</h3></td>
									<td><button class="btn btn-primary"
											onClick="window.location.reload()" style="margin-left: 20%">새로고침</button></td>
								</tr>
							</table>
							<div class="item" style="margin-top: 20px;">
								<div class="videos">
									<%
										// 기기 1번에 해당하는 상태를 가져오는 코드
									List<DeviceVO> dd_list = (List) session.getAttribute("list5");
									%>

									<%if (dd_list.get(0).getStt() == 1) {%>
									<img src="http://183.105.48.223:8002/streaming/"
										style="width: 640px; height: 400px;">
									<%} else {%>
									<img src="<c:url value="/resources/images/off.jpg"/>" style="width: 640px; height: 400px;">
									<%}%>
									<%for (int i = 1; i < dd_list.size(); ++i) { 
										pageContext.setAttribute("i", i);%>
									<%if (dd_list.get(i).getStt() == 1) {%>
									<img src="<c:url value="/resources/images/appleGIF${i}.gif"/>" style="width: 212px; height: 135px;">
									<%} else {%>
									<img src="<c:url value="/resources/images/off.jpg"/>" style="width: 212px; height: 135px;">
									<%}%>
									<%}%>

								</div>
								<!-- 비디오  -->
							</div>
							<!-- 아이템 -->

						</div><!-- tes -->
					</div><!-- col -->
				</div><!-- row -->

			</div><!-- container -->

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
		<script>
		var m_id = [];
		var mb_id = [];
		var deep_id = [];
		var fruit_kind = [];
		var state = [];
		
		for (var i = 0; i < document.getElementsByClassName('mid').length; ++i) {
			m_id[i] = document.getElementsByClassName('mid')[i].childNodes[0].nodeValue;
			mb_id[i] = document.getElementsByClassName('mbid')[i].childNodes[0].nodeValue;
			deep_id[i] = document.getElementsByClassName('deepid')[i].childNodes[0].nodeValue;
			fruit_kind[i] = document.getElementsByClassName('fruitkind')[i].childNodes[0].nodeValue;
			state[i] = document.getElementsByClassName('stt')[i].childNodes[0].nodeValue;
		}
		
		for(var i = 1; i <= m_id[m_id.length-1]; ++i) {
			if (state[i-1] == 1) {
				$("input:checkbox[id='"+(i)+"']").prop("checked", true)
			}else {
				$("input:checkbox[id='"+(i)+"']").prop("checked", false)
			}
		}
		console.log(m_id)
		var aaa = {
			'mb_id' : mb_id[0]
		}
		
		
		function onoff( e ) {	
			var i = e.data.i;
			console.log(i);
				if($(this).hasClass("on")) {
		        	$(this).addClass("off").removeClass("on");
		        	stt = {
						"mb_id" : mb_id[i],
						"m_id" : m_id[i],
						"deep_id" : deep_id[i],
						"fruit_kind" : fruit_kind[i],
						"stt": "off",
					};
			console.log(stt);
		    } else {
		        $(this).addClass("on").removeClass("off");
		         stt = {
						"mb_id" : mb_id[i],
						"m_id" : m_id[i],
						"deep_id" : deep_id[i],
						"fruit_kind" : fruit_kind[i],
						"stt": "on"
						};
			console.log(stt);
		    }
			$.ajax({
				type : 'POST',
				data : stt,
				url : 'http://183.105.48.223:8002/streaming/',
				datetype : 'JSON',
				success : function(data) {
				},
				error : function() {
				}
			})
		}
		<%for(int i = 0; i< dd_list.size(); ++i) {%>
			$("#<%=i+1%>").click({i: <%=i%>},onoff);
		<%}%>
		
		
		
		function stt_dbinsert( e ) {
			var i = "'#"+((e.data.i)+1)+"'";
			var j = e.data.i;
			console.log(i);
			console.log(j);

			$.ajax({
			url:"stt_con.do?stt=" + state[j] + "&m_id=" + m_id[j]
				})
		}
		
		<%for(int i = 0; i< dd_list.size(); ++i) {%>
		$("#<%=i+1%>").click({i: <%=i%>},stt_dbinsert);
		<%}%>
		</script>
</body>
</html>