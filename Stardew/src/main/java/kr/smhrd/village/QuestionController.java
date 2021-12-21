package kr.smhrd.village;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.mapper.QuestionMapper;
import kr.smhrd.mapper.questionVO;

@Controller
public class QuestionController {
	
	private QuestionMapper mapper;
	
	/*
	 * @RequestMapping("/QuestionList.do") public String QuestionList(Model model) {
	 * 
	 * List<questionVO> list = mapper.QuestionList();
	 * model.addAttribute("q_list",list);
	 * 
	 * return "redirect:/admin.do"; }
	 */

}
