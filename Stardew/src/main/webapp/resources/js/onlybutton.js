		m_id = []
		mb_id = []
		deep_id = []
		fruit_kind = []
		state = []
		
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
		//console.log(m_id)
		//console.log(mb_id)
		//console.log(deep_id)
		//console.log(fruit_kind)
		//console.log(state)
		
		
		for(var i = 0; i< m_id[m_id.length-1]; ++i) {
			$("#"+(i+1)+"").click(function() {	
				if($(this).hasClass("on")) {
		        	$(this).addClass("off").removeClass("on");
		        	stt = {
						"mb_id" : mb_id[0],
						"m_id" : m_id[0],
						"deep_id" : deep_id[0],
						"fruit_kind" : fruit_kind[0],
						"stt": "off",
					};
			console.log(stt);
		    } else {
		        $(this).addClass("on").removeClass("off");
		         stt = {
						"mb_id" : mb_id[0],
						"m_id" : m_id[0],
						"deep_id" : deep_id[0],
						"fruit_kind" : fruit_kind[0],
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
		})
		}
			$('#1').click(function() {	
			$.ajax({
			url:"stt_con.do?stt=" + state[0] + "&m_id=" + m_id[0]
				})
			})
			
			$('#2').click(function() {	
			$.ajax({
			url:"stt_con.do?stt=" + state[1] + "&m_id=" + m_id[1]
				})
			})
			
			$('#3').click(function() {	
			$.ajax({
			url:"stt_con.do?stt=" + state[2] + "&m_id=" + m_id[2]
				})
			})
			
			$('#4').click(function() {	
			$.ajax({
			url:"stt_con.do?stt=" + state[3] + "&m_id=" + m_id[3]
				})
			})