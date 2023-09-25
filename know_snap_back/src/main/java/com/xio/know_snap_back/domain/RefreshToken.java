package com.xio.know_snap_back.domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name = "refresh_token")
@Entity
@NoArgsConstructor
@Builder
@Getter
public class RefreshToken {
    @Id
    @Column(name="token_key")
    private String key;

    @Column(nullable = false)
    private String value;

    public void updateValue(String token) {
        this.value = token;
    }

    @Builder
    public RefreshToken(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
