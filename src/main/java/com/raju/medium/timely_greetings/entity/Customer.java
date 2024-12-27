package com.raju.medium.timely_greetings.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(
        name = "customer",
        indexes = {
                @Index(name = "idx_date_of_birth", columnList = "date_of_birth"),
                @Index(name = "idx_time_zone", columnList = "time_zone"),
                @Index(name = "idx_date_of_birth_time_zone", columnList = "date_of_birth, time_zone")
        }
)
public class Customer {
    @Id
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String email;

    @Column(name = "date_of_birth", nullable = false)
    private LocalDate dateOfBirth;

    @Column(name = "time_zone", nullable = false)
    private String timeZone; // E.g., "America/New_York"
}