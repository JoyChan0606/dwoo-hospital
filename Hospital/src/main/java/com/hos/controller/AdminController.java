package com.hos.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hos.model.Criteria;
import com.hos.model.DocImageVO;
import com.hos.model.DoctorVO;
import com.hos.model.PageVO;
import com.hos.service.AdminService;
import com.hos.service.MedicalService;

import net.coobird.thumbnailator.Thumbnails;


@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminservice;

	@Autowired 
	private MedicalService medicalservice;
	
	// 관리자 메인 페이지 이동
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {
		logger.info("메인 페이지 이동");

	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<DocImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPOST..........");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<DocImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}

		} // for

		String uploadFolder = "C:\\doctor";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미저 정보 담는 객체 */
		List<DocImageVO> list = new ArrayList();

		for (MultipartFile multipartFile : uploadFile) {
			/* 이미지 정보 담는 객체 */
			DocImageVO vo = new DocImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName; // 파일 이름이 곂치면 덮어지기때문에 사용

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				/*
				 * 방법1 //썸네일 생성(ImageIO) File thumbnailFile = new File(uploadPath, "s_" +
				 * uploadFileName);
				 * 
				 * BufferedImage bo_image = ImageIO.read(saveFile); //비율 double ratio = 3; //넓이
				 * 높이 int width = (int) (bo_image.getWidth() / ratio); int height = (int)
				 * (bo_image.getHeight() / ratio);
				 * 
				 * BufferedImage bt_image = new BufferedImage(width, height,
				 * BufferedImage.TYPE_3BYTE_BGR);
				 * 
				 * Graphics2D graphic = bt_image.createGraphics();
				 * 
				 * graphic.drawImage(bo_image, 0, 0,width,height, null);
				 * 
				 * ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */
				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<DocImageVO>> result = new ResponseEntity<List<DocImageVO>>(list, HttpStatus.OK);
		return result;
	}

	/* 상품 등록 */
	@PostMapping("/doctorEnroll")
	public String doctorEnrollPOST(DoctorVO doc, RedirectAttributes rttr) {
		logger.info("doctorEnrollPOST - Received data: " + doc);
		
		adminservice.doctorEnroll(doc);
		rttr.addFlashAttribute("enroll_result", doc.getDoctorName());

		return "redirect:/admin/main";
	}

	/* 작가 등록 페이지 접속 */
	@RequestMapping(value = "DoctorEnroll", method = RequestMethod.GET)
	public void DoctorEnrollGET() throws Exception {
		logger.info("의사 등록 페이지 접속");
	}
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile........" + fileName);
		File file = null;
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "/DoctorList", method = RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception {
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
	
	/* 상품 조회 페이지 */
	@GetMapping("/DoctorDetail")
	public void goodsGetInfoGET(int doctorNum, Criteria cri, Model model) {
		
		logger.info("goodsGetInfo()........." + doctorNum);
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		logger.info("!");
		
		/* 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminservice.doctorGetDetail(doctorNum));
		
	}
	/* 상품 정보 삭제 */
	@PostMapping("/doctorDelete")
	public String goodsDeletePOST(int doctorNum, RedirectAttributes rttr) {
		
		logger.info("goodsDeletePOST..........");
		
		int result = adminservice.doctorDelete(doctorNum);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/main";
		
	}
	
	/* 상품 정보 수정 */
	@PostMapping("/doctorModify")
	public String doctorModifyPOST(DoctorVO vo, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + vo);
		
		int result = adminservice.doctorModify(vo);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/DoctorList";		
		
	}
	
}
