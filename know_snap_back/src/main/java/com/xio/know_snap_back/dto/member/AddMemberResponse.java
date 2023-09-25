package com.xio.know_snap_back.dto.member;

import com.xio.know_snap_back.domain.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddMemberResponse {
    private Long id;
    public static AddMemberResponse of(Member member) {
        return new AddMemberResponse(member.getId());
    }
}
