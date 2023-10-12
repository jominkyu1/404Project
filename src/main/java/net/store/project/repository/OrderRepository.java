package net.store.project.repository;

import net.store.project.vo.order.OrderVO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<OrderVO, Long> {
}
