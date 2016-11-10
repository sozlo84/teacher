package com.naver.sozlo.service;

import java.util.ArrayList;

import com.naver.sozlo.entities.Board;
import com.naver.sozlo.entities.BoardPaging;


public interface BoardDao {

	
	
	public int selectCountAll ();
	public int selectCount ( BoardPaging boardpaging);
	public Board selectOne( int b_seq );
	public ArrayList<Board> selectAll();
	public ArrayList<Board> selectPagelist(BoardPaging boardpaging);
	public int insertRow( Board board );
	public int insertReply( Board board );
	public int updateRow( Board board );
	public int deleteRow( int b_seq );
	public int updateHit( int b_seq );
	
}
