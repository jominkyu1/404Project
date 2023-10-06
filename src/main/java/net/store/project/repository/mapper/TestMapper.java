package net.store.project.repository.mapper;

import net.store.project.vo.user.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestMapper {
    List<UserVO> findAllUsers();
}
