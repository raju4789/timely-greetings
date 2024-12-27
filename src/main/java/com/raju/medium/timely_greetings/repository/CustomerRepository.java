package com.raju.medium.timely_greetings.repository;

import com.raju.medium.timely_greetings.entity.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    @Query("SELECT c FROM Customer c WHERE c.dateOfBirth = :date AND c.timeZone = :timeZone")
    Page<Customer> findByDateOfBirthAndTimeZone(LocalDate date, String timeZone, Pageable pageable);
}