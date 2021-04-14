package com.sb.s1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;



@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.getSelect(memberDTO);
	}
	
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		memberDTO = memberDAO.memberLogin(memberDTO);
		
		return memberDTO;
	}
	
	public MemberDTO membereIdCheck(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberLogin(memberDTO);
	}
	
//	public int memberUpdate(MemberDTO memberDTO)throws Exception{
//		return memberDAO.memberUpdate(memberDTO);
//	}
//	
//	public int memberDelete(MemberDTO memberDTO, HttpSession session)throws Exception{	
//		return memberDAO.memberDelete(memberDTO);
//	}
//	
//	
//	public int memberJoin(MemberDTO memberDTO)throws Exception{
//		
//		int result = memberDAO.memberJoin(memberDTO);
//		
//		
//		return result;
//	}
//	
}
