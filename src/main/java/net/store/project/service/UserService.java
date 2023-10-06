package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.UserRepository;
import net.store.project.vo.user.UserGrade;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

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
