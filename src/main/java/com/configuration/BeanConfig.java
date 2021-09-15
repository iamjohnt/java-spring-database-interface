package com.configuration;

import com.dbservice.JpaDbService;
import com.dbservice.SpringDbService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*  configuration class, that is repesponsible for creating beans, that can be autowired elsewhere */
@Configuration
public class BeanConfig {

    @Bean
    public JpaDbService jpaDbService() {
        return new JpaDbService();
    }

    @Bean
    public SpringDbService springDbService() {
        return new SpringDbService();
    }

}
