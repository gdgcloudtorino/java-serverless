package org.gdgcloudtorino.javaserverless;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingResource {

    @GetMapping(value = "/hello",produces = MediaType.TEXT_PLAIN_VALUE)
    public String hello(){
        return "Hello from Spring Boot";
    }
}
