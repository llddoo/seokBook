package com.sb.s1.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.branch.BranchDTO;
import com.sb.s1.branch.BranchPager;









@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
////////////	

//public List<BranchDTO> getList(MemberPager memberPager) throws Exception {
//		
//		memberPager.makeRow();
//		
//		long totalCount=memberDAO.getTotalCount(memberPager);
//		memberPager.makeNum(totalCount);		
//		
//		return memberDAO.getList(memberPager);
//	}
//	
	
//////////////
	public List<BookListDTO> cartList(MemberPager memberPager)throws Exception{
		// ---- startRow, lastRow ----
		memberPager.makeRow();

		// ---- 페이징 계산 -------------
		long totalCount = memberDAO.getTotalCount(memberPager);
		memberPager.makeNum(totalCount);
		
		
		return memberDAO.cartList(memberPager);
	}
	
//	public int memberPoint(MemberDTO memberDTO, HttpSession session)throws Exception{
//		
//		return memberDAO.memberPoint(memberDTO);
//	}
	
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


}
