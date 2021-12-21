package kr.smhrd.village;

import java.lang.reflect.Member;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.mapper.DeviceMapper;
import kr.smhrd.mapper.DeviceVO;
import kr.smhrd.mapper.MemberVO;

@Controller
public class DeviceController {

	@Inject
	private DeviceMapper mapper;
	
	@RequestMapping("/registerDevice.do")
	public String registerDevice(DeviceVO dvo) {
		mapper.registerDevice(dvo);
		
		return "redirect:/myDevices.do?mb_id="+dvo.getMb_id();
	}
	
	
	@RequestMapping("/updateDevice.do")
	public String updateDevice(DeviceVO vo) {
		
		mapper.updateDevice(vo);
		
		
		return "redirect:/myDevices.do";
	}
	
	@RequestMapping("deleteDevice.do")
	public String deleteDevice() {
		
		return "redirect:/myDevices.do";
	}
	
	@RequestMapping("/selectDevice.do")
	public String selectDevice(@Param(value="m_id")int m_id, Model model) {
		
		DeviceVO vo = mapper.selectDevice(m_id);
		System.out.println("머신 아이디 가져오나요~~~~~"+m_id);
		model.addAttribute("dvo",vo);
		
		return "redirect:/myDevices.do";
	}
	
	
	// 송정 장고 <-> 스프링 전송 테스트
	@RequestMapping("/test11.do")
	public String test11(HttpSession session) {
		MemberVO mem = (MemberVO)session.getAttribute("info");
		DeviceVO vo = mapper.test11(mem.getMb_id());
		session.setAttribute("mainfo", vo);
		System.out.println(session.getAttribute("info"));
		System.out.println(session.getAttribute("mainfo"));
		return "redirect:/SongJeongTest.do";
	}
	
	@RequestMapping("/stt_con.do")
	public String stt_con(String stt, String m_id) {
		if (stt.equals("1")) {
			stt = "0";
		}else {
			stt = "1";
		}
		System.out.println("stt : " + stt);
		System.out.println("m_id : " + m_id);
		
		DeviceVO vo = new DeviceVO();
		vo.setStt(Integer.parseInt(stt));
		vo.setM_id(Integer.parseInt(m_id));
		
		mapper.stt_con(vo);
		return "redirect:/streaming.do";
	}
	
	@RequestMapping("/deviceDelete.do")
	public String deviceDelete(@Param(value="m_id") int m_id,@Param(value="mb_id") String mb_id) {
		mapper.deviceDelete(m_id);
		return "redirect:/myDevices.do?mb_id="+mb_id;
	}
	
	
}
