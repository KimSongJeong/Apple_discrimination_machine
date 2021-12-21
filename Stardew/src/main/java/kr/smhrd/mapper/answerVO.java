package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class answerVO {
	@NonNull
	private int a_seq;
	private int q_seq;
	private String a_content;
	private String reg_date;
	private String mb_id;
	
	

}
