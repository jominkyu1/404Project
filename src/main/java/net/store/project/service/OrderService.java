package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;

    @Transactional
    public void orderItem(Long id){

    }
}
