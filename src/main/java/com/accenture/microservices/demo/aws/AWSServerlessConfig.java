package com.accenture.microservices.demo.aws;

import com.accenture.microservices.demo.Profiles;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.web.servlet.HandlerExceptionResolver;

@Configuration
@Profile(Profiles.PROFILE_AWS_SERVERLESS)
public class AWSServerlessConfig {

    /*
     * optimization - avoids creating default exception resolvers; not required as the serverless container handles
     * all exceptions
     *
     * By default, an ExceptionHandlerExceptionResolver is created which creates many dependent object, including
     * an expensive ObjectMapper instance.
     */
    @Bean
    public HandlerExceptionResolver handlerExceptionResolver() {
        return (request, response, handler, ex) -> null;
    }
}
