package net.store.project.repository;

import net.store.project.vo.user.UserGrade;
import net.store.project.vo.user.UserVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UserVO, Long> {

    //유저아이디로 유저정보 가져오기
    Optional<UserVO> findByUsername(String username);
    Page<UserVO> findByUsernameLike(String username, Pageable pageable);

    //유저 등급에 따른 회원수
    Long countByUsergrade(UserGrade userGrade);

    //OAuth2.0 providerId로 유저정보 가져오기
    Optional<UserVO> findByProviderId(String providerId);
}
