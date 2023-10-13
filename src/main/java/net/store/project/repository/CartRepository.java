package net.store.project.repository;

import net.store.project.vo.cart.CartVO;
import net.store.project.vo.user.UserVO;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CartRepository extends JpaRepository<CartVO, Long> {

    CartVO findByUserVO(UserVO userVO);
}
