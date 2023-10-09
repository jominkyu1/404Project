package net.store.project.vo.user.form;

import lombok.*;
import net.store.project.vo.user.UserVO;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class UserRegisterForm {

    private String username;

    private String password;

    @Email(message = "이메일 형식이 아닙니다.")
    private String email;

    @Pattern(regexp = "[0-9]{10,11}", message = "올바른 전화번호 형식을 입력해주세요. ex)01012345678")
    private String userphone;

    private String address1;

    private String address2;

    @NotBlank(message = "상세주소를 입력해주세요.")
    private String address_detail;

    @NotNull(message = "우편번호를 입력해주세요.")
    private Integer postcode;

    private Timestamp regdate;
    private Timestamp moddate;

    public UserVO toEntity() {
        return UserVO.builder()
                    .username(username)
                    .password(password)
                    .email(email)
                    .userphone(userphone)
                    .address1(address1)
                    .address2(address2)
                    .address_detail(address_detail)
                    .postcode(postcode)
                    .build();
    }

    public static UserRegisterForm fromEntity(UserVO userVO){
        UserRegisterForm userRegisterForm = new UserRegisterForm();

        userRegisterForm.setUsername(userVO.getUsername());
        userRegisterForm.setPassword(userVO.getPassword());
        userRegisterForm.setEmail(userVO.getEmail());
        userRegisterForm.setUserphone(userVO.getUserphone());
        userRegisterForm.setAddress1(userVO.getAddress1());
        userRegisterForm.setAddress2(userVO.getAddress2());
        userRegisterForm.setAddress_detail(userVO.getAddress_detail());
        userRegisterForm.setPostcode(userVO.getPostcode());
        userRegisterForm.setRegdate(userVO.getRegdate());
        userRegisterForm.setModdate(userVO.getModdate());

        return userRegisterForm;
    }
}
