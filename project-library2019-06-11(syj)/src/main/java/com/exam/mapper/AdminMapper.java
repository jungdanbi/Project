package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.BookReservationVO;
import com.exam.domain.MemberVO;

public interface AdminMapper {
    public List<MemberVO> adminMemberList();
    
    public List<MemberVO> adminMemberIdSearch(@Param("memberId") String memberId);

    public BookReservationVO selectbookReservationAndTime(String BookCode);
}
