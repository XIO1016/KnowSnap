package com.xio.know_snap_back.domain;

import com.xio.know_snap_back.domain.auth.MemberAuth;

import java.util.HashMap;
import java.util.Map;

public enum Status {
    STATUS_ACTIVE("ACTIVE"),
    STATUS_INACTIVE("STATUS_INACTIVE"),
    ;
    private final String abbreviation;
    private static final Map<String, MemberAuth> lookup = new HashMap<>();

    Status(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getAbbreviation() {
        return this.abbreviation;
    }

    public static MemberAuth get(String abbreviation) {
        return lookup.get(abbreviation);
    }

    public static boolean containsKey(String abbreviation) {
        return lookup.containsKey(abbreviation);
    }
}
