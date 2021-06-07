package com.ensias.Ensias_docs.security;


import com.ensias.Ensias_docs.services.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    private final UserService userService;


    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public SecurityConfig(UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception{

        http.authorizeRequests()
                .antMatchers("/ensiasdocs/admin/**")
                .hasAuthority("ADMIN")
                .and().exceptionHandling().accessDeniedHandler(new AccessDeniedHandler() {
            @Override
            public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
                System.out.println(e.getMessage());
                httpServletResponse.sendRedirect("/ensiasdocs/home");
            }
        })
        .and().authorizeRequests()
                .antMatchers("/ensiasdocs/**")
                .authenticated()
                .antMatchers("/","/login","/register")
                .permitAll()
                .antMatchers("/error")
                .permitAll()
                .and()
                .formLogin()

                .loginPage("/login")
                .failureHandler(new AuthenticationFailureHandler() {

                    @Override
                    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                                        AuthenticationException exception) throws IOException{
                        String email = request.getParameter("email");
                        String error = exception.getMessage();
                        System.out.println("A failed login attempt with email: "
                                + email + ". Reason: " + error+"Exception "+exception);

                        String redirectUrl = request.getContextPath() + "/login?error";
                        response.sendRedirect(redirectUrl);
                    }
                })
                .usernameParameter("email")
                .defaultSuccessUrl("/ensiasdocs/home")
                .and()
            .logout()
        .logoutSuccessUrl("/login");


    }

    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception{
        authenticationManagerBuilder
                .userDetailsService(userService)
                .passwordEncoder(passwordEncoder);
    }

    /*
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder);
    }*/

    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }




}
