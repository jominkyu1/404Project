package net.store.project.security.dto;

import lombok.RequiredArgsConstructor;

import java.util.Map;

@RequiredArgsConstructor
public class OAuth2GoogleInfo implements OAuth2UserInfo{

    private final Map<String, Object> attributes;

    @Override
    public String getProvider() {
        return "google";
    }

    @Override
    public String getProviderId() {
        return attributes.get("sub").toString();
    }

    @Override
    public String getEmail() {
        return attributes.get("email").toString();
    }

    @Override
    public String getUsername() {
        return "G_" + attributes.get("name").toString();
    }

    /**
     * GOOGLE은 전화번호 미제공
     */
    @Override
    public String getMobile() {
        return "";
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
}
