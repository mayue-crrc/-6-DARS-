package com.metro.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages={"com.metro.service", "com.metro.security"})
public class ControllerConfig {

}
