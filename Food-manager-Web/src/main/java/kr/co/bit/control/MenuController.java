package kr.co.bit.control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.service.MenuService;
import kr.co.bit.util.Paging;
import kr.co.bit.vo.MenuVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	// <menu 컨트롤러>
	// menu 전체보기
	@RequestMapping("/menuAll.do")
	public ModelAndView listAll(HttpSession session) {
		List<MenuVO> menuList = menuService.selectAllMenu();		
		
		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("url", "menu/menuAll");
		
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("menu/menuList");
		//addObject : key와 value를 담아 보내는 메서드
		mav.addObject("menuList", menuList);
		
		return mav;		
	}	
	
	// menu 관리 게시판 전체보기
	@RequestMapping("/menuBoard.do")
	public ModelAndView listAll2(HttpSession session) {
		
		List<MenuVO> menuList2 = menuService.selectAllMenu();
		
		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("url", "menu/menuBoard");
		
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("menu/menuBoard");
		//addObject : key와 value를 담아 보내는 메서드
		mav.addObject("menuList2", menuList2);
		
		return mav;		
		
	}
	
	
	// 01. 게시글 목록
	@RequestMapping("/list.do")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage, HttpSession session) throws Exception{
	    // 이전 목록으로 이동
		session.setAttribute("url", "menu/list");
	    // 레코드의 갯수 계산
	    int count = menuService.countArticle();	    
	    // 페이지 나누기 관련 처리
	    Paging boardPager = new Paging(count, curPage);
	    int start = boardPager.getPageBegin();
	    int end = boardPager.getPageEnd();
	    
	    List<MenuVO> list = menuService.listAll(start, end);
	    
	    // 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("list", list); // list
	    map.put("count", count); // 레코드의 갯수
	    map.put("boardPager", boardPager);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("menu/menuList"); // 뷰를 list.jsp로 설정
	    mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
	    mav.addObject("menuList", list);
	    
	    return mav; // list.jsp로 List가 전달된다.
	}

	
	
	
	
	// menu 상세내용 조회
	// ex) menu/menuDetail.do?no=1
	@RequestMapping(value="/menuDetail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no, HttpSession session) {		
		
		MenuVO menuDetailVO = menuService.selectOneMenu(no);
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("menu/menuDetail");
		//addObject : key 와 value 를 담아 보내는 메서드 
		mav.addObject("menuDetailVO", menuDetailVO);
		
		return mav;
	}
	
	// menu 새 글쓰기 폼
	@RequestMapping(value="/menuRegister.do", method=RequestMethod.GET)
	public String writeForm(Model model) {		
		//Form에서 가져온 Data를 MenuVo 객체 형태로 저장
		MenuVO menuVO = new MenuVO();
		// 공유영역에 등록
		model.addAttribute("menuVO", menuVO);
		return "menu/menuRegForm";
	}	
	
	
	// menu 새 글쓰기
	@RequestMapping(value="/menuRegister.do", method=RequestMethod.POST)
	public String write(@Valid MenuVO menuVO, BindingResult result,
			@RequestParam(value="imgFileName") MultipartFile file)throws Exception {		
		
		//1. fileName 설정 + eventVO에 fileName 저장
		String fileName = "C:\\Users\\bit-user\\git\\Fooddiy-manager\\Food-manager-Web\\src\\main\\webapp\\upload\\menu\\"
				+ file.getOriginalFilename();
		String ufileName = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\menu\\"
				+ file.getOriginalFilename();
		String saveFileName = file.getOriginalFilename();
		
		menuVO.setImgFileName(saveFileName);
		
		System.out.println(fileName);
		System.out.println(saveFileName);
		
		//2. 경로에 이미지파일 저장
		byte[] bytes;
		bytes = file.getBytes();
		BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		buffStream.write(bytes);
		buffStream.close();
		//사용자 upload 폴더에 저장
		byte[] ubytes;
		ubytes = file.getBytes();
		BufferedOutputStream buffStream2 = new BufferedOutputStream(new FileOutputStream(new File(ufileName)));
		buffStream2.write(ubytes);
		buffStream2.close();		
		
		// menuVO에 저장 
		menuService.insertMenu(menuVO);
	
		return "redirect:/menu/menuBoard.do";
	}	
	
	// menu 수정폼
	@RequestMapping(value="/menuEditForm.do", method=RequestMethod.GET)
	public String modifyForm(@RequestParam("no") int no, Model model) {
		// 수정폼에 뿌려줄 기존 정보
		MenuVO menuVO = menuService.selectOneMenu(no);
		model.addAttribute("menuVO", menuVO);
		
		// 수정된 정보
		MenuVO menuEditedVO = new MenuVO();
		model.addAttribute("menuEditedVO", menuEditedVO);		
		
		return "menu/menuEditForm";
	}
	// menu 수정
	@RequestMapping(value="/menuEditForm.do", method=RequestMethod.POST)
	public String modify(@Valid MenuVO menuEditedVO, BindingResult result,
			@RequestParam(value="imgFileName") MultipartFile file)throws Exception {
		
		/*if(result.hasErrors()) {
			return "menu/menuEditForm";
		}*/
		
		//1. fileName 설정 + eventVO에 fileName 저장
		String fileName = "C:\\Users\\bit-user\\git\\Fooddiy-manager\\Food-manager-Web\\src\\main\\webapp\\upload\\menu\\"
				+ file.getOriginalFilename();
		String ufileName = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\menu\\"
				+ file.getOriginalFilename();
		String saveFileName = file.getOriginalFilename();
		
		menuEditedVO.setImgFileName(saveFileName);
		
		System.out.println(fileName);
		System.out.println(saveFileName);
		
		//2. 경로에 이미지파일 저장
		byte[] bytes;
		bytes = file.getBytes();
		BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
		buffStream.write(bytes);
		buffStream.close();
		//사용자 upload 폴더에 저장
		byte[] ubytes;
		ubytes = file.getBytes();
		BufferedOutputStream buffStream2 = new BufferedOutputStream(new FileOutputStream(new File(ufileName)));
		buffStream2.write(ubytes);
		buffStream2.close();
		
		menuService.modifyMenu(menuEditedVO);
		
		return "redirect:/menu/menuBoard.do";
	}
	
	
	// menu 삭제
	@RequestMapping(value="/menuDelete.do", method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no) {
		
		menuService.removeMenu(no);		
		
		return "redirect:/menu/menuBoard.do";
		
	}
	
	// menu 다중 삭제
	@RequestMapping(value="/menuDeleteSome.do", method=RequestMethod.GET)
	public String deleteSome(@RequestParam("nums") String nums ) {
		
		String[] array = nums.split(",");
		ArrayList<Integer> nList = new ArrayList<>();
		for(int i=0; i<array.length; i++) {
			if(!array[i].equals("")) {
				nList.add(new Integer(array[i]));
			}
		}		
		
		menuService.removeMenuSome(nList);
		
		return "redirect:/menu/menuBoard.do";
	}
	
	
}	

