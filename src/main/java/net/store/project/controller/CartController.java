package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.CartRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.CartService;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.cart.form.UserCartForm;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserVO;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.Tuple;
import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final CartItemRepository cartItemRepository;
    private final CartRepository cartRepository;
    private final ItemRepository itemRepository;

    @GetMapping
    public String cart(@AuthenticationPrincipal StoreUserDetails storeUserDetails,
                       Model model){
        if(storeUserDetails==null){
            return "redirect:/login";
        }

        CartVO cartVO = cartRepository.findByUserVO(storeUserDetails.getUser());
        if(cartVO==null){
            return "redirect:/";
        } else {
            model.addAttribute("cart_id", cartVO.getCart_id());
        }

        //유저가 장바구니에 담은 아이템들을 모델에 담아서 보냄
        List<UserCartForm> userCartForms = cartItemRepository.userCartList(storeUserDetails.getUser().getUser_id());
        model.addAttribute("cartItems", userCartForms);

        return "wishlist";
    }

    @GetMapping("/add/{item_id}")
    public String addCart(@PathVariable Long item_id,
                          @RequestParam int quantity,
                          @AuthenticationPrincipal StoreUserDetails storeUserDetails){
        if(storeUserDetails == null) return "redirect:/login";
        //아이템번호(PK), 유저번호(PK), 아이템수량을 받아서 카트에 추가
        Long cart_id = cartService.addCart(item_id, storeUserDetails.getUser().getUser_id(), quantity);

        return "redirect:/cart";
    }
}
