package net.store.project.repository;

import net.store.project.vo.order.OrderVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderVO, Long> {

    @Query("select o from OrderVO o join fetch o.user where o.user.user_id = :user_id")
    List<OrderVO> findAllByUser_Id(Long user_id);
}
