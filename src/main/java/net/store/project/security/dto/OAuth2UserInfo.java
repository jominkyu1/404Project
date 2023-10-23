package net.store.project.security.dto;

import java.util.Map;

public interface OAuth2UserInfo {

    String getProvider();
    String getProviderId();
    String getEmail();
    String getUsername();

    //Google, Kakao -> NULL
    String getMobile();

    Map<String, Object> getAttributes();
}
