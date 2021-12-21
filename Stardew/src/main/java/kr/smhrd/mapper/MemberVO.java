package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 게터 세터
@AllArgsConstructor //생성자
@NoArgsConstructor // 디폴트 생성자
public class MemberVO {
	
	private String mb_id; 
	private String mb_pwd;
	private String mb_name;
	private String mb_addr;
	private String mb_phone;
	private String mb_joindate;
	private String mb_type;
	

}
