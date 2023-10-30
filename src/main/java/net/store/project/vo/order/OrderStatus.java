package net.store.project.vo.order;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum OrderStatus {
    ORDER("주문접수"),
    DELIVERY("배송중"),
    COMPLETE("배송완료"),
    CANCEL("주문취소");

    private final String value;
}
