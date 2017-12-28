package kr.co.bit.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.bit.vo.ManagerVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {  
		
		//spring-mvc.xml 에서 path를 확인하자~
		
		// 세션이 비어있는지 확인
        HttpSession session  = request.getSession(false);  
  
        if(session == null) {  
            response.sendRedirect(request.getContextPath()+"/sign/login");  
            return false;  
        }
        
        // 세션에 올려진 로그인 객체를 확인
        ManagerVO user = (ManagerVO)session.getAttribute("loginVO");        
  
        if (user == null) {        	
        	session.invalidate();
            response.sendRedirect(request.getContextPath()+"/sign/login");  
            
            return false;             
        }  
          
        return true;  
    }
}
