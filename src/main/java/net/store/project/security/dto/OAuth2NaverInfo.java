package net.store.project.security.dto;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.Map;

@RequiredArgsConstructor
@ToString
public class OAuth2NaverInfo implements OAuth2UserInfo{

    private final Map <String, Object> attributes;

    @Override
    public String getProvider() {
        return "naver";
    }

    @Override
    public String getProviderId() {
        return attributes.get("id").toString();
    }

    @Override
    public String getEmail() {
        return attributes.get("email").toString();
    }

    @Override
    public String getUsername() {
        return "N_" + attributes.get("nickname").toString();
    }

    @Override
    public String getMobile() {
        return attributes.get("mobile").toString().replace("-", "");
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
}
