package com.hk.project.booking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.project.booking.service.BookingService;
import com.hk.project.join.vo.BookingDateVO;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.screendate.service.ScreenDateService;
import com.hk.project.screendate.vo.ScreenDateVO;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;
	@Autowired
	ScreenDateService screenDateService; 
	
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
	
	@RequestMapping(value="/admin/booking/add", method=RequestMethod.POST)
	public String bookingAddDone(Model model, @ModelAttribute ScreenDateVO screenDateVO) {
		
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
}
