package com.xio.know_snap_back.domain;

import jakarta.persistence.*;
import lombok.*;

@Table(name = "category")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class Category extends BaseTimeEntity{
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column
    private Long parent;

    @Column(nullable = false)
    private String status;
}
