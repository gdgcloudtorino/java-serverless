package org.gdgcloudtorino.javaserverless;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@RestController
public class GreetingResource {
    private static final Logger log = LoggerFactory.getLogger(GreetingResource.class);
    private final BigDecimal pi;
    public GreetingResource() {
        pi=Pi.pi(200000);
        log.info("PI {}",pi.doubleValue());
    }

    @GetMapping(value = "/hello",produces = MediaType.TEXT_PLAIN_VALUE)
    public String hello(){
        return "Hello from Spring Boot, pi is:"+(pi.toEngineeringString().length()-2);
    }
}
