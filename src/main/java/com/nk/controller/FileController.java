package com.nk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nk.util.Rename_String;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/file")
public class FileController {
	private static final Logger LOG = Logger.getLogger(FileController.class);

	@RequestMapping("/personalPhoto_upload")
	@ResponseBody
	public String personalPhoto_upload(String photo_name, HttpServletRequest request,
			@RequestParam("file") MultipartFile mfile) throws Exception {
		LOG.info("personalPhoto_upload...............   " + photo_name);
		String originalFilename = mfile.getOriginalFilename();
		String realPath = request.getSession().getServletContext().getRealPath("/images");
		String rename = Rename_String.rename(originalFilename);
		System.out.println(rename + "  -------------");
		String target = realPath + "/" + rename;
		LOG.info(mfile.getOriginalFilename() + "     新文件");
		// String target = realPath + "/" + rename;
		mfile.transferTo(new File(target));
		return rename;
	}


	// 下载（更加通用的方法）
	@RequestMapping("/download")
	public void download(String fileName, HttpServletResponse resp, HttpSession session)
			throws IllegalStateException, IOException {
		LOG.info("download...");
		// 下载时文件名会乱码或不显示，进行转码
		String downloadFielName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		// 设置响应的内容类型为流的方式
		resp.setContentType("application/octet-stream");
		// 让服务器告诉浏览器它发送的数据属于什么文件类型（流）
		resp.setHeader("content-type", "application/octet-stream");
		// 告诉浏览器这个文件的类型和名字(attachment--以附件的方式)
		resp.setHeader("Content-Disposition", "attachment;filename=" + downloadFielName);
		String realPath = session.getServletContext().getRealPath("images");
		// 有文件上传
		FileInputStream fis = new FileInputStream(realPath + "/" + fileName);
		ServletOutputStream os = resp.getOutputStream();
		int len = 0;
		// 自定义缓冲区（缓冲区的大小为1024）,经典写法
		byte[] b = new byte[1024];
		while ((len = fis.read(b)) != -1) {
			os.write(b, 0, len);
		}
		os.close();
		fis.close();
	}

}
