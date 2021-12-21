package com.hk.project.movie.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.project.movie.service.MovieService;
import com.hk.project.movie.vo.MovieVO;
import com.hk.project.review.service.ReviewService;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;
	@Autowired
	ReviewService reviewService;
	
	
	@RequestMapping(value="/movie/list", method={RequestMethod.GET , RequestMethod.POST})
	public String movieList(Model model) {
		List<List<MovieVO>> movieVO2DList =  movieService.selectAllMovies();
		model.addAttribute("movieVO2DList", movieVO2DList);
		return "movieList";
	}
	@RequestMapping(value="/movie/detail", method={RequestMethod.GET , RequestMethod.POST})
	public String movieDetail(Model model,@RequestParam("MID") String mid,@ModelAttribute MovieVO movieVO) {
		System.out.println(mid);
		
		Map<String,Object> map = movieService.detail(mid);
		model.addAttribute("movieVO", map.get("movieVO"));
		model.addAttribute("reviewVO", map.get("reviewVO"));
		System.out.println(map.toString());
		
		
		return "movieDetail";
	}
	
	@RequestMapping(value="/admin/list", method={RequestMethod.GET , RequestMethod.POST})
	public String adminMovieList(Model model) {
		List<List<MovieVO>> movieVO2DList =  movieService.selectAllMovies();
		model.addAttribute("movieVO2DList", movieVO2DList);
		
		return "adminMovieList";
	}
	@RequestMapping(value="/admin/movie/add", method={RequestMethod.GET})
	public String adminMovieAdd(Model model) {
		int mid = movieService.selectMid();
		model.addAttribute("mid", mid);
		
		return "adminMovieAdd";
	}
	
//	@RequestMapping(value="/admin/movie/add", method={RequestMethod.POST})
//	public String adminMovieAddDone(Model model,@ModelAttribute MovieVO movieVO) {
//		int ret = movieService.addMovie(movieVO);
//		model.addAttribute("ret", ret);
//		
//		return "adminMovieAddDone";
//	}
	
	private static String POSTER_IMAGE_REPO = "c:\\poster_image";
	
	@RequestMapping(value="/admin/movie/add", method={RequestMethod.POST})
	public String adminMovieAddDone2(Model model, @ModelAttribute MovieVO movieVO, @RequestParam("poster") MultipartFile poster ) throws Exception {
		
		String posterName = null;
		poster = movieVO.getPoster();
		String mid = movieVO.getMid();
		if (!poster.isEmpty()) {
			posterName = poster.getOriginalFilename();
			poster.transferTo(new File(POSTER_IMAGE_REPO +"\\temp\\"+ posterName));
			File srcFile = new File(POSTER_IMAGE_REPO +"\\temp\\"+ posterName);
			File destDir = new File(POSTER_IMAGE_REPO + "\\" + mid);
			destDir.mkdirs();      //c:\\board\\article_image\\articleNO
			//temp 폴더의 파일을 글번호를 이름으로 하는 폴더로 이동시킴
			
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
			
			movieVO.setPosterName(posterName);
		}
		
		int ret = movieService.addMovie(movieVO);
		model.addAttribute("ret", ret);
		return "adminMovieAddDone";
	}
	
	@RequestMapping(value="/admin/detail", method={RequestMethod.GET , RequestMethod.POST})
	public String adminMovieDetail(Model model,@RequestParam("MID") String mid,@ModelAttribute MovieVO movieVO) {
		System.out.println(mid);
		
		Map<String,Object> map = movieService.detail(mid);
		model.addAttribute("movieVO", map.get("movieVO"));
		model.addAttribute("reviewVO", map.get("reviewVO"));
		System.out.println(map.toString());
		
		
		return "adminMovieDetail";
	}
	@RequestMapping(value="/admin/update", method={RequestMethod.GET})
	public String adminMovieUpdate(Model model,@ModelAttribute MovieVO movieVO) {

		Map<String, Object> map = movieService.detail(movieVO.getMid());//movieVO,reviewVO
		
		MultipartFile poster = movieVO.getPoster();
		movieVO.setPoster(poster); 
		
		model.addAttribute("movieVO", map.get("movieVO"));	
		model.addAttribute("poster", poster);
		
		return "adminMovieUpdate";
	}
	
	@RequestMapping(value="/admin/update", method={RequestMethod.POST})
	public String adminMovieUpdateDone(Model model,@ModelAttribute MovieVO movieVO,@RequestParam("originalFileName") String originalFileName, @RequestParam("poster") MultipartFile poster) throws Exception {
		
		String mid = movieVO.getMid();
		String posterName = "";
		if (!poster.isEmpty()) { //새로운 파일이 있으면 
			//새로운 파일 저장
			posterName = poster.getOriginalFilename();
			poster.transferTo(new File(POSTER_IMAGE_REPO +"\\temp\\"+ posterName));
			File srcFile = new File(POSTER_IMAGE_REPO +"\\temp\\"+ posterName);
			File destDir = new File(POSTER_IMAGE_REPO + "\\" + mid);
			destDir.mkdirs();      //c:\\board\\article_image\\articleNO
			//temp 폴더의 파일을 글번호를 이름으로 하는 폴더로 이동시킴
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
			
			//기존 파일 삭제
			File oldFile = new File(POSTER_IMAGE_REPO+"\\"+mid+"\\"+originalFileName);
			oldFile.delete();
			
			movieVO.setPosterName(posterName);
		} else { //새로운 파일이 없으면
			//
			movieVO.setPosterName(originalFileName);
		}
		
		int ret=movieService.updateMovie(movieVO);
		model.addAttribute("ret", ret);
		model.addAttribute("movieVO", movieVO);
		return "adminMovieUpdateDone";
	}
	
	@RequestMapping(value="/admin/delete", method={RequestMethod.POST})
	public String adminMovieDelete(Model model,@ModelAttribute MovieVO movieVO) {
		System.out.println("무비 딜리트"+movieVO);
		
		int ret = movieService.deleteMovie(movieVO);
		model.addAttribute("ret", ret);
		return "adminDelete";
	}
	
	@RequestMapping(value="/dupMid",method= { RequestMethod.GET , RequestMethod.POST },produces = "application/json; charset=utf8")	//http protocol
	public Map<String, Object> dupMid(@RequestParam("mid")String mid) { 
		// jsp 화면을 줄필요가 없으므로. 
		// 사용자 유무만 확인해주면 된다.
		// 클라이언트->서버에 요청할때는 String으로 
		// 서버->클라이언트에 답변할때는 JSON으로
		System.out.println("mid = " + mid);
		Map<String, Object> map = new HashMap<String, Object>();
		//service에서 id가 중복인지 체크하는 모듈 (service dao member.xml )
		MovieVO dupMid = movieService.dupMid(mid);
		
		if(dupMid==null) {
			map.put("id", "false");
		}else {
			map.put("id","true"); // 중복이면 true, 아니면 false라는 String반환

		}
//		map.put("id","true"); // 중복이면 true, 아니면 false라는 String반환   
		return map;
	}
}