package com.sb.s1.address;

import java.util.List;

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
	
	public List<AddressDTO> getAddressList(AddressDTO addressDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAddressList", addressDTO);
	}
	
	public long addressInsert(AddressDTO addressDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"addressInsert", addressDTO);
	}
	
	public long changeRecent(AddressDTO addressDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"changeRecent", addressDTO);
	}
	
	public long thisisRecent(AddressDTO addressDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"thisisRecent", addressDTO);
	}
	
	public long deleteAddress(AddressDTO addressDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteAddress", addressDTO);
	}
	
	public long updateForRemove(AddressDTO addressDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"updateForRemove", addressDTO);
	}
}
