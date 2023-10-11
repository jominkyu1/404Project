package net.store.project.security;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.store.project.vo.user.UserVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.List;

/**
 * 데이터베이스에서 관리하는 User객체를 Spring Security에게 넘겨 주기위해
 * UserDetails를 구현. 즉, UserVO -> UserDetails (시큐리티 전용 User객체)
 * */
@Slf4j
@Getter
public class StoreUserDetails extends User {
    private UserVO user;

    public StoreUserDetails(UserVO user){
        super(user.getUsername(), user.getPassword(), setAuthorities(user.getUsergrade().getValue()));
        this.user=user;
        //아이디 비밀번호 권한
        log.info("StoreUserDetails객체의 권한: {}", user.getUsergrade().getValue());
    }

    private static List<GrantedAuthority> setAuthorities(String usergrade) {
        List<GrantedAuthority> list = new ArrayList<>();

        // TODO 권한이 여러개로 늘어나게되면 반복문으로 리스트에 추가하면됨
        list.add(new SimpleGrantedAuthority(usergrade));

        return list;
    }

    public void updateUserDetails(UserVO userVO){
        this.user = userVO;
    }
}
