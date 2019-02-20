package cn.edu.xaut.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

@Controller
public class FileUploadController {

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFile(@RequestParam("fileName") String fileName,
			@RequestParam("clientFile") MultipartFile clientFile, HttpServletRequest request, HttpSession session) {
		if (!clientFile.isEmpty()) {
			// 在这里就可以对file进行处理了，可以根据自己的需求把它存到数据库或者服务器的某个文件夹
			// 文件存放路径
			@SuppressWarnings("unused")
			String path1 = session.getServletContext().getRealPath("/");
			String path = "C:\\Users\\every\\Desktop\\ssm\\src\\main\\resources\\uploadResources\\images";
			System.out.println(path+"\\"+clientFile.getOriginalFilename());
			// 文件名称
			String name = String.valueOf(new Date().getTime() + "_" + clientFile.getOriginalFilename());
			File destFile = new File(path, name);
			// 转存文件
			try {
				clientFile.transferTo(destFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("vewrvewr");
			}
			 // 访问的url
	        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/uploadResources/images/" + name; 
			request.setAttribute("url",url);
		}
		return "user/succ";
	}
	@RequestMapping(value = "/uploadvideo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public String uploadFile(@RequestParam(value = "upfile", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String realName = null;
		@SuppressWarnings("unused")
		String uuidName = null;
		@SuppressWarnings("unused")
		String realPath = null;
		try {
			if (!file.isEmpty()) {
				// 在这里就可以对file进行处理了，可以根据自己的需求把它存到数据库或者服务器的某个文件夹
				// 文件存放路径
				String path = "C:\\Users\\every\\Desktop\\onLineStu\\src\\main\\resources\\uploadResources\\videos";
				System.out.println(path+"\\"+file.getOriginalFilename());
				// 文件名称
				realName = String.valueOf(new Date().getTime() + "_" + file.getOriginalFilename());
				File destFile = new File(path, realName);
				// 转存文件
				file.transferTo(destFile);
				 // 访问的url
		        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/uploadResources/videos/" + realName; 
				request.setAttribute("url",url);
			}
			int flag =1;
			if (flag != 0) {
				map.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
				map.put("url", "uploadResources/videos/" + realName); // 能访问到你现在图片的路径 这里
				map.put("title", realName);
				map.put("size", file.getSize());
			}
			System.out.println(map);
		} catch (IOException e) {
			map.put("state", "文件上传失败!"); // 在此处写上错误提示信息，这样当错误的时候就会显示此信息
			map.put("url", "");
			map.put("title", "");
			map.put("original", "");
			map.put("size", file.getSize());
			e.printStackTrace();
		}
		  String jStr = JSON.toJSONString(map);
		return jStr;
	}
}