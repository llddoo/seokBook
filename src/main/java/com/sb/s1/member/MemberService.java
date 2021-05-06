package com.sb.s1.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;









@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;




	public MemberDTO memberGrade(MemberDTO memberDTO)throws Exception{

		return memberDAO.memberGrade(memberDTO);
	}

	public int gradeUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.gradeUpdate(memberDTO);
	}


	public MemberDTO memberFindID(MemberDTO memberDTO)throws Exception{

		return memberDAO.memberFindID(memberDTO);
	}

	public MemberDTO memberFindPw(MemberDTO memberDTO)throws Exception{

		return memberDAO.memberFindPw(memberDTO);
	}

	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{

		return memberDAO.getSelect(memberDTO);
	}


	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		memberDTO = memberDAO.memberLogin(memberDTO);

		return memberDTO;
	}

	public int memberUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberUpdate(memberDTO);
	}

	public int memberDelete(MemberDTO memberDTO, HttpSession session)throws Exception{

		return memberDAO.memberDelete(memberDTO);
	}


	public MemberDTO memberIdCheck(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberIdCheck(memberDTO);
	}


	public int memberJoin(MemberDTO memberDTO, HttpSession session)throws Exception{

		int result = memberDAO.memberJoin(memberDTO);

		return result;
	}

	public MemberDTO selectUserInfo(MemberDTO memberDTO)throws Exception{
		return memberDAO.selectUserInfo(memberDTO);
	}

	public long pointAfterPur(MemberDTO memberDTO)throws Exception{
		return memberDAO.pointAfterPur(memberDTO);
	}
}
