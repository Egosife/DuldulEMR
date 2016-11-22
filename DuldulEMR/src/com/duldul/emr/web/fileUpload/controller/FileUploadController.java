package com.duldul.emr.web.fileUpload.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.duldul.emr.common.CommonProperties;
import com.duldul.emr.util.Utils;

@Controller
public class FileUploadController {

	@RequestMapping(value = "/fileUpload")
	public ModelAndView fileUpload(HttpServletRequest request,
			ModelAndView modelAndView) {
		
		modelAndView.setViewName("fileUpload/fileUpload");
		
		return modelAndView;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/fileUploadAjax")
	public ModelAndView fileUploadAjax(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable { 
		/* File Upload Logic */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		String uploadExts = CommonProperties.FILE_EXT;
		String uploadPath = CommonProperties.FILE_UPLOAD_PATH;
		String fileFullName = "";
		
		List<String> fileNames = new ArrayList<String>();
		try {
			final Map files = multipartRequest.getFileMap();
			Iterator<String> iterator = multipartRequest.getFileNames();

			while (iterator.hasNext()) {
				String key = iterator.next();
				MultipartFile file = (MultipartFile) files.get(key);
				if (file.getSize() > 0) {
					String fileRealName = file.getOriginalFilename(); // 실제파일명
					String fileTmpName = Utils.getPrimaryKey(); // 고유 날짜키 받기
					String fileExt = FilenameUtils.getExtension(
							file.getOriginalFilename()).toLowerCase(); // 파일
																		// 확장자추출

					if (uploadExts.toLowerCase().indexOf(fileExt) < 0) {
						throw new Exception("Not allowded file extension : " + fileExt.toLowerCase());
					} else {
						// 물리적으로 저장되는 파일명(실제파일명을 그대로 저장할지 rename해서 저장할지는 협의 필요)
						fileFullName = fileTmpName + fileRealName;
						file.transferTo(new File(new File(uploadPath), fileFullName));
						
						fileNames.add(fileFullName);
					}
				}
			}
		} catch (Exception e) {
			// 공통 Exception 처리
		}
		
		HashMap<String, List<String>> result = new HashMap<String,  List<String>>();
		result.put("fileName", fileNames);
		
		return new ModelAndView("json_").addObject("param", result);
	}
}
