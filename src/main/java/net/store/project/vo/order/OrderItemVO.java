package net.store.project.vo.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.store.project.vo.item.ItemVO;

import javax.persistence.*;


/**
 * 한 주문당 어떤 상품들을 주문했는지 담는 테이블(가격, 수량 포함)
 * */
@Getter
@Setter
//@ToString
@Entity
@Table(name = "order_items")
public class OrderItemVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long order_item_id;

    @ManyToOne(fetch = FetchType.LAZY) //Order의 PK를 FK로 가짐
    @JoinColumn(name = "order_id")
    private OrderVO order;

    @ManyToOne(fetch = FetchType.LAZY) //주문한 아이템
    @JoinColumn(name = "item_id")
    private ItemVO itemVO;

    private int quantity; //수량
    private int price; //가격

    /**
     * 주문생성 편의 메소드
     * */
    public static OrderItemVO createOrderItem(ItemVO itemVO, int orderPrice, int count){
        OrderItemVO orderItemVO = new OrderItemVO();
        orderItemVO.setItemVO(itemVO);
        orderItemVO.setPrice(orderPrice);
        orderItemVO.setQuantity(count);

        itemVO.removeStock(count); //주문한 만큼 재고 감소
        return orderItemVO;
    }

}
