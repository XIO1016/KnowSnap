package com.xio.know_snap_back.controller.member;

import com.xio.know_snap_back.dto.member.AddMemberRequest;
import com.xio.know_snap_back.dto.member.AddMemberResponse;
import com.xio.know_snap_back.service.MemberService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.nio.charset.StandardCharsets;

@RequiredArgsConstructor
@Controller
public class MemberApiController {
    private final MemberService memberService;

    @Operation(summary = "test hello", description = "hello api example")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "OK !!"),
            @ApiResponse(responseCode = "400", description = "BAD REQUEST !!"),
            @ApiResponse(responseCode = "404", description = "NOT FOUND !!"),
            @ApiResponse(responseCode = "500", description = "INTERNAL SERVER ERROR !!")
    })
    @PostMapping("/member")
    public ResponseEntity<AddMemberResponse> signup(@RequestBody AddMemberRequest memberRequestDto) {
//        log.debug("memberRequestDto = {}", memberRequestDto);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", StandardCharsets.UTF_8));
        return new ResponseEntity<>(memberService.save(memberRequestDto), headers, HttpStatus.OK);
    }
}
