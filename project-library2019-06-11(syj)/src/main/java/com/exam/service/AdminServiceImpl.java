package com.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.BookVO;
import com.exam.domain.MemberVO;
import com.exam.domain.ResTimeVO;
import com.exam.mapper.AdminMapper;
import com.exam.mapper.BookMapper;
import com.exam.mapper.MemberMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
    
    @Setter(onMethod_ = @Autowired)
    private AdminMapper mapper;
    
    @Setter(onMethod_ = @Autowired)
    private BookService bookService;
    
    @Setter(onMethod_ = @Autowired)
    private BookMapper bookMapper;
    
    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;
    
    @Setter(onMethod_ = @Autowired)
    private ReservationService reservationService;
    
    @Setter(onMethod_ = @Autowired)
    private ResTimeService resTimeService;
    
    
    @Override
    public List<MemberVO> adminMemberList() {
        return mapper.adminMemberList();
    }

    @Override
    public BookReservationVO selectbookReservationAndTime(String BookCode) {
        return mapper.selectbookReservationAndTime(BookCode);
    }

    @Override
    @Transactional
    public int bookReturnProcess(String bookCode, String memberId, boolean isDuty) {
        
        
        BookVO bookVO = bookService.getBookInfo(bookCode);
        System.out.println("책정보 받아오기");
        BookLogVO bookLogVO = new BookLogVO();
        bookLogVO.setBookNo(bookCode);
        bookLogVO.setAuthor(bookVO.getAuthor());
        bookLogVO.setTitle(bookVO.getTitle());
        bookLogVO.setVol(bookVO.getVol());
        bookLogVO.setPublisher(bookVO.getPublisher());
        bookLogVO.setMemberId(memberId);
        
        bookMapper.bookLogInsert(bookLogVO);
        System.out.println("책정보 로그db에 넣기");
        
        reservationService.deleteReservation(bookCode);
        System.out.println("대여된 유저정보 db에서 삭제하기");
        
        resTimeService.deleteResTime(bookCode);
        System.out.println("대여된 시간정보 db에서 삭제하기");
        
        MemberVO memberVO = memberService.getMemberById(memberId);
        System.out.println("유저정보 가져오기");
        if (memberVO.getBookOverdue()>0) { // 맴버의 연체 정보가 있는 경우
            System.out.println("연체정보 업데이트");
            if (isDuty = true) {//체크박스 값이 연체 ok 인경우
                memberService.updateMemberOverDue(memberId);
                
               }
        } 
        System.out.println("성공!");
        return 1;
    }

    @Override
    public List<MemberVO> adminMemberIdSearch(@Param("memberId") String memberId) {
        return mapper.adminMemberIdSearch(memberId);
    }
    
    @Override
    @Transactional
    public int bookRentalProcess(String bookCode, String memberId) {
        
        BookReservationVO bookReservationVO = new BookReservationVO();
        ResTimeVO resTimeVO = new ResTimeVO();
        String book_code = "book"+bookCode;
        
        bookReservationVO.setMemberId(memberId);
        bookReservationVO.setBookCode(book_code);
        bookReservationVO.setBookStatus(1);
        bookReservationVO.setBookExtension(0);
        System.out.println("bookReservationVO::"+bookReservationVO);
        
        resTimeVO.setTimeCode(book_code);
        System.out.println("resTimeVO::"+resTimeVO);
        
        reservationService.insertBookReservationAndRental(bookReservationVO, resTimeVO);
        
        return 1;
    }
    
    
    
}
