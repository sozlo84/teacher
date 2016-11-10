package com.naver.sozlo.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardPaging {
	
	private String find;
	private String selectbox;
	private int	   startrow;
	private int    endrow;

}
