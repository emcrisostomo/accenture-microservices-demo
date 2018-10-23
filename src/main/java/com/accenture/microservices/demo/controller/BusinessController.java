package com.accenture.microservices.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.Arrays;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

@RestController
public class BusinessController
{
    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/businesses")
    public TestEntity getBusinesses()
    {
//        return ok(Arrays.asList("strategy", "consulting", "digital", "technology", "operations"));
        TestEntity testEntity = new TestEntity();
        testEntity.setName("Hello world!");
        return testEntity;
    }

    public static class TestEntity
    {
        private String name;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
}
