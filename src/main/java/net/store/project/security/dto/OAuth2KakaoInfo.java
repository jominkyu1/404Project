package net.store.project.security.dto;


import java.util.Map;

public class OAuth2KakaoInfo implements OAuth2UserInfo{

    private final Map<String, Object> kakaoPropertiesAttributes;
    private final Map<String, Object> attributes;

    // 카카오의 attributes가 넘어오는 형식
    // {id=3103016601, connected_at=2023-10-18T07:55:07Z, properties={nickname=민규},
    // kakao_account={profile_nickname_needs_agreement=false, profile={nickname=민규}}}

    public OAuth2KakaoInfo(Map<String, Object> attributes){
        this.attributes = attributes;
        this.kakaoPropertiesAttributes = (Map<String, Object>) attributes.get("properties");
    }

    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getProviderId() {
        return attributes.get("id").toString();
    }

    @Override
    public String getEmail() {
        return "";
    }

    @Override
    public String getUsername() {
        return "K_" + kakaoPropertiesAttributes.get("nickname").toString();
    }

    @Override
    public String getMobile() {
        return "";
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
}
