package com.naver.sozlo.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SalaryRoll {
	
	private String yyyymm;
	private String no;
	private int amount;
	private int amount12;
	private int incometax;
	private int income;
	private int humandeduct;
	private int insurance;
	private int special;
	private int standard;
	private int calculatetax;
	private int incometaxdeduct;
	private int decisiontax12;
	private int decisiontax;
	
	

}
