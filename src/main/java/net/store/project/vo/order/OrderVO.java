package net.store.project.vo.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.store.project.vo.user.UserVO;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 모든 유저가 주문한 상품들을 담는 테이블
 * 유저가 주문한 주문들의 날짜와 주문상태, 주문한 유저의 id, 주문한 상품의 id만 담겨있음
 * 주문한 상품들의 자세한 정보는 OrderItemVO Entity에 있음
 */
@Getter
@Setter
//@ToString
@Entity
@SequenceGenerator(
        name="orders_seq_gename",
        sequenceName="orders_seq",
        initialValue=1,
        allocationSize=1
)
@Table(name = "orders")
public class OrderVO {

    @Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="orders_seq_gename"
    )
    private Long order_id;

    @CreationTimestamp //주문날짜
    private Timestamp order_date;

    @Enumerated(EnumType.STRING) //주문현황 ORDER, DELIVERY, COMPLETE, CANCEL
    private OrderStatus status;

    @ManyToOne(fetch = FetchType.LAZY) // 주문한 유저정보
    @JoinColumn(name = "user_id") // FK키 컬럼 이름
    private UserVO user;

    //주문한 아이템들의 정보
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderItemVO> orderItems = new ArrayList<>();

    private String merchant_uid; //카카오페이결제시 필요한 주문번호

    private String tracking; //배송조회번호

    /**
     * 주문생성 편의 메소드
     * */
    public static OrderVO createOrder(UserVO userVO, String merchant_uid, List<OrderItemVO> orderItems){
        OrderVO orderVO = new OrderVO();
        orderVO.setUser(userVO);
        orderVO.setMerchant_uid(merchant_uid);


        for(OrderItemVO orderItemVO : orderItems) {
            orderVO.addOrderItem(orderItemVO);
        }

        orderVO.setStatus(OrderStatus.ORDER);
        return orderVO;
    }

    private void addOrderItem(OrderItemVO orderItemVO){
        orderItems.add(orderItemVO);
        orderItemVO.setOrder(this);
    }

}
