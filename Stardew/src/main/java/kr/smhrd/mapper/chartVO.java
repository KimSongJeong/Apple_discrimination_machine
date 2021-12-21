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
public class chartVO {

	@NonNull
	private int idx;
	private String times;
	private String result;
	private int cnt;
	private float rat;
	private String kind;
	
	
}
