package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.CartRepository;
import net.store.project.repository.OrderItemRepository;
import net.store.project.repository.OrderRepository;
import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.order.OrderItemVO;
import net.store.project.vo.order.OrderStatus;
import net.store.project.vo.order.OrderVO;
import net.store.project.vo.user.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final CartItemRepository cartItemRepository;
    private final CartRepository cartRepository;
    private final OrderItemRepository orderItemRepository;
    private final OrderRepository orderRepository;

    /**
     * 주문처리 -> 장바구니주문처리
     * 장바구니에있는 아이템 조회(cart_id) -> 주문테이블에 저장 -> 장바구니에 있는 아이템 삭제
     * -> 아이템의 재고감소
     * */
    @Transactional
    public OrderVO orderItemByCartId(Long cart_id, String merchant_uid){
        CartVO cartVO = cartRepository.findById(cart_id).orElseThrow(() -> new IllegalArgumentException("해당 장바구니가 없습니다."));

        List<OrderItemVO> orderedItems = new ArrayList<>();
        //장바구니에 담긴 아이템들을 가져와 주문정보를 생성!
        List<CartItemVO> cartItems = cartItemRepository.findAllByCartVO(cartVO);
        for(CartItemVO cartItem : cartItems){
            ItemVO item = cartItem.getItemVO();
            int orderedQuantity = cartItem.getQuantity();

            //TODO 할인정책이 있다면 주문생성시 할인된 금액이 들어가면 됨!
            //createOrderItem내에 주문시 아이템의 재고가 감소하는 코드가 있음
            OrderItemVO orderedItem = OrderItemVO.createOrderItem(item, item.getPrice(), orderedQuantity);
            orderedItems.add(orderedItem);
        }

        UserVO orderedUser = cartVO.getUserVO();

        //실제 주문생성 후 주문객체 반환! merchant_uid는 카카오페이 진행시 필요한 고유주문번호
        OrderVO order = OrderVO.createOrder(orderedUser, merchant_uid, orderedItems);
        orderRepository.save(order);

        //카트에 담긴 아이템들 제거!
        cartItemRepository.deleteAll(cartItems);

        return order;
    }

    
    /**
     * 배송대기 -> 배송중으로 변경 후 송장번호 리턴
     * */
    @Transactional
    public String setToDelivery(Long order_id) {
        OrderVO order =
                orderRepository.findById(order_id).orElseThrow(() -> new IllegalArgumentException("존재하지 않는 주문입니다."));

        if(order.getStatus().equals(OrderStatus.ORDER)){
            order.setStatus(OrderStatus.DELIVERY);
        } else {
            throw new IllegalStateException("이미 배송 중 이거나 배송이 완료된 상품입니다!");
        }
        
        //랜덤 송장번호 생성
        String randomTrackingNumber = String.valueOf((int)(Math.random() * 1000000000));
        order.setTracking(randomTrackingNumber);

        return order.getTracking();
    }
}
