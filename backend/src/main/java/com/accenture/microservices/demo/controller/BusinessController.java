package com.accenture.microservices.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

@RestController
public class BusinessController
{
    @GetMapping("/businesses")
    public ResponseEntity<List<String>> getBusinesses()
    {
        return ok(Arrays.asList("strategy", "consulting", "digital", "technology", "operations"));
    }
}
