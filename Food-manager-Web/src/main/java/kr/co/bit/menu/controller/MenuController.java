package kr.co.bit.menu.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

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

import kr.co.bit.menu.service.MenuService;
import kr.co.bit.menu.vo.MenuVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	// <menu 컨트롤러>
	// menu 전체보기
	@RequestMapping("/menuAll.do")
	public ModelAndView listAll() {
		
		List<MenuVO> menuList = menuService.selectAllMenu();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("menu/menuList");
		//addObject : key와 value를 담아 보내는 메서드
		mav.addObject("menuList", menuList);
		
		return mav;		
	}
	
	@RequestMapping("/menuBoard.do")
	public ModelAndView listAll2() {
		
		List<MenuVO> menuList = menuService.selectAllMenu();
		
		ModelAndView mav = new ModelAndView();
		//setViewName : 어떤 페이지를 보여줄것인가
		mav.setViewName("menu/menuBoard");
		//addObject : key와 value를 담아 보내는 메서드
		mav.addObject("menuList", menuList);
		
		return mav;		
		
	}
	
	// menu 새 글쓰기 폼
	@RequestMapping(value="/menuWrite.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		// Form에서 가져온 Data를 MenuVO 객체형태로 저장
		MenuVO menuVO = new MenuVO();
		// 공유영역에 등록
		model.addAttribute("menuVO", menuVO);
		return "menu/menuWriteForm";
	}	
	
	// menu 새 글쓰기
	@RequestMapping(value="/menuWrite.do", method=RequestMethod.POST)
	public String write(@Valid MenuVO menuVO
						, BindingResult result
						, @RequestParam(value="imgFileName") MultipartFile file
	)throws Exception {	
		
		System.out.println("시작");
		
					//1. fileName 설정 + eventVO에 fileName 저장
					String fileName = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload\\menu\\" + file.getOriginalFilename();
					String saveFileName = file.getOriginalFilename();
					
					menuVO.setImgFileName(saveFileName);
					
					System.out.println(fileName);
					System.out.println(saveFileName);
					System.out.println("들어갔나염?");
					
					//2. 경로에 이미지파일 저장
					byte[] bytes;
					bytes = file.getBytes();
					BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
					buffStream.write(bytes);
					buffStream.close();
					
					System.out.println("들어가나염2?");					
					
					menuService.insertMenu(menuVO);
	
		// menuVO에 저장 
		return "redirect:/menu/menuAll.do";
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
	
	
	
/*	// '주문하기'선택 후 매장화면으로	
	@RequestMapping(value="/findStore.do", method=RequestMethod.POST)
	public String Session(HttpSession session, String name, String price, String size, String pic) {
		
		UserVO user = (UserVO)session.getAttribute("loginVO");		
		String id = user.getId();
		
		// Form에서 가져온 Data를 CartVO 객체형태로 저장
		CartVO cartVO = new CartVO();
		
		cartVO.setName(name);
		cartVO.setPrice(price);
		cartVO.setSize(size);
		cartVO.setPic(pic);
		cartVO.setId(id);
	
		System.out.println(cartVO);
		
		
        StoreVO storeVO = (StoreVO)session.getAttribute("storeVO");
        if (storeVO == null) {  
        	return "/store/findStore";
        }
        else {
        	return "/menu/select_ingredients";
        }
		
		//ModelAndView  mav = new ModelAndView();
		//mav.setViewName("menu/select_ingredients");
		//mav.addObject("cartVO", cartVO);
		
		
		// return cartVO;				
	}
	
*/
	
	
}	

