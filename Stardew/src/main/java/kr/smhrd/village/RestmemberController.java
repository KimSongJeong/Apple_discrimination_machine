package kr.smhrd.village;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.MemberVO;

@RestController
public class RestmemberController {
	
	
	private MemberMapper mapper;
	
	/*
	 * @RequestMapping("/memberList.do") public List<MemberVO> memberList(){
	 * List<MemberVO> list = mapper.memberList();
	 * 
	 * return list; }
	 */
}
