package cn.edu.xaut.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.edu.xaut.bean.ExamPoint;
import cn.edu.xaut.bean.ThinkingAddress;
import cn.edu.xaut.bean.Thinkinginfo;
import cn.edu.xaut.dao.ExamPointMapper;
import cn.edu.xaut.service.ThinkingInfoInterface;
import cn.edu.xaut.serviceImpl.ThinkingAddressSevice;

@Controller
public class thinkingController {
	@Autowired
	private ThinkingInfoInterface thinkingInfoInterface;
	@Autowired
	private ThinkingAddressSevice thinkingAddressSevice;
	@Autowired
	private ExamPointMapper examPointMapper;

	// 展示思维导图，返回json数据串
	@RequestMapping(value = "thinking", method = RequestMethod.GET)
	public String thinking(Model model, HttpServletRequest request) throws Exception {
		int thinkId = Integer.parseInt(request.getParameter("thinkId"));
		Thinkinginfo thinkinginfo = thinkingInfoInterface.selectByPrimaryKey(thinkId);
		List<ThinkingAddress> address = thinkingAddressSevice.selectThinkingAddressByFlag(thinkinginfo.getThinkFlag());
		String jsonStr = "{\"class\":\"go.TreeModel\",\"nodeDataArray\":";
		String jsonString = JSON.toJSONString(address);
		jsonStr += jsonString + "}";
		thinkinginfo.setThinkData(jsonStr);
		model.addAttribute("thinkinginfo", thinkinginfo);
		return "thinking";
	}

	// 展示所有思维导图信息，返回所有thinkinginfo数组集合类
	@RequestMapping(value = "thinkAll", method = RequestMethod.GET)
	public String thinkAll(Model model) throws Exception {
		List<Thinkinginfo> selectAll = thinkingInfoInterface.selectAll();
		model.addAttribute("thinkall", selectAll);
		return "showthinking";
	}

	// 返回空思维导图页
	@RequestMapping(value = "thinking_save", method = RequestMethod.GET)
	public String thinking_save(Model model) throws Exception {
		return "thinking_save";
	}

	// 思维导图保存后台，Ajax提交，返回 ajax提示数据
	@ResponseBody
	@RequestMapping(value = "thinking_save", method = RequestMethod.POST) // 保存新的导图
	public String thinking_save(HttpServletRequest request, Thinkinginfo thinkinfo, Model model) throws Exception {
		Base64 base64 = new Base64();
		try {
			// 注意点：实际的图片数据是从 data:image/jpeg;base64, 后开始的
			byte[] k = base64.decode(thinkinfo.getThinkImg().substring("data:image/png;base64,".length()));
			InputStream is = new ByteArrayInputStream(k);
			// 导图图片路径36UUID
			String fileName = UUID.randomUUID().toString();
			// 动态标志32位UUID
			String think_flag = UUID.randomUUID().toString().replaceAll("-", "");
			String realPath = "D:\\onLineStu\\uploadResourse\\thinkingImages\\";
			String imgFilePath = "uploadResources/thinkingImages/" + fileName + ".jpg";
			thinkinfo.setThinkImg(imgFilePath);// 设置图片路径
			thinkinfo.setThinkFlag(think_flag);// 设置动态取值
			@SuppressWarnings("unused")
			int count = thinkingInfoInterface.insertThink(thinkinfo);// 单条插入
			JSONObject jsonObject = JSON.parseObject(thinkinfo.getThinkData());// 转换位置数据json串
			JSONArray jsonArray = jsonObject.getJSONArray("nodeDataArray");
			List<ThinkingAddress> ThinkingAddressList = jsonArray.toJavaList(ThinkingAddress.class);
			List<ExamPoint> ExamPointList = new ArrayList<ExamPoint>();
			// 考点
			String pointColl = "";
			for (ThinkingAddress thinkingAddress : ThinkingAddressList) {
				thinkingAddress.setAddressThinkFlag(think_flag);
				pointColl += thinkingAddress.getParent() + ",";// 获取父类拼串
			}
			thinkingAddressSevice.insertForeach(ThinkingAddressList);// 批量插入
			for (ThinkingAddress thinkingAddress : ThinkingAddressList) {
				if (pointColl.indexOf(thinkingAddress.getKey() + ",") == -1) {
					ExamPoint point = new ExamPoint(thinkingAddress.getText(), think_flag);
					point.setPointThinkFlag(think_flag);
					ExamPointList.add(point);
				}
			}
			examPointMapper.insertForeach(ExamPointList);// 批量插入
			OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(realPath, fileName + ".jpg")));
			IOUtils.copy(is, out);
			out.close();
			is.close();
			model.addAttribute("thinkmsg", "上传成功！");
			return "{\"status\":\"Success\"}";
		} catch (Exception e) {
			model.addAttribute("thinkmsg", "上传失败！");
			e.printStackTrace();
			return "{\"status\":\"error\"}";
		}
	}

	// 思维导图修改后台，Ajax提交，返回 ajax提示数据
	@RequestMapping(value = "thinking_update", method = RequestMethod.POST)
	@ResponseBody // 修改导图
	public String petUpgradeTarget(HttpServletRequest request, Thinkinginfo thinkinfo) {
		Base64 base64 = new Base64();
		try {
			// 注意点：实际的图片数据是从 data:image/jpeg;base64, 后开始的
			byte[] k = base64.decode(thinkinfo.getThinkImg().substring("data:image/png;base64,".length()));
			InputStream is = new ByteArrayInputStream(k);
			// 导图图片路径36UUID
			String fileName = UUID.randomUUID().toString();
			// 动态标志32位UUID
			String think_flag = UUID.randomUUID().toString().replaceAll("-", "");
			// 旧的动态标志32位UUID 从前台的hidden中获取
			String Old_thinkFlag = thinkinfo.getThinkFlag();
			String realPath = "D:\\onLineStu\\uploadResourse\\thinkingImages\\";
			String imgFilePath = "uploadResources/thinkingImages/" + fileName + ".jpg";

			// 先执行address批量插入操作，再更新，最后执行删除操作，
			// BEGIN批量插入
			JSONObject jsonObject = JSON.parseObject(thinkinfo.getThinkData());
			JSONArray jsonArray = jsonObject.getJSONArray("nodeDataArray");
			List<ThinkingAddress> ThinkingAddressList = jsonArray.toJavaList(ThinkingAddress.class);
			List<ExamPoint> ExamPointList = new ArrayList<ExamPoint>();
			// 考点
			String pointColl = "";
			for (ThinkingAddress thinkingAddress : ThinkingAddressList) {
				thinkingAddress.setAddressThinkFlag(think_flag);
				thinkingAddress.setAddressId(null);
				pointColl += thinkingAddress.getParent() + ",";
			}
			thinkingAddressSevice.insertForeach(ThinkingAddressList);//批量插入地址
			for (ThinkingAddress thinkingAddress : ThinkingAddressList) {
				if (pointColl.indexOf(thinkingAddress.getKey()+",") == -1) {
					ExamPoint point = new ExamPoint(thinkingAddress.getText(),think_flag);
					ExamPointList.add(point);
				}
			}
			examPointMapper.insertForeach(ExamPointList);// 批量插入考点
			// END批量插入
			// BEGIN更新
			thinkinfo.setThinkImg(imgFilePath);
			thinkinfo.setThinkFlag(think_flag);
			System.out.println(thinkinfo);
			@SuppressWarnings("unused")
			boolean b = thinkingInfoInterface.updateByPrimaryKey(thinkinfo);// 更新
			// END更新

			// BEGIN删除
			System.out.println("Old_thinkFlag"+Old_thinkFlag);
			@SuppressWarnings("unused")
			boolean c = thinkingAddressSevice.deleteByFlag(Old_thinkFlag.trim());
			@SuppressWarnings("unused")
			int i = examPointMapper.deleteByThinkFlag(Old_thinkFlag.trim());
//			System.out.println("删除了多少条数据"+i+c);
			// END删除
			OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(realPath, fileName + ".jpg")));
			IOUtils.copy(is, out);
			out.close();
			is.close();
			return "{\"status\":\"Success\",\"thinking_flag\":\""+think_flag+"\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"status\":\"error\"}";
		}
	}
}
