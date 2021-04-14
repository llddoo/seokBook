package com.sb.s1.bookList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookListDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.bookListDAO.";
	
	
	public BookListDTO getSelect(BookListDTO bookListDTO)throws Exception{
		bookListDTO = sqlSession.selectOne(NAMESPACE+"getSelect", bookListDTO);
		System.out.println(bookListDTO.getIcbn());
		return bookListDTO;
	}	

	//bookList table의 모든 데이트 조회 후 리턴
	public List<BookListDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	
}
