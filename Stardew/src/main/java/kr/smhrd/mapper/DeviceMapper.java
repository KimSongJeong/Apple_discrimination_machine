package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeviceMapper {

	void registerDevice(DeviceVO dvo);

	public List<DeviceVO> deviceList(String mb_id);

	public DeviceVO selectDevice(int m_id);

	public void updateDevice(DeviceVO vo);

	DeviceVO test11(String mb_id);

	void stt_con(DeviceVO vo);

	void deviceDelete(int m_id);



}
