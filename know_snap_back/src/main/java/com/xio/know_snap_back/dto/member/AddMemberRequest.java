package com.xio.know_snap_back.dto.member;

import com.xio.know_snap_back.domain.Category;
import com.xio.know_snap_back.domain.Member;
import com.xio.know_snap_back.domain.Status;
import com.xio.know_snap_back.domain.auth.Authority;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Set;

@Getter
@Setter
@Builder
public class AddMemberRequest {
    private String username;
    private String password;
    private String nickname;
    private String phone;
    private String category;

    public Member toMember(PasswordEncoder passwordEncoder, Set<Authority> authorities,
                           Category category){
        return Member.builder()
                .username(username)
                .password(passwordEncoder.encode(password))
                .nickname(nickname)
                .phone(phone)
                .category(category)
                .status(Status.STATUS_ACTIVE)
                .authorities(authorities)
                .build();
    }
}

