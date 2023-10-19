package net.store.project.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.CartRepository;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.repository.UserRepository;
import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.user.UserGrade;
import net.store.project.vo.user.UserVO;
import net.store.project.vo.user.form.UserRegisterForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;
    private final ItemQnaRepository itemQnaRepository;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;

    @Transactional
    public UserVO updateUser(Long id, UserRegisterForm userRegisterForm){
        UserVO userVO = userRepository.findById(id).orElseThrow(() -> new NoSuchElementException("해당 유저가 없습니다."));
        userVO.updateFromRegisterForm(userRegisterForm);

        return userVO;
    }

    @Transactional
    public void deleteUser(Long id){
        Optional<UserVO> user = userRepository.findById(id);
        if(user.isPresent()){
            //유저가 존재하는경우
            log.info("회원탈퇴 ::: {}", user.get().getUser_id());

            List<ItemQnaVO> itemQnaList = itemQnaRepository.findAllByUserId(id);
            CartVO cartVO = cartRepository.findByUserVO(user.get());
            List<CartItemVO> cartItems = cartItemRepository.findAllByCartVO(cartVO);


            //유저의 QNA제거
            itemQnaRepository.deleteAll(itemQnaList);
            //카트아이템제거
            cartItemRepository.deleteAll(cartItems);
            //카트제거
            cartRepository.delete(cartVO);
            //유저제거
            userRepository.delete(user.get());

        } else {
            throw new NoSuchElementException("해당 유저가 없습니다.");
        }
    }

    public long getAllCount(){
        return userRepository.count();
    }

    public long getNormalUsersCount(){
        return userRepository.countByUsergrade(UserGrade.USER);
    }

    public long getAdminUsersCount(){
        return userRepository.countByUsergrade(UserGrade.ADMIN);
    }
}
