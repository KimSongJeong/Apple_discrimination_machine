package kr.smhrd.village;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.smhrd.mapper.AnswerMapper;
import kr.smhrd.mapper.DeviceMapper;
import kr.smhrd.mapper.DeviceVO;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.MemberVO;
import kr.smhrd.mapper.QuestionMapper;
import kr.smhrd.mapper.agriDataVO;
import kr.smhrd.mapper.agriMapper;
import kr.smhrd.mapper.answerVO;
import kr.smhrd.mapper.chartVO;
import kr.smhrd.mapper.classificationMapper;
import kr.smhrd.mapper.classificationVO;
import kr.smhrd.mapper.questionVO;

@Controller
public class HomeController {

	@Autowired
	private agriMapper mapper;

	@Inject
	private QuestionMapper Qmapper;

	@Inject
	private DeviceMapper Dmapper;
	@Inject
	private MemberMapper Mmapper;
	
	@Inject
	private classificationMapper Cmapper;
	
	@Inject
	private AnswerMapper Amapper;
	
	
	// 테스트용
	@RequestMapping("/chartTest.do")
	public String chartTest(Model model) {

		List<agriDataVO> datalist = mapper.agriList();
		model.addAttribute("datalist", datalist);

		List<agriDataVO> dataresult = mapper.agriResult();
		model.addAttribute("dataresult", dataresult);

//		List<agriDataVO> dataDay = mapper.agriDate();
//		model.addAttribute("dataDay", dataDay);

		return "chartTest";
	}
	
	// 테스트용
	@RequestMapping("/SongJeongTest.do")
	public String SongJeongTest(Model model) {
		return "SongJeongTest";
		
	}
	
	

	@RequestMapping("/mainIndex.do")
	public String mainIndex() {

		return "index";
	}

	@RequestMapping("login.do")
	public String login() {

		return "login";
	}

	@RequestMapping("join.do")
	public String join() {

		return "join";
	}

	@RequestMapping("afterlogin.do")
	public void afterlogin() {
	}

	@RequestMapping("summary.do")
	public String summary(@Param(value = "mb_id") String mb_id, Model model, classificationVO vo) {

		List<agriDataVO> dataresult = mapper.agriResult();
		model.addAttribute("dataresult", dataresult);
		
		Calendar calendar = new GregorianCalendar();
	      SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
	      
	      String chkDate = SDF.format(calendar.getTime());      
	      System.out.println("Today : " + (String)chkDate);
	      vo.setChkDate(chkDate);
	      
	      calendar.add(Calendar.DATE, -1);      
	      chkDate = SDF.format(calendar.getTime());
	      String yesterday = chkDate;
	      System.out.println("Yesterday : " + (String)yesterday);
	      
	      
	     
	      vo.setYesterday(yesterday);
	      
		List<classificationVO> applelistJy = Cmapper.appleListKind(vo);
		System.out.println("summary에서 가져온 vo"+vo);
		model.addAttribute("applelistJy", applelistJy);
		
		

		return "summary";
	}

	@RequestMapping("/streaming.do")
	   public String streaming(@Param(value = "mb_id") String mb_id, Model model, HttpServletRequest request) {

	      List<DeviceVO> list = Dmapper.deviceList(mb_id);
	      model.addAttribute("list", list);
	      
	      HttpSession session = request.getSession();
	      session.setAttribute("list5", list);
	      
	      
	      return "streaming";
	   }

	@RequestMapping("data.do")
	public String data(@Param(value = "mb_id") String mb_id,@Param(value ="cropdate") String cropdate,Model model, classificationVO vo, chartVO hvo) {

			//오늘날짜 어제날짜 가져오기
		  
		  
		  
		  Calendar calendar = new GregorianCalendar();
	      SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
	      
	      String chkDate = SDF.format(calendar.getTime());      
	      System.out.println("Today : " + (String)chkDate);
	      vo.setChkDate(chkDate);
	      
	      calendar.add(Calendar.DATE, -1);      
	      chkDate = SDF.format(calendar.getTime());
	      String yesterday = chkDate;
	      System.out.println("Yesterday : " + (String)yesterday);
	      
	      
	     
	      vo.setYesterday(yesterday);
	      vo.setMb_id(mb_id);
	      
		
		
	      
		List<classificationVO> applelistJy = Cmapper.appleListKind(vo);
		System.out.println("넌 가져오냐ㅏㅏㅏ가져오냐 vo"+vo);
		model.addAttribute("applelistJy", applelistJy);
		
		List<classificationVO> applelistMachine = Cmapper.applelistMachine(vo);
		model.addAttribute("applelistMachine", applelistMachine);
		
		
		
		List<classificationVO> applelistSummary = Cmapper.appleListSummary(vo);
		model.addAttribute("applelistSummary", applelistSummary);
		
		//////////////////////// 기간설정 
		if(cropdate != null) {
			
	
		String[] lee = cropdate.split("~");
		//System.out.println(lee[0].replaceAll("\\s+",""));
		//System.out.println(lee[1].replaceAll("\\s+",""));
		
		String startDay = lee[0].replaceAll("\\s+","");
		String endDay = lee[1].replaceAll("\\s+","");
		vo.setStartDay(startDay);
		vo.setEndDay(endDay);
		
		
		List<classificationVO> daterange = Cmapper.daterange(vo);
		model.addAttribute("daterange", daterange);
				
		
		System.out.println("기간 가져오니@@@@@@@@@@@@@@@@@@@@@@"+  cropdate);
		}else {
			
			Calendar calendar1 = new GregorianCalendar();
		      SimpleDateFormat SDF1 = new SimpleDateFormat("yyyy-MM-dd");
		      
		      String endDay = SDF1.format(calendar1.getTime());      
		      System.out.println("endDay : " + (String)endDay);
		      vo.setEndDay(endDay);
		      
		      calendar1.add(Calendar.DATE, -1);      
		      endDay = SDF1.format(calendar1.getTime());
		      String startDay = endDay;
		      System.out.println("startDay " + (String)startDay);
		      vo.setStartDay(startDay);
			  
		      System.out.println("else문 속 vo는 과연 무엇일까요 두구두구두구"+vo);
		      
		      List<classificationVO> daterange = Cmapper.daterange(vo);
			  model.addAttribute("daterange", daterange);
			
		}
		
		// 여기는 실시간을 위한 함수 부분 입니당~~~~~~~
		
		
		 LocalTime now = LocalTime.now();
		 
		 int hour = now.getHour();
		 
		 System.out.println(hour);
		
		 
		//실시간 VO를 가져옵니다
		
		List<chartVO> livedata = Cmapper.livedata(vo);
		model.addAttribute("livedata", livedata);
		
		
		
		
		return "data";
	}

//	@RequestMapping("sendDate.do")
//	public String sendDate(@Param(value = "mb_id") String mb_id,@Param(value ="cropdate") String cropdate, Model model, classificationVO cvo) {
//		
//		
//		String[] lee = cropdate.split("~");
//		//System.out.println(lee[0].replaceAll("\\s+",""));
//		
//		String startDay = lee[0].replaceAll("\\s+","");
//		String endDay = lee[1].replaceAll("\\s+","");
//		cvo.setStartDay(startDay);
//		cvo.setEndDay(endDay);
//		
//		List<classificationVO> daterange = Cmapper.daterange(cvo);
//		model.addAttribute("daterange", daterange);
//				
//		
//		System.out.println("기간 가져오니@@@@@@@@@@@@@@@@@@@@@@"+  cropdate);
//		
//		return "redirect:/data.do";
//	}
	
	@RequestMapping("myDevices.do")
	public String myDevices(@Param(value = "mb_id") String mb_id, Model model) {

		List<DeviceVO> list = Dmapper.deviceList(mb_id);
		System.out.println("값 가져오나요~~~~~~~" + mb_id);
		model.addAttribute("list", list);

		return "myDevices";
	}

	@RequestMapping("mychart.do")
	public String mychart(@Param(value = "mb_id") String mb_id, Model model) {

		List<classificationVO> applelist = Cmapper.appleList(mb_id);
		System.out.println("아이디 가져와짐?"+ mb_id);
		
		
		model.addAttribute("applelist", applelist);
		
		
		
		return "mychart";
	}

	@RequestMapping("admin.do")
	public String admin(Model model) {

		List<MemberVO> m_list = Mmapper.memberList();
		model.addAttribute("m_list", m_list);

		
		List<questionVO> q_list = Qmapper.QuestionList();
		model.addAttribute("q_list",q_list);
		
		
		List<answerVO> a_list = Amapper.AnswerList();
		model.addAttribute("a_list",a_list);

		return "admin";
	}

	@RequestMapping("insertQuestion.do")
	public String insertQuestion(questionVO qvo) {
		Qmapper.insertQuestion(qvo);

		return "redirect:/mainIndex.do";
	}

}
