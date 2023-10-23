package net.store.project.repository;

import net.store.project.vo.order.OrderItemVO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItemVO, Long> {
}
