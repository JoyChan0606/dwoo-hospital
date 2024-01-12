package com.hos.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.hos.model.Criteria;
import com.hos.model.DoctorVO;
import com.hos.model.PageVO;
import com.hos.model.PageDTO;
import com.hos.model.RecordVO;
import com.hos.service.MedicalService;

@Controller
@RequestMapping("/medical")
public class MedicalController {
	private static final Logger logger = LoggerFactory.getLogger(MedicalController.class);

	@Autowired
	private MedicalService medicalservice;
	
	/* 의료진 로그인 페이지 이동 */
    @RequestMapping(value="medicalLogin", method = RequestMethod.GET)
    public void medicalLoginGET() throws Exception{
        
        logger.info("의료진 로그인 페이지 이동");
        
    }
    
    /* 의료진 로그인 */
	@RequestMapping(value = "medicalLogin", method = RequestMethod.POST)
	public String medicalLoginPOST(HttpServletRequest request, DoctorVO doctor, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		
        DoctorVO lvo = medicalservice.medicalLogin(doctor);    // 제출한아이디와 일치하는 아이디 있는지 
        
        if(lvo != null) {            // 일치하는 아이디 존재시
            session.setAttribute("medical", lvo);     // session에 사용자의 정보 저장
            return "redirect:/medical/main";        // 메인페이지 이동
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/medical/medicalLogin";    // 로그인 페이지로 이동
            
        }
	}
	
	/* 의료진 메인 페이지 이동 */
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void medicalMainGET() throws Exception{
        
        logger.info("의료진 메인 페이지 이동");
        
    }
		
    /* 예약 확인 페이지 접속 */
	@RequestMapping(value = "reservList", method = RequestMethod.GET)
	public void checkManageGET(Criteria cri, Model model) throws Exception{
		
		logger.info("예약 확인 페이지 접속");
		
		/* 상품 리스트 데이터 */
		List list = medicalservice.reservCheck(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, medicalservice.checkTotal(cri)));
	}

	/* 진료 기록 추가 페이지 접속 */
    @RequestMapping(value = "recordInsert", method = RequestMethod.GET)
    public void recordInsertGET(Model model, Criteria cri) throws Exception{
        logger.info("진료 기록 등록 페이지 접속");
        
        /* 상품 리스트 데이터 */
		List list = medicalservice.reservCheck(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
    }

    /* 환자 목록 팝업창 */
	@GetMapping("/patientPop")
	public void patientPopGET(Model model, Criteria cri) throws Exception{
		
		logger.info("patientPopGET.......");
		
		/* 게시물 출력 데이터 */
		List list = medicalservice.reservCheck(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 작가 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
		}
		
		//페이지 이동 인터페이스 데이터 
		model.addAttribute("pageMaker", new PageDTO(cri, medicalservice.checkTotal(cri)));
	}
	
	/* 진료 기록 등록, 예약 삭제 */
	@PostMapping("/recordInsert")
	public String recordInsertPOST(RecordVO record, DoctorVO doctor, HttpServletRequest request) throws Exception {
		
		logger.info("recordInsertPOST......" + record);
		
		HttpSession session = request.getSession();
		
		doctor = (DoctorVO) session.getAttribute("medical");
		
		record.setDoctorNum(doctor.getDoctorNum());
		
		medicalservice.recordInsert(record);
		
		return "redirect:/medical/main";
	}

	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "/Doctorpage", method = RequestMethod.GET)
	public void doctorManageGET(Criteria cri, Model model) throws Exception {
		logger.info("의사 리스트 페이지 접속");
		
		/* 상품 리스트 데이터 */
		List list = medicalservice.DoctorList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageVO(cri, medicalservice.DoctodTotal(cri)));
	}
	
	/* 진료 기록 확인 페이지 접속 */
	   @RequestMapping(value = "recordList", method = RequestMethod.GET)
	   public void recordManageGET(HttpServletRequest request, DoctorVO doctor, Criteria cri, Model model) throws Exception{
	      
	      logger.info("진료 기록 확인 페이지 접속");
	      
	      HttpSession session = request.getSession();
	      
	      doctor = (DoctorVO) session.getAttribute("medical");
	      
	      int doctorNum = doctor.getDoctorNum();
	      
	      /* 상품 리스트 데이터 */
	      List list = medicalservice.recordList(doctorNum);
	      
	      if(!list.isEmpty()) {
	         model.addAttribute("list", list);
	      } else {
	         model.addAttribute("listCheck", "empty");
	         return;
	      }
	      
	      /* 페이지 이동 인터페이스 데이터 */
	        model.addAttribute("pageMaker", new PageDTO(cri, medicalservice.recordTotal(cri)));
	   }
	
	/* 진료 기록 상세 페이지, 수정 페이지 */
    @GetMapping({"/recordDetail", "/recordModify"})
	public void recordGetInfoGET(RecordVO record, Criteria cri, Model model) throws Exception {
		
		logger.info("recordDetail.......");
		
		/* 작가 관리 페이지 정보 */
		model.addAttribute("cri", cri);
		
		/* 선택 작가 정보 */
		model.addAttribute("recordInfo", medicalservice.recordDetail(record));
		
	}
    
    /* 작가 정보 수정 */
   	@PostMapping("/recordModify")
   	public String authorModifyPOST(RecordVO record, RedirectAttributes rttr) throws Exception{
   		
   		logger.info("recordModifyPOST.......");
   		
   		int result = medicalservice.recordModify(record);
   		
   		rttr.addFlashAttribute("modify_result", result);
   		
   		return "redirect:/medical/recordList";
   		
   	}
   	
   	/* 작가 정보 삭제 */
   	@PostMapping("/recordDelete")
   	public String recordDeletePOST(RecordVO record, RedirectAttributes rttr) throws Exception{
   		
   		logger.info("recordDeletePOST.......");
   		
   		int result = medicalservice.recordDelete(record);
   		
   		rttr.addFlashAttribute("delete_result", result);
   		
   		return "redirect:/medical/recordList";
   		
   	}
}
