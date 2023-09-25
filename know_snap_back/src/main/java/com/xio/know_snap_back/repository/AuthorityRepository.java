package com.xio.know_snap_back.repository;

import com.xio.know_snap_back.domain.auth.Authority;
import com.xio.know_snap_back.domain.auth.MemberAuth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AuthorityRepository extends JpaRepository<Authority,String> {
    Optional<Authority> findByAuthorityName(MemberAuth authorityName);
}
