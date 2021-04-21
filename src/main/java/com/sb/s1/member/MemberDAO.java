package com.sb.s1.member;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class MemberDAO {


	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE="com.sb.s1.member.MemberDAO.";

	
	public int memberPoint(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"memberPoint", memberDTO);
		}
	
	//맴버 선택
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{

		return sqlSession.selectOne(NAMESPACE+"getSelect", memberDTO);
	}

	//맴버 로그인
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}

	public MemberDTO memberIdCheck(MemberDTO memberDTO)throws Exception{

		return sqlSession.selectOne(NAMESPACE+"memberIdCheck",memberDTO);
	}
	//맴버 업데이트
	public int memberUpdate(MemberDTO memberDTO)throws Exception{

		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}
	
	//맴버 탙퇴
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);

	}

	//맴버 가입
	public int memberJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}

}
