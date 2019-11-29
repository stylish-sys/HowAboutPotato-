package spring.interceptor.webtest;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.utility.webtest.Utility;
 
public class AdminInterceptor extends HandlerInterceptorAdapter {
 
  // 요청 주소 결과 생성전에 작동함
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    HttpSession session = request.getSession(true);
    System.out.println("session.getAttribute(\"grade\"): " + session.getAttribute("grade"));
    System.out.println("preHandle executed.");
    System.out.println("URL: " + request.getContextPath());
    
    // 관리자 로그인시 "grade" 세션 변수 생성
    String grade = Utility.checkNull((String)session.getAttribute("grade"));
    
    if (grade.equals("A") == true ){ // 접근 가능, 요청 페이지 처리
      return true; // 요청 페이지로 계속 진행
    } else{
      // 에러 출력또는 로그인 페이지로 이동
      response.sendRedirect(request.getContextPath() + "/member/login");
      return false;
    }
  }
 
  // 요청 주소 결과 생성후 작동함
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    System.out.println("postHandle executed.");
    modelAndView.addObject("admin", "관리자 관련 기능을 출력합니다.");
 
  }
 
  // JSP등 View 페이지 출력전에 작동됨.
  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
      throws Exception {
    System.out.println("afterCompletion executed.");
 
  }
  
}