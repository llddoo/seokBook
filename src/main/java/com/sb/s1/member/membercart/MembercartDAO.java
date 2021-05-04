package com.sb.s1.member.membercart;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.util.Pager;

@Repository
public class MembercartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.sb.s1.member.membercart.MembercartDAO.";
	
	public List<MembercartDTO> getCartList(Pager pager)throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartList", pager);
	}
	public MembercartDTO checkBook(MembercartDTO membercartDTO)throws Exception {
		return sqlSession.selectOne(NAMESPACE+"checkBook", membercartDTO);
	}
	public long addCart(MembercartDTO membercartDTO)throws Exception {
		return sqlSession.insert(NAMESPACE+"addCart", membercartDTO);
	}
	public long delItem(MembercartDTO membercartDTO)throws Exception {
		return sqlSession.delete(NAMESPACE+"delItem", membercartDTO);
	}
	public long updateCart(MembercartDTO membercartDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"updateCart", membercartDTO);
	}
	public long deleteList(ArrayList<Long> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteList", list);
	}
	public long deleteListAfterPur(List<MembercartDTO> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteListAfterPur", list);
	}
}
