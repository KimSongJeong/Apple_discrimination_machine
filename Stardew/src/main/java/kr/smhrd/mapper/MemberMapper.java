package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public void joinInsert(MemberVO vo);


	public MemberVO loginSelect(MemberVO vo);


	public List<MemberVO> memberList();
	

}
