package com.hk.project.booking.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.project.booking.service.BookingService;
import com.hk.project.join.vo.BookingDateVO;
import com.hk.project.movie.service.MovieService;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.screendate.service.ScreenDateService;
import com.hk.project.screendate.vo.ScreenDateVO;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;
	@Autowired
	ScreenDateService screenDateService; 
	@Autowired
	MovieService movieService;
	
	@RequestMapping(value="/service/booking", method={RequestMethod.GET , RequestMethod.POST})
	public String bookingMain(Model model, String mid) {
		System.out.println(mid);
		
		List<MovieVO> movieVO = bookingService.bookingMovieList();
		model.addAttribute("movieVO",movieVO);
		
		if (mid != null) {
			model.addAttribute("selectedMid", mid);
		}
		
		System.out.println(movieVO.toString());
		return "booking";
	}
	
	
	
	@RequestMapping(value="/selectMid",method= { RequestMethod.GET , RequestMethod.POST },produces = "application/json; charset=utf8")	//http protocol
	@ResponseBody
	public List<BookingDateVO> chkMid(@RequestParam("mid") String mid) { 
		// jsp 화면을 줄필요가 없으므로. 
		// 사용자 유무만 확인해주면 된다.
		// 클라이언트->서버에 요청할때는 String으로 
		// 서버->클라이언트에 답변할때는 JSON으로
		System.out.println("mid = " + mid);
		
		//service에서 id가 중복인지 체크하는 모듈 (service dao member.xml )
		List<BookingDateVO> getMMDD = new ArrayList<BookingDateVO>();
		getMMDD = bookingService.getMMDD(mid); 
				
//		map.put("id","true"); // 중복이면 true, 아니면 false라는 String반환   
		return getMMDD;
	}
	
	@RequestMapping(value="/selectMMDD",method= { RequestMethod.GET , RequestMethod.POST },produces = "application/json; charset=utf8")	//http protocol
	@ResponseBody
	public List<BookingDateVO> chkMMDD(@RequestParam("mid") String mid,@RequestParam("yy") String yy,@RequestParam("mm") String mm,@RequestParam("dd") String dd) { 
		
		System.out.println("mid"+mid);
		System.out.println("yy"+yy);
		System.out.println("mm"+mm);
		System.out.println("dd"+dd);
		
		List<BookingDateVO> getHHMM = new ArrayList<BookingDateVO>();
		HashMap<String,Object> MMDDmap = new HashMap<String,Object>();
		MMDDmap.put("mid", mid);
		MMDDmap.put("yy", yy);
		MMDDmap.put("mm", mm);
		MMDDmap.put("dd", dd);
		getHHMM	=bookingService.getHHMM(MMDDmap);	
  
		return getHHMM;
	}
	
	@RequestMapping(value="/admin/booking/add", method=RequestMethod.GET)
	public String bookingAdd(Model model) {
		//movie 테이블에서 영화 선택할 수 있게 (mid, title list)
		List<MovieVO> movieVOList = bookingService.selectMovieList();
		model.addAttribute("movieVOList", movieVOList);
		
		int screenDateNo = bookingService.selectScreenDateNo();
		model.addAttribute("screenDateNo", screenDateNo);
		
		return "adminbookingAdd";
	}
	
	//상영시간 중복 확인
	@RequestMapping(value="/admin/booking/chkDate", method= {RequestMethod.POST, RequestMethod.GET},
							produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> chkDate(@RequestParam("screenNO") String screenNO,
										@RequestParam("date") String date,
										@RequestParam("time") String time) throws Exception {
		
		//param값을 vo에 넣기
		String dateSum = date+" "+time;
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date screenTime = fm.parse(dateSum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		ScreenDateVO chkDate = screenDateService.dupChk(screenNO,screenTime);
		if (chkDate == null) { // 중복X
			map.put("dup", "false");
		} else { // 중복O
			map.put("dup", "true");
		}
		return map;
	}
	
	@RequestMapping(value="/admin/booking/add", method=RequestMethod.POST)
	public String bookingAddDone(Model model, @ModelAttribute ScreenDateVO screenDateVO) throws Exception {
		
		Date screenTime = screenDateVO.getScreenTime();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String screenTime2 = fm.format(screenTime);
		System.out.println("----"+screenTime2);
		
		//string to date
		Date screenTime3 = fm.parse(screenTime2);
		
		screenDateVO.setScreenTime(screenTime3);
		
		int ret = screenDateService.insertScreenDate(screenDateVO);
		model.addAttribute("screenDateVO", screenDateVO);
		model.addAttribute("ret", ret);
		return "adminbookingAddDone";
	}
	
	@RequestMapping(value="/selectSeat",method= { RequestMethod.GET , RequestMethod.POST },produces = "application/json; charset=utf8")	//http protocol
	@ResponseBody
	public List<BookingDateVO> selectSeat(BookingDateVO bookingDateVO) { 
		List<BookingDateVO> getSeat = bookingService.getSeat(bookingDateVO);
		
		return getSeat;
	}
	
	@RequestMapping(value="/getAndShowMovieInfo",method= { RequestMethod.GET , RequestMethod.POST },produces = "application/json; charset=utf8")	//http protocol
	@ResponseBody
	public List<MovieVO> getAndShowMovieInfo(@RequestParam("mid") String mid) { 
		List<MovieVO> movieList = movieService.movieList(mid);
		
		return movieList;
	}
	
	@RequestMapping(value="/insertTicket",method= { RequestMethod.GET , RequestMethod.POST },produces = "application/json; charset=utf8")	//http protocol
	@ResponseBody
	public int insertTicket(BookingDateVO bookingDateVO) { 
		System.out.println(bookingDateVO);
		
		int ret = bookingService.insertTicket(bookingDateVO);
		return ret;
	}
}
