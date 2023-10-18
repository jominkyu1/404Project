package net.store.project.vo.user;

import lombok.*;
import net.store.project.vo.user.form.UserRegisterForm;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@ToString
@Table(name = "users")
@SequenceGenerator(
        name="users_seq_gename",
        sequenceName="users_seq",
        initialValue=1,
        allocationSize=1
)
@Entity
public class UserVO {
    @Id @GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="users_seq_gename"
    )
    private Long user_id; //PK

    @Column(nullable = false, unique = true)
    private String username; //login id

    private String password;

    private String email;

    private String userphone;

    private String address1;

    private String address2;

    private String address_detail;

    private Integer postcode;

    @CreationTimestamp
    private Timestamp regdate;

    @UpdateTimestamp
    private Timestamp moddate;

    @Enumerated(value = EnumType.STRING)
    @Column(nullable = false)
    @ColumnDefault("'USER'")
    private UserGrade usergrade; //USER, ADMIN

    /**
     * OAuth 2.0
     * provider = "google", "kakao", "naver"
     * providerId = google:sub값, kakao:id값, naver:response의 id값
     * */
    private String provider;

    @Column(name = "provider_id")
    private String providerId;

    @Builder
    public UserVO(String username, String password, String email, String userphone, String address1,
                  String address2, String address_detail, Integer postcode, String provider, String providerId) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.userphone = userphone;
        this.address1 = address1;
        this.address2 = address2;
        this.address_detail = address_detail;
        this.postcode = postcode;
        this.usergrade = UserGrade.USER;
        this.provider = provider;
        this.providerId = providerId;
    }
    
    /**
     * 정보수정 메소드
     * UserRegisterForm을 받아서 해당 정보로 수정
     * */
    public Long updateFromRegisterForm(UserRegisterForm form){
        this.username = form.getUsername();
        this.password = form.getPassword();
        this.email = form.getEmail();
        this.userphone = form.getUserphone();
        this.address1 = form.getAddress1();
        this.address2 = form.getAddress2();
        this.address_detail = form.getAddress_detail();
        this.postcode = form.getPostcode();
        return this.user_id;
    }
}
