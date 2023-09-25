package com.xio.know_snap_back.service;


import com.xio.know_snap_back.domain.Category;
import com.xio.know_snap_back.domain.Member;
import com.xio.know_snap_back.domain.Status;
import com.xio.know_snap_back.domain.auth.Authority;
import com.xio.know_snap_back.domain.auth.MemberAuth;
import com.xio.know_snap_back.dto.member.AddMemberRequest;
import com.xio.know_snap_back.dto.member.AddMemberResponse;
import com.xio.know_snap_back.exceptionHandler.*;
import com.xio.know_snap_back.repository.CategoryRepository;
import com.xio.know_snap_back.repository.MemberRepository;
import com.xio.know_snap_back.repository.AuthorityRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.HashSet;
import java.util.Set;

@RequiredArgsConstructor
@Service
public class MemberService {
    private final MemberRepository memberRepository;
    private final CategoryRepository categoryRepository;
    private final AuthorityRepository authorityRepository;
    private final PasswordEncoder passwordEncoder;

    public AddMemberResponse save(AddMemberRequest dto) throws AuthException {

        if (memberRepository.existsByUsername(dto.getUsername())){
            throw new MemberException(MemberExceptionType.DUPLICATE_USER);
        }

        Category category = categoryRepository.findByTitle(dto.getCategory())
                .orElseThrow(()->new CategoryException(CategoryExceptionType.NOT_FOUND_CATEGORY));

        Authority authority = authorityRepository
                .findByAuthorityName(MemberAuth.ROLE_USER)
                .orElseThrow(() -> new AuthException(AuthorityExceptionType.NOT_FOUND_AUTHORITY));

        Set<Authority> set = new HashSet<>();
        set.add(authority);

        Member member = dto.toMember(passwordEncoder, set, category);
        return AddMemberResponse.of(memberRepository.save(member));
    }
    public Member findById(Long memberId) {
        return memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("Unexpected member"));
    }
    public Member findByUsername(String username) {
        return memberRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("Unexpected member"));
    }

}
