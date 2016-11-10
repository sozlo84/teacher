package com.naver.sozlo.entities;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component
@Data
public class Member {
	private String id;
	private String name;
	private String password;
	private String phone1;
	private String phone2;
	private String phone3;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String email;
	private String cardno;
	private String inputdate;
	private String job;
	private int    memberlevel;
	private byte[] photo;
	private MultipartFile imgfile;
}
