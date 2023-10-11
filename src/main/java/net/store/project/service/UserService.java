package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.UserRepository;
import net.store.project.vo.user.UserGrade;
import net.store.project.vo.user.UserVO;
import net.store.project.vo.user.form.UserRegisterForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    @Transactional
    public UserVO updateUser(Long id, UserRegisterForm userRegisterForm){
        UserVO userVO = userRepository.findById(id).orElseThrow(() -> new NoSuchElementException("해당 유저가 없습니다."));
        userVO.updateFromRegisterForm(userRegisterForm);

        return userVO;
    }

    public long getAllCount(){
        return userRepository.count();
    }

    public long getNormalUsersCount(){
        return userRepository.countByUsergrade(UserGrade.USER);
    }

    public long getAdminUsersCount(){
        return userRepository.countByUsergrade(UserGrade.ADMIN);
    }
}
