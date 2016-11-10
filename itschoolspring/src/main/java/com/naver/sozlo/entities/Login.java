package com.naver.sozlo.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Login {
	private String email;
	private String password;

}
