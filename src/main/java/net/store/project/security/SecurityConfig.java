package net.store.project.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Slf4j
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final StoreUserDetailsService storeUserDetailsService;
    private final StoreLoginFailureHandler storeLoginFailureHandler;
    //OAuth2.0 서비스
    private final StoreOauth2UserService storeOauth2UserService;

    //password Encoder
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); //BCrypt 암호화
    }
    
    @Override
    public void configure(WebSecurity web) throws Exception {
        //static 디렉터리의 하위 파일 목록은 인증 무시(=항상통과)
        web.ignoring().antMatchers("/css/**", "/script/**",
                "/images/**", "/**.ico", "/error/**", "/js/**");
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests() //URL별 권한 관리를 설정하는 옵션의 시작점
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/user/**").hasAnyRole("USER", "ADMIN")
                .anyRequest().permitAll() //그 외 URL에 대한 접근을 허용
                .and()

                .formLogin()
                .loginPage("/login") //로그인 페이지 링크
                .usernameParameter("username") //로그인 페이지의 아이디 name속성명
                .passwordParameter("password") //로그인 페이지의 비밀번호 name속성명
                .defaultSuccessUrl("/") //로그인 성공 후 리다이렉트 주소
                .failureHandler(storeLoginFailureHandler) //로그인 실패시 핸들러
                .and()

                .logout()
                .logoutUrl("/logout") //로그아웃 처리 URL
                .logoutSuccessUrl("/") //로그아웃 성공시 리다이렉트 주소
                .invalidateHttpSession(true) //로그아웃시 세션제거
                .and()

                .oauth2Login()
                .loginPage("/login")
                .userInfoEndpoint()
                .userService(storeOauth2UserService)
        ;
        
        //remember me
        http.rememberMe()
                .rememberMeParameter("remember-me") //기본 파라미터명 remember-me
                .tokenValiditySeconds(60*60*24*7) //토큰 유효기간 60초*60분*24시간*7일 = 7일
                .userDetailsService(storeUserDetailsService); //유저정보를 가져오는 서비스 클래스

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        // userVO -> userDetails로 변환 후 시큐리티에서 관리하는 유저객체로 할당
        auth.userDetailsService(storeUserDetailsService);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        //AuthenticationManager를 Bean으로 등록 (정보 수정시 필요)
        return super.authenticationManagerBean();
    }
}
