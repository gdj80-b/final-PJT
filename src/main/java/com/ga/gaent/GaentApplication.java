package com.ga.gaent;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableScheduling
@ServletComponentScan
@SpringBootApplication
@MapperScan("com.ga.gaent")
public class GaentApplication {

    public static void main(String[] args) {
        SpringApplication.run(GaentApplication.class, args);
    }
}
