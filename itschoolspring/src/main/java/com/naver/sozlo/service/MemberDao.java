package com.naver.sozlo.service;

import java.util.ArrayList;
import java.util.Map;

import com.naver.sozlo.entities.Member;

public interface MemberDao {
	
	public int selectCount ( String id );
	public Member selectOne( String id );
	public int insertRow( Member member);
	public ArrayList<Member> selectAll( );
	public Member selectphoto( String id );
	public int updateData( Member member );
	public int deleteRow(String id);
	public Member selectLogin( Member member );
	
}
