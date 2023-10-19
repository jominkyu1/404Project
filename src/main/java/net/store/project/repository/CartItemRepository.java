package net.store.project.repository;

import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.cart.form.UserCartForm;
import net.store.project.vo.item.ItemVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItemVO, Long> {

    //카트아이디로 장바구니에 담긴 아이템들의 갯수를 찾아서 리턴해줌
    @Query("select count(ci) from CartItemVO ci " +
           "where ci.cartVO.cart_id = :cart_id")
    Integer countByCartId(Long cart_id);

    //ItemVO 객체와 CartVO 객체로 CartItemVO 찾기
    Optional<CartItemVO> findByItemVOAndCartVO(ItemVO itemVO, CartVO cartVO);

    //유저아이디(PK)로 유저가 담은 아이템들을 찾아서 DTO(Form객체)에 담아서 리턴함
    @Query(value = "select new net.store.project.vo.cart.form.UserCartForm(i.price, ci.quantity, i.name, i.image_path, i.item_id) " +
                   "from CartItemVO ci join ItemVO i on ci.itemVO.item_id = i.item_id " +
                   "where ci.cartVO.cart_id = (select c.cart_id from CartVO c where c.userVO.user_id = :user_id)")
    List<UserCartForm> userCartList(Long user_id);

    //카트아이디와 유저아이디로 장바구니에 담은 아이템테이블을 찾아서 리턴해줌.
    @Query("select ci from CartItemVO ci " +
           "where ci.cartVO.cart_id = :cart_id and ci.itemVO.item_id = :item_id")
    Optional<CartItemVO> findCartItemVOByCartIdAndItemId(Long cart_id, Long item_id);

    
    //카트아이디를 받아와 장바구니에 담은 전체 아이템들의 총 가격을 받아옴
    @Query("select sum(ci.quantity * i.price) from CartItemVO ci join ItemVO i on ci.itemVO.item_id = i.item_id " +
           "where ci.cartVO.cart_id = :cartId")
    Long findTotalOrderedPriceByCartId(Long cartId);


    //카트아이디와 아이템아이디를 기준으로 장바구니에 담긴 아이템 제거
    @Modifying //DELETE, UPDATE @Query를 실행하기 위해 필요한 어노테이션
    @Query("delete from CartItemVO ci " +
           "where ci.cartVO.cart_id = :cartId and ci.itemVO.item_id = :itemId")
    void deleteCartItemFromCartIdAndItemId(Long cartId, Long itemId);

    List<CartItemVO> findAllByCartVO(CartVO cartVO);
}
