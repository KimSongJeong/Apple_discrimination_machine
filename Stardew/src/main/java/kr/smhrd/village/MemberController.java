package kr.smhrd.village;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.MemberVO;

@Controller // 이 클래스는 컨트롤러 입니다 지정
public class MemberController {
	
	@Inject //의존성 주입
	private MemberMapper mapper;
	
	
	
	@RequestMapping("/joinInsert.do")
	public String join(MemberVO vo) {
		mapper.joinInsert(vo);
		
		return "redirect:/login.do";
	
	}
	
	@RequestMapping("/loginSelect.do")
	public String loginSelect(MemberVO vo, HttpSession session) {
		
		MemberVO Info = mapper.loginSelect(vo);
		
		if(Info != null) {
			session.setAttribute("info", Info);
			System.out.println(session.getAttribute("info"));
			if(Info.getMb_id().equals("admin")) {
				return "redirect:/admin.do";
			}else {
				return "redirect:/summary.do?mb_id="+Info.getMb_id();
			}
		}else {
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("info");
		
		return "redirect:/mainIndex.do";
	}

	
	/*
	 * @RequestMapping("/memberList.do") public String memberList(Model model) {
	 * 
	 * List<MemberVO> memberlist = mapper.memberList();
	 * model.addAttribute("memberList", memberlist);
	 * 
	 * 
	 * return "redirect:/admin.do"; }
	 */
	 
}
