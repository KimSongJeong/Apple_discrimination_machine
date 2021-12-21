package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class questionVO {

	@NonNull
	private int q_seq;
	private String q_title;
	private String q_content;
	private String reg_date;
	private String q_file;
	private String mb_id;
}
