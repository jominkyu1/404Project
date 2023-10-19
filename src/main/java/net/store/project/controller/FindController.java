package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.service.FindService;
import net.store.project.vo.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Random;

@Controller
@RequestMapping("/find")
@RequiredArgsConstructor
@Slf4j
public class FindController {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    private FindService findService;

    //비번찾기 공지창
    @RequestMapping("/pwd_find")
    public ModelAndView pwd_find() {
        return new ModelAndView("user/pwd_find");
        //생성자 인자값으로 뷰페이지 경로 설정
        // /WEB-INF/views/member/pwd_find.jsp
    }//pwd_find.jsp

    //비번찾기 결과
    @RequestMapping("pwd_find_ok")
    public ModelAndView pwd_find_ok(@RequestParam("pwdId") String pwdId,
                                    String pwdEmail, HttpServletResponse response, UserVO uservo)
            throws Exception{
        /* @RequestMapping("pwd_find_ok") = request.getParameter("pwd_id") 같은역할
         */

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        uservo.setUsername(pwdId); uservo.setEmail(pwdEmail);
        UserVO user = findService.findByUsername(uservo);
//        boolean result = user.getEmail.equals(pwdEmail);

//        m.setMem_id(pwd_id); m.setMem_name(pwd_email);
//        MemberVO pm = this.UserService.pwdMember(m);


        /* 문제)
         * 아이디와 회원이름 기준 회원정보를 오라클로부터 검색하는 pwdMember()메서드 작성
         * member.xml에 설정하는 유일 아이디명; p_find
         *
         */
        if(user == null) {
            out.println("<script>");
            out.println("alert('회원으로 검색되지 않습니다!\\n 올바른 회원정보를 입력하세요!');");
            out.println("history.go(-1)");
            out.println("</script>");
        }else {
//			System.out.println("오라클로부터 검색된 회원 : " + pm.getMem_name());

            Random r = new Random();
            int pwd_random = r.nextInt(100000);//0이상 십만 미만 사이의 정수 숫자 난수 발생
            String ran_pwd = Integer.toString(pwd_random); //정수 숫자를 문자열로 변경



//            m.setMem_pwd.passwordEncoder(); //임시비번 암호화
//            this.FindService.updatePwd(m); //암호화 된 임시비번으로 수정


           // String rawPassword = "userPassword";
            String encodedPassword = passwordEncoder.encode(ran_pwd); //비번 암호화
            uservo.setPassword(encodedPassword);
            this.findService.updatePwd(uservo);//id기준 암호화된 비번 수젇



            ModelAndView fm = new ModelAndView("user/pwd_find_ok");
            fm.addObject("pwd_ran", ran_pwd);

            return fm;
        }
        return null;
    }//pwd_find_ok()

}
