<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart</title>
<link  type="text/css" rel="stylesheet" href="<c:url value="/resources/css/test.css" />" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<script src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
</head>
<body>
	<h1>자바스크립트의</h1>
	<h2>차트 라이브러리 Chart.js</h2>
	<!-- <div class="selectType">
		<button type="button" class="typeButton" value="line">Line</button>
		<button type="button" class="typeButton" value="bar">Bar</button>
		<button type="button" class="typeButton" value="radar">Radar</button>
		<button type="button" class="typeButton" value="doughnut">Doughnut</button>
		<button type="button" class="typeButton" value="pie">Pie</button>
		<button type="button" class="typeButton" value="polarArea">PolarArea</button>
		<button type="button" class="typeButton" value="bubble">Bubble</button>
		<button type="button" class="typeButton" value="scatter">Scatter</button>
		<button type="button" class="typeButton" value="mixed">Mixed</button>
	</div> -->
	<div class="selectType">
		<button type="button" class="updateData" value="update">데이터 업데이트</button>
	</div>
	<hr class="divideLine">
	<div class="chartArea" id="chartDiv">
		<canvas id="myChart"></canvas>
	</div>
	<div class="chartArea">
		<canvas id="myChart2"></canvas>
	</div>
	<div class="showData">
		<table class="agridata">
			<tr class="table-label">
				<td>분류결과</td>
				<td>카운트</td>
			</tr>
			<c:forEach var="vo" items="${dataresult}">
			<tr class="table-result">
				<td>${vo.deep_seq}</td>
				<td class="listItem">${vo.cnt}</td>
			</tr>
			</c:forEach>
		</table>
		<table class="agridata">
			<tr class="table-label">
				<td>선별날짜</td>
				<td>분류결과</td>
				<td>카운트</td>
			</tr>
			<c:forEach var="vo" items="${dataDay}">
			<tr class="table-result">
				<td>${vo.cl_date}</td>
				<td>${vo.deep_seq}</td>
				<td class="listItem">${vo.cnt}</td>
			</tr>
			</c:forEach>
		</table>
		<table class="agridata">
			<tr class="table-label">
				<td>선별 순번</td>
				<td>선별 날짜</td>
				<td>선별기 순번</td>
				<td>과일품종</td>
				<td>학습모델 결과</td>
			</tr>
			<c:forEach var="vo" items="${datalist}">
			<tr class="table-result">
				<td>${vo.cl_seq}</td>
				<td>${vo.cl_date}</td>
				<td>${vo.m_seq}</td>
				<td>${vo.fruit_kind}</td>
				<td>${vo.deep_seq}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
<script src="<c:url value="/resources/js/test.js" />"></script>
</body>
</html>