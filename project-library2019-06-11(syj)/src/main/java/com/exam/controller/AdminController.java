package com.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookRequestVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.BookVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.AdminMapper;
import com.exam.service.AdminService;
import com.exam.service.BookReqService;
import com.exam.service.BookService;
import com.exam.service.MemberService;
import com.exam.service.ResTimeService;
import com.exam.service.ReservationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Secured("ROLE_ADMIN")
@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
    
    @Setter(onMethod_ = @Autowired)
    private BookReqService bookReqService;
    
    @Setter(onMethod_ = @Autowired)
    private BookService bookService;

    @Setter(onMethod_ = @Autowired)
    private AdminService adminService;
    
    @Setter(onMethod_ = @Autowired)
    private ReservationService reservationService;
    
    @GetMapping("/bookRequestList")
    public String bookRequestResult() {
        
        return "admin/bookRequestList";
        
    }
    
    @PostMapping("/bookRequestUpdate")
    @ResponseBody
    public int updateWishList(BookRequestVO requestVO) {
        System.out.println("================================================");
        log.info(requestVO);
        System.out.println("================================================");
        int isSuccess = bookReqService.updateWishList(requestVO);
        
        return isSuccess;
    }
    
    //관리자 페이지
    @GetMapping("/adminPage") 
    public String adminPage() {
        return "admin/adminPage";
    }
    
    //멤버 리스트 페이지
    @GetMapping("/adminMemberList") 
    public String adminMemberList(Model model) {
        List<MemberVO> list = adminService.adminMemberList();
        model.addAttribute("list", list);
        return "admin/adminMemberList";
    }
    
    
    @GetMapping("/adminBookReturn")
    public String adminBookReturn() {
        System.out.println("adminBookReturn get 호출");
        return "admin/adminBookReturn";
    }
    
    @PostMapping("/adminBookReturn")
    @ResponseBody
    public BookReservationVO adminBookReturn(BookReservationVO bookReservationVO, String bookCode) {
        System.out.println("adminBookReturn post 호출");
        System.out.println("bookCode::" +bookCode);
        
        bookReservationVO.setBookCode(bookCode);
        bookReservationVO = adminService.selectbookReservationAndTime(bookCode);
        System.out.println(bookReservationVO);
        return bookReservationVO;
    }
    
    @ResponseBody
    @PostMapping("/adminBookReturnResult")
    public int adminUpdateBookStatus(String bookCode, String memberId, boolean isDuty) {
        System.out.println("adminBookReturn post 호출");
        System.out.println("bookCode::" +bookCode);
        System.out.println("MemberId::" +memberId);
        System.out.println("isDuty::" +isDuty);
        
        return adminService.bookReturnProcess(bookCode, memberId, isDuty);
    }
    
    @GetMapping("/adminBookRental")
    public String adminBookRental(Model model) {
        System.out.println("adminBookRental get 호출");        
        return "admin/adminBookRental";
    }
    
    @ResponseBody
    @PostMapping("/adminBookReservationGetAllList")
    public List<BookReservationVO> adminBookReservationGetAllList() {
        System.out.println("adminBookReservationGetAllList post 호출");    
        return reservationService.reservationMemberAllSearch();
    }
    
    @ResponseBody
    @PostMapping("/getAllBookHistoryList")
    public List<BookLogVO> getAllBookHistoryList() {
        System.out.println("getAllBookHistoryList post 호출");    
        return reservationService.getAllBookHistoryList();
    }
    
    
    @ResponseBody
    @GetMapping("/adminBookRentalIdSearch")
    public List<MemberVO> adminBookRentalIdSearch(String memberId) {
        List<MemberVO> memberList =  adminService.adminMemberIdSearch(memberId);
        
        for (MemberVO memberVO : memberList) {
            System.out.println("memberVO::"+memberVO);
            
        }
        
        return memberList;
    }
    
    @ResponseBody
    @GetMapping("/adminBookRentalCodeSearch")
    public List<BookVO> adminBookRentalCodeSearch(String bookCode) {
        
        return bookService.getBookRentalInfo(bookCode);
    }
    
    @ResponseBody
    @PostMapping("/adminBookRentalResult")
    public int adminBookRentalResult(String bookCode, String memberId) {
        System.out.println("adminBookRentalResult post 호출");
        System.out.println("bookCode::" +bookCode);
        System.out.println("MemberId::" +memberId);
        
        System.out.println("끗");
        return adminService.bookRentalProcess(bookCode, memberId);
        
    }
}
