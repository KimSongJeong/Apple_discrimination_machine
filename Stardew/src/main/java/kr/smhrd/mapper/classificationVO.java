package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.experimental.NonFinal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class classificationVO {
	
	@NonNull
	private int cl_seq;
	private String cl_date;
	private String fruit_kind;
	private int deep_id;
	private String cl_result;
	private String mb_id;
	private int m_id;
	
	//각각의 결과값 카운트 한 값
	private int cnt;
	//전일 대비 카운트 값의 변화(증감)
	private int up_down;
	
	//최신날짜
	private String recent_date;
	//불량률 조사한 값
	private int percent;
	
	//오늘날짜, 내일 날짜
	private String chkDate;
	private String yesterday;
	
	private String perHour;
	
	//기간 설정해서 가져온값
	private String startDay;
	private String endDay;
	
}
