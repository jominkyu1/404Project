package net.store.project.vo.user;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum UserGrade {
    USER("ROLE_USER"),
    ADMIN("ROLE_ADMIN");

    private final String value;
}