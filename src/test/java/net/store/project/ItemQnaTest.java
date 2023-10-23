package net.store.project;

import net.store.project.repository.ItemQnaRepository;
import net.store.project.vo.item.ItemQnaVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class ItemQnaTest {

    @Autowired
    ItemQnaRepository itemQnaRepository;

    @Test
    void 페이징처리(){
        Page<ItemQnaVO> all = itemQnaRepository.findAll(PageRequest.of(0, 10));
        System.out.println(all);

        long totalElements = all.getTotalElements();
        System.out.println("totalElements = " + totalElements);

        int totalPages = all.getTotalPages();
        System.out.println("totalPages = " + totalPages);
    }
}
