package net.store.project.repository;

import net.store.project.vo.order.OrderStatus;
import net.store.project.vo.order.OrderVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderVO, Long> {

    @Query("select o from OrderVO o join fetch o.user where o.user.user_id = :user_id")
    List<OrderVO> findAllByUser_Id(Long user_id);

    @Query("select o from OrderVO o where o.user.user_id = :user_id")
    Page<OrderVO> findAllByUser_Id(Long user_id, Pageable pageable);

    Page<OrderVO> findAllByStatus(Pageable pageable, OrderStatus status);

    @Query("select o from OrderVO o where o.user.user_id = :user_id and o.status = :status")
    Page<OrderVO> findAllByUser_IdAndStatus(Pageable pageable, Long user_id, OrderStatus status);

}
