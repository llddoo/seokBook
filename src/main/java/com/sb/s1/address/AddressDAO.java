package com.sb.s1.address;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.sb.s1.address.AddressDAO.";
	
	public AddressDTO getSelect(AddressDTO addressDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", addressDTO);
	}
	
}
