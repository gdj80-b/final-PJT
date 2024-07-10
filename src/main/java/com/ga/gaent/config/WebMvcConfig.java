package com.ga.gaent.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        
        /* "/assets/**"로 호출하는 자원은 "/static/assets/"폴더 아래에서 찾는다. */
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("classpath:/static/assets/")
                .setCachePeriod(60 * 60 * 24 * 365);
        
        /* "/js/**"로 호출하는 자원은 "/static/js/"폴더 아래에서 찾는다. */
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/static/js/")
                .setCachePeriod(60 * 60 * 24 * 365);
        
        /* "/libs/**"로 호출하는 자원은 "/static/libs/"폴더 아래에서 찾는다. */
        registry.addResourceHandler("/libs/**")
                .addResourceLocations("classpath:/static/libs/")
                .setCachePeriod(60 * 60 * 24 * 365);
        
        /* "/scss/**"로 호출하는 자원은 "/static/scss/"폴더 아래에서 찾는다. */
        registry.addResourceHandler("/scss/**")
                .addResourceLocations("classpath:/static/scss/")
                .setCachePeriod(60 * 60 * 24 * 365);
    }
}
