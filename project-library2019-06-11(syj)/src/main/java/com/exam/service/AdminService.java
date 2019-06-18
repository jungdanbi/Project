package com.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.BookReservationVO;
import com.exam.domain.MemberVO;

public interface AdminService {
    
    public List<MemberVO> adminMemberList();
    
    public List<MemberVO> adminMemberIdSearch(@Param("memberId") String memberId);
    
    public BookReservationVO selectbookReservationAndTime(String BookCode);
    
    public int bookReturnProcess(String bookCode, String memberId, boolean isDuty);
    
    public int bookRentalProcess(String bookCode, String memberId);
    
}
