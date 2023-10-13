package net.store.project.repository;

import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.cart.form.UserCartForm;
import net.store.project.vo.item.ItemVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.persistence.Tuple;
import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItemVO, Long> {

    Optional<CartItemVO> findByItemVOAndCartVO(ItemVO itemVO, CartVO cartVO);

    @Query(value = "select new net.store.project.vo.cart.form.UserCartForm(i.price, ci.quantity, i.name, i.image_path, i.item_id) " +
                   "from CartItemVO ci join ItemVO i on ci.itemVO.item_id = i.item_id " +
                   "where ci.cartVO.cart_id = (select c.cart_id from CartVO c where c.userVO.user_id = :user_id)")
    List<UserCartForm> userCartList(Long user_id);

    //Optional<CartItemVO> findByCartVOCart_idAndItemVOItem_id(Long cart_id, Long item_id);
    
    //CartVO필드의 cart_id와 ItemVO필드의 item_id로 검색


    
}
