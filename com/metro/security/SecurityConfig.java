package com.metro.security;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	DataSource dataSource;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
//				.antMatchers("/createuser").hasAnyAuthority("admin")
//				.antMatchers("/createmetro").hasAnyAuthority("user") 
				.anyRequest().permitAll()
					.and()
				.formLogin();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
//			.inMemoryAuthentication()
//			.withUser("dengran").password("1").roles("admin")
//			.and()
//			.withUser("mayue").password("2").roles("user");xl
			.jdbcAuthentication()
				.dataSource(this.dataSource)
				.usersByUsernameQuery("select username, password, valid from userinfo where username=?")
				.authoritiesByUsernameQuery("select username, type from userinfo where username=?");
	}
}
