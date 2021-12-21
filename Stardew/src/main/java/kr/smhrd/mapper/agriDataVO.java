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
public class agriDataVO {
	@NonNull
	private int cl_seq;
	@NonNull
	private String cl_date;
	private int m_seq;
	private String fruit_kind;
	@NonNull
	private int deep_seq;
	
	private int cnt;
}
