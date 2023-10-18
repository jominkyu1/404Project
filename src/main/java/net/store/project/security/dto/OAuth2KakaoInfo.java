package net.store.project.security.dto;

import lombok.RequiredArgsConstructor;

import java.util.Map;

@RequiredArgsConstructor
public class OAuth2KakaoInfo implements OAuth2UserInfo{

    private final Map<String, Object> attributes;

    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getProviderId() {
        return null;
    }

    @Override
    public String getEmail() {
        return null;
    }

    @Override
    public String getUsername() {
        return null;
    }

    @Override
    public String getMobile() {
        return null;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return null;
    }
}
