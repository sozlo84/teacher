package com.naver.sozlo.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Salary {
	
	private String  no;
	private String  name;
	private String  dept;
	private int		partner;
	private int		dependent20;
	private int		dependent60;
	private int		base;
	private int		extrapay1;
	private int		extrapay2;
	private int	    insurance;
	

}
