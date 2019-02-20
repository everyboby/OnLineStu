package cn.edu.xaut.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

import cn.edu.xaut.bean.Image;

@Controller
public class ImageController {

	// @Autowired
	// private ImageService imageService;

	@RequestMapping(value = "/uploadimage", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public String uploadFile(@RequestParam(value = "upfile", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String realName = null;
		String uuidName = null;
		String realPath = null;
		try {
			System.out.println("上传图片");
			Image image = new Image();
			// 文件原来的名称
			realName = getRealName(file.getOriginalFilename());
			// 得到这个文件的uuidname
			uuidName = this.getUUIDFileName(file.getOriginalFilename());
			// 图片保存的工程
			// realPath = request.getServletContext().getRealPath("/images");
			// 真实路径
			// String roolPath =
			// request.getSession().getServletContext().getRealPath("/");

			// 这里测试的是 把图片不存在 发布目录下
			realPath = "C:\\Users\\every\\Desktop\\onLineStu\\src\\main\\resources\\uploadResources\\images";

			image.setName(realName);
			image.setUrl(realPath);
			image.setUuidName(uuidName);

			// 得到文件的输入流
			InputStream in = new BufferedInputStream(file.getInputStream());

			OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(realPath, uuidName)));

			int flag = IOUtils.copy(in, out);
			in.close();
			out.close();


			if (flag != 0) {
				map.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
				map.put("url", "uploadResources/images/" + uuidName); // 能访问到你现在图片的路径 这里
				map.put("title", uuidName);
				map.put("original", "realName");
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

	private String getExtName(String s, char split) {
		int i = s.lastIndexOf(split);
		int leg = s.length();
		return i > 0 ? (i + 1) == leg ? " " : s.substring(i + 1, s.length()) : " ";
	}

	private String getUUIDFileName(String fileName) {
		UUID uuid = UUID.randomUUID();
		StringBuilder sb = new StringBuilder(100);
		sb.append(uuid.toString()).append(".").append(this.getExtName(fileName, '.'));
		return sb.toString();
	}

	private String getRealName(String originalName) {

		if (originalName.contains(".")) {
			String[] as = originalName.split("\\.");
			return as[0];
		} else {
			return originalName;
		}

	}

}