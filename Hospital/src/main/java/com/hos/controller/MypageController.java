package com.hos.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hos.model.CheckVO;
import com.hos.model.Criteria;
import com.hos.model.DoctorVO;
import com.hos.model.MemberVO;
import com.hos.model.MypageVO;
import com.hos.model.PageVO;
import com.hos.model.RecordVO;

import com.hos.service.CheckService;
import com.hos.service.MedicalService;
import com.hos.service.MemberService;
import com.hos.service.RecordService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
   @Autowired
   private MemberService memberservice;

   @Autowired
   private CheckService checkservice;

   @Autowired
   private MedicalService medicalservice;

   @Autowired
   private RecordService recordservice;

   @Autowired
   private BCryptPasswordEncoder pwEncoder;

   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   // record 리스트 페이지 접속
   @RequestMapping(value = "mypageRecordView", method = RequestMethod.GET)
   public void recordListGet(HttpServletRequest Hrequest, ServletRequest Srequest, Criteria cri, Model model, MemberVO member,RecordVO record) throws Exception {
      HttpSession session = Hrequest.getSession();

      member = (MemberVO) session.getAttribute("member");
      member = memberservice.memberGetDetail(member);

      int memberNum = member.getMemberNum();
      
      List<RecordVO> list = new ArrayList<>();
      List<RecordVO> listt = recordservice.recordGetList(cri);
      List<RecordVO> listtt = recordservice.memberRecordGet(member);
      System.out.println(record.getMemberNum());
      for (RecordVO item : listt) {
         if (item.getMemberNum() == memberNum) {
            list.add(item);
         }
      }
      int a= 0;
      for (RecordVO item : listtt) {
         a++;
      }

      ArrayList<DoctorVO> doctor = new ArrayList<>();
      DoctorVO dvo = new DoctorVO();
      model.addAttribute("recordDetail", list);
      model.addAttribute("doctorDetail", doctor);
   
      for (RecordVO item : list) {
         dvo = medicalservice.doctorGetDetail(item);
         doctor.add(dvo);
      }

      /* 페이지 이동 인터페이스 데이터 */
      PageVO pageMaker = new PageVO(cri, a);
      model.addAttribute("pageMaker", pageMaker);
      
   }
   // 마이 페이지 이동
   @RequestMapping(value = "mypage", method = RequestMethod.GET)
   public void mypageGET(HttpServletRequest request, MemberVO member, Model model) throws Exception {
      HttpSession session = request.getSession();

      member = (MemberVO) session.getAttribute("member");
      member = memberservice.memberGetDetail(member);
      logger.info("mypageGetDetail......" + member);

      /* 예약자 정보 */
      model.addAttribute("mypageDetail", member);
   }

   // 마이 페이지 - 수정 페이지 이동
   @RequestMapping(value = "mypageUpdate", method = RequestMethod.GET)
   public void updateGET(HttpServletRequest request, MemberVO member, Model model) throws Exception {
      HttpSession session = request.getSession();

      member = (MemberVO) session.getAttribute("member");
      member = memberservice.memberGetDetail(member);
      logger.info("mypageGetUpdate......" + member);

      logger.info("마이 페이지 - 수정 페이지 진입");
      model.addAttribute("mypageUpdate", member);
   }

   // 마이 페이지 - 내 정보 수정 버튼 서비스
   @RequestMapping(value = "mypageUpdate", method = RequestMethod.POST)
   public String updatePOST(MemberVO member, RedirectAttributes rttr) throws Exception {

      String rawPw = ""; // 인코딩 전 비밀번호
      String encodePw = ""; // 인코딩 후 비밀번호
      System.out.println(member);
      rawPw = member.getMemberPw(); // 비밀번호 데이터 얻음
      encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
      member.setMemberPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
      System.out.println(encodePw);
      int result = memberservice.mypageModify(member);

      rttr.addFlashAttribute("Updateresult", result);

      return "redirect:/main";

   }

   // 마이 페이지 - 예약 정보 조회 페이지 이동
   @RequestMapping(value = "mypageReserveView", method = RequestMethod.GET)
   public void mypageReserveViewGET(HttpServletRequest request, MemberVO member, Model model) throws Exception {
      HttpSession session = request.getSession();
      System.out.println(member);

      member = (MemberVO) session.getAttribute("member");
      CheckVO check = new CheckVO();
      check = checkservice.checkGetDetail(member);
      logger.info("checkGetDetail......" + check);

      /* 예약자 정보 */
      model.addAttribute("checkDetail", check);
   }

   // 마이 페이지 - 내 예약 수정 버튼 서비스
   @RequestMapping(value = "mypageReserveModify", method = RequestMethod.POST)
   public String reserveUpdatePOST(CheckVO check, RedirectAttributes rttr) throws Exception {

      int result = checkservice.modifyCheck(check);

      rttr.addFlashAttribute("modifyCheck", result);

      return "redirect:/mypage/mypage";

   }

   // 마이 페이지 - 내 예약 삭제 버튼 서비스
   @RequestMapping(value = "mypageReserveDelete", method = RequestMethod.POST)
   public String reserveModifyPOST(CheckVO check, RedirectAttributes rttr) throws Exception {

      int result = checkservice.deleteCheck(check);

      rttr.addFlashAttribute("deleteCheck", result);

      return "redirect:/mypage/mypage";

   }

   // Record 상세 페이지
   @RequestMapping(value = "mypageRecordDetail", method = RequestMethod.GET)
   public void recordDetailGET(int recordNum, MypageVO cri, Model model) throws Exception {
       logger.info("recordDetail......." + recordNum);

       RecordVO recordDetail = recordservice.recordGetDetail(recordNum);
       
       // 해당 레코드에 대한 의사 정보를 가져오기
       DoctorVO doctorDetail = medicalservice.doctorGetDetail(recordDetail);
       
       model.addAttribute("cri", cri);
       model.addAttribute("recordDetail", recordDetail);
       model.addAttribute("doctorDetail", doctorDetail);
   }

}