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
public class DeviceVO {

	@NonNull
	private int m_id;
	private String m_name;
	private String mb_id;
	private String m_installation;
	private int deep_id;
	private int stt;
	private String fruit_kind;
}
