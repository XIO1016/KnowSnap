package com.xio.know_snap_back.exceptionHandler;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MemberException extends  RuntimeException{
    MemberExceptionType exceptionType;
}
