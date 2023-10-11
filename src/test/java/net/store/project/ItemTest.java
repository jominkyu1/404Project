package net.store.project;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.repository.UserRepository;
import net.store.project.service.ItemQnaService;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserGrade;
import net.store.project.vo.user.UserVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@SpringBootTest
@Transactional
public class ItemTest {

    @Autowired
    private ItemRepository itemRepository;
    @Autowired
    private ItemQnaRepository itemQnaRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private ItemQnaService itemQnaService;

    @Test
    @Rollback(value = false)
    void 상품등록() {
        UserVO user = createUser();
       // user.setUsergrade(UserGrade.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);

        ItemVO item = ItemVO.builder()
                .stockQuantity(10)
                .price(10000)
                .description("상품설명")
                .name("상품명")
                .image_path("20231011/ad348154-d49f-4fcb-bca6-55a04aa51b60.jpg")
                .build();

        itemRepository.save(item);
        System.out.println("----- 저장된 상품 -----");
        itemRepository.findById(1L).ifPresent(System.out::println);

        ItemQnaVO itemQnaVO = new ItemQnaVO();
        itemQnaVO.setItemVO(item);
        itemQnaVO.setUserVO(user);
        itemQnaVO.setContents("테스트내용");


        System.out.println("----- 저장된 QnA -----");
        // QNA가 저장되면 ItemVO의 qna_count가 1증가
        itemQnaService.applyQna(itemQnaVO);

        System.out.println("----- 저장된 상품 다시 조회 -----");
        System.out.println(itemRepository.findById(itemQnaVO.getItemVO().getItem_id()).get());

    }


    private static UserVO createUser() {
        return UserVO.builder()
                .postcode(12345)
                .username("테스트이름")
                .password("1234")
                .address_detail("detail")
                .address1("address1")
                .address2("address2")
                .userphone("01012341234")
                .email("test@test.com")
                .build();
    }
}
