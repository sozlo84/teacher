package com.naver.sozlo.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SalaryRollup {
	private String yyyymm;
	private String no;
	private String dept;
	private String name;
	private String partner;
	private String dependent20;
	private String dependent60;
	private String amount;
	private String insurance;
	private String decisiontax;
	private String receipt;
	

}
