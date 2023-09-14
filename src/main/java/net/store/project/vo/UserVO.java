package net.store.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class UserVO {
    /*  테이블명: 404_USER
    *   PK: userid
    * */
    private String userid;
    private String password;
    private String username;
    private String userphone;
    private String address1;
    private String address2;
    private Timestamp regdate;
    private Timestamp moddate;
    private UserGrade usergrade;
}
