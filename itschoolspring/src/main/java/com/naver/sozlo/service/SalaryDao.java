package com.naver.sozlo.service;

import java.util.ArrayList;
import java.util.List;

import com.naver.sozlo.entities.Board;
import com.naver.sozlo.entities.Member;
import com.naver.sozlo.entities.Salary;
import com.naver.sozlo.entities.SalaryRoll;
import com.naver.sozlo.entities.SalaryRollup;

public interface SalaryDao {
	
	
	public ArrayList<Salary> selectAll();
	public int selectCount ( String no );
	public int insertRow( Salary salary );
	public Salary selectOne( String no );
	public int updateRow( Salary salary );
	public int deleteRow( String id );
	public int deleteRollRow( String yyyymm );
	public int insertRollRow( List<SalaryRoll>  list);
	
	public ArrayList<SalaryRollup> salaryRollup( String yyyymm );
	
}
