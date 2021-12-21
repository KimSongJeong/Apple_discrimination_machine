<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<meta charset="UTF-8">
<title>chart</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/test.css" />">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>

<script src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
</head>
<body>
	<h1>송정이의 테스트</h1>
			
			
	<div>
		<form action="test11.do" method="post">
			<div class="form-group">
				<div class="col-sm-10">
					<input type="text" class="form-control" name="id" value="메모장"
						style="width: 40%; height: 30%;">
				</div>
				<h5>회원 아이디 : ${mainfo.mb_id}</h5>
				<h5>기기 아이디 : ${mainfo.m_id}</h5>
				<h5>모델 아이디 : ${mainfo.deep_id}</h5>
				<button type="submit">정보 불러오기릿기릿</button>
			</div>
		</form>
		
		
		<div>
			<table>
			<tr>
			<td style = "display : none;" class = "machines">${mainfo.stt}</td>
			<td style = "display : none;" class = "machines">${mainfo.m_id}</td>
			<td>
				<p>${mainfo.m_name}</p>
					<label class="toggle-switch toggle-switch"> 
						<input type="checkbox" id="${mainfo.m_id}"> 
						<span class="toggle-slider round"></span>
					</label>
					</td>
					</tr>
			</table> 
		</div>
		
		<!-- 토글 태스트  -->		
	<div>
		<h5>1번기기</h5>
		<label class="toggle-switch toggle-switch"> 
			<input type="checkbox" id="switch"> 
				<span class="toggle-slider round"></span>
		</label> 

		<script>
		// on/off db에서 저장된 값 가져와 표시
		state = document.getElementsByClassName('machines')[0].childNodes[0].nodeValue
		idid = document.getElementsByClassName('machines')[1].childNodes[0].nodeValue
		console.log(state);
		console.log(idid);
		
		if (state == 1) {
			$("input:checkbox[id='1']").prop("checked", true)
		}else {
			$("input:checkbox[id='1']").prop("checked", false)
		}
			
		
		
		
			var stt = {}
			$('#1').click(function() {
				if($(this).hasClass("toggle-switch toggle-switch > input")) {
			        $(this).addClass("off").removeClass("on");
			        stt = {
							"mb_id" : '${mainfo.mb_id}',
							"m_id" : '${mainfo.m_id}',
							"deep_id" : '${mainfo.deep_id}',
							"fruit_kind" : '${mainfo.fruit_kind}',
							"stt": "off"
			        };
			    } else {
			        $(this).addClass("on").removeClass("off");
			         stt = {
								"mb_id" : '${mainfo.mb_id}',
								"m_id" : '${mainfo.m_id}',
								"deep_id" : '${mainfo.deep_id}',
								"fruit_kind" : '${mainfo.fruit_kind}',
								"stt": "on"
							};
				console.log(stt);
			    }
				$.ajax({
					type : 'POST',
					data : stt,
					url : 'http://127.0.0.1:8000/streaming/',
					datetype : 'JSON',
					success : function(data) {
						// alert('성공 !! ')
						// console.log(data);
					},
					error : function() {
						// alert('다시 시도해 주세요');
					}
				})
				/* $.ajax({
					url:"stt_con.do?state=" + state + "&idid=" + idid
				}); */
			})

		</script>
		<!-- <div class="djangoSendAppleKind">
			<form action="">
				<input type="text" class="form-control" name="사과" value="사과" readonly />
				<select name="fruit_kind" class="form-control">
					<option value="fuji">푸지</option>
					<option value="yanggwang">양광</option>
				</select> 
				<input type="submit" class="btn btn-primary" value="품종선택" id="apple">
			</form>
		</div> -->
	</div>

	<!-- <div>
		<table>
			<tr>
				<img src="http://127.0.0.1:8000/streaming/" style="width: 640px; height: 400px;">
			</tr>
			<tr>
			<img src="http://127.0.0.1:8000/view/view" style="width: 212px; height: 135px;">
			<img src="http://127.0.0.1:8000/view/view" style="width: 212px; height: 135px;">
			<img src="http://127.0.0.1:8000/view/view" style="width: 212px; height: 135px;">
				<td><img src="http://127.0.0.1:8000/view/view" style="width: 212px; height: 135px;"></td>
				<td><img src="http://127.0.0.1:8000/view/view" style="width: 212px; height: 135px;"></td>
				<td><img src="http://127.0.0.1:8000/view/view" style="width: 212px; height: 135px;"></td>
			</tr>
		</table>
	</div> -->



	<script>
		
		
	
		
		
	
		/* $('#s_apple').click(function(){
			
			var apple = $("select[id=fruit_kind_set] option:selected").text();
			var on = {
				"mb_id" : '${mainfo.mb_id}',
				"m_id" : '${mainfo.m_id}',
				"deep_id" : '${mainfo.deep_id}',
				"fruit_kind" : apple,
				"stt": "on"
			};
			
			console.log(on);
		}); */
		

		
		
		// ON 버튼 클릭 시,
		/* $('#on').click(function() {
			$.ajax({
				type : 'POST',
				//data: JSON.stringify(data),
				data : on,
				url : 'http://127.0.0.1:8000/streaming/',
				datetype : 'JSON',
				success : function(data) {
					// alert('성공 !! ')
					// console.log(data);
					// alert('성공');
					// location.href = "http://www.naver.com";
				},
				error : function() {
					// alert('다시 시도해 주세요');
				}
			})
		}) */
		
		// OFF 버튼 클릭 시,
		/* $('#off').click(function() {
			$.ajax({
				type : 'POST',
				//data: JSON.stringify(data),
				data : off,
				url : 'http://127.0.0.1:8000/streaming/',
				datetype : 'JSON',
				success : function(data) {
					// alert('성공 !! ')
					// console.log(data);
					// alert('성공');
					// location.href = "http://www.naver.com";
				},
				error : function() {
					// alert('다시 시도해 주세요');
				}
			})
		}) */
		
	</script>

</body>
</html>