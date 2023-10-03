package net.store.project.vo.user;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
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
    private Integer user_id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
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
    private UserGrade usergrade; //USER, ADMIN


    @Builder
    public UserVO(String username, String password, String email, String userphone, String address1,
                  String address2, String address_detail, Integer postcode) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.userphone = userphone;
        this.address1 = address1;
        this.address2 = address2;
        this.address_detail = address_detail;
        this.postcode = postcode;
    }
}
