package cn.edu.xaut.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

import cn.edu.xaut.bean.ExamPoint;
import cn.edu.xaut.service.ExamPointInterface;

@Controller
public class PointController {
	@Autowired
	private ExamPointInterface ExamPointInterface;

	@RequestMapping(value = "selectPointByCon", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object selectPointByCon(@RequestBody String reqWord, Model model) {
		System.out.println(reqWord);
		List<ExamPoint> selectAllPoint = ExamPointInterface.selectPointByCon(reqWord);
		return selectAllPoint;
	}
	
	@RequestMapping(value = "selectById", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object selectById(@RequestBody Long pointId, Model model) {
		System.out.println(pointId);
		ExamPoint selectPoint = ExamPointInterface.selectByPrimaryKey(pointId);
		return selectPoint;
	}

	@RequestMapping(value = "/upl_point_vi", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public String upl_point_vi(@RequestParam(value = "upfile", required = false) MultipartFile file,@RequestParam(value = "pointid", required = false) Long pointId,
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
				String path = "D:\\onLineStu\\uploadResourse\\pointvideos";
				System.out.println(path+"\\"+file.getOriginalFilename());
				// 文件名称
				realName = String.valueOf(new Date().getTime() + "_" + file.getOriginalFilename());
				File destFile = new File(path, realName);
				// 转存文件
				file.transferTo(destFile);
				 // 访问的url
		        @SuppressWarnings("unused")
				String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/uploadResources/videos/" + realName; 
			}
			boolean flag =updatePointById(pointId,"uploadResources/pointvideos/" + realName);
			if (flag) {
				map.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
				map.put("url", "uploadResources/pointvideos/" + realName); // 能访问到你现在图片的路径 这里
				map.put("title", realName);
				map.put("size", file.getSize());
			}else{
				map.put("state", "文件上传失败!");
				map.put("url", "");
				map.put("title", "");
				map.put("original", "");
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
	@RequestMapping(value = "upl_point_vi", method = RequestMethod.GET) // 表示如果是get请求的login.do则调用这个方法
	public String upl_point_vi(Model model) throws Exception {// 依靠处理适配器RequestMappingHandlerAdapter调用这个方法
		// 可以将model理解为request的attribute作用域，用于采用request向页面传递数据
		return "uploadvideo";// 逻辑地址名，需要依靠视图解析器InternalResourceViewResolver将其转换为物理地址
	}
	private boolean updatePointById(Long pointId,String url){
		ExamPoint examPoint = new ExamPoint();
		examPoint.setPointId(pointId);
		examPoint.setPointVideourl(url);
		return ExamPointInterface.updateByPrimaryKey(examPoint)>0;
	}
}
