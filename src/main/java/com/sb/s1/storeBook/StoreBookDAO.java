package com.sb.s1.storeBook;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreBookDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.storeBook.storeBookDAO.";
	
	
	
}
