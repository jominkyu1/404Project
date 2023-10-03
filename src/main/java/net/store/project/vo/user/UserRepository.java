package net.store.project.vo.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserVO, Integer> {

    //유저아이디로 유저정보 가져오기
    Optional<UserVO> findByUsername(String username);
}
