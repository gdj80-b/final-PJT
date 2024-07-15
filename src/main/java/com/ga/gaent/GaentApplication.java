package com.ga.gaent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class GaentApplication {

    public static void main(String[] args) {
        SpringApplication.run(GaentApplication.class, args);
    }

}
