package com.xio.know_snap_back.exceptionHandler;


import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum CategoryExceptionType implements BaseExceptionType{
    NOT_FOUND_CATEGORY("NOT_FOUND_CATEGORY","카테고리를 찾을 수 없습니다.", HttpStatus.BAD_REQUEST);

    private final String errorCode;
    private final String message;
    private final HttpStatus httpStatus;

    CategoryExceptionType(String errorCode, String message, HttpStatus httpStatus) {
        this.errorCode = errorCode;
        this.message = message;
        this.httpStatus = httpStatus;
    }
}