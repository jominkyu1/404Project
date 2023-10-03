package net.store.project.vo.user.form;

import lombok.*;
import net.store.project.vo.user.UserVO;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
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
}
