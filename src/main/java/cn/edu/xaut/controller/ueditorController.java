package cn.edu.xaut.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.xaut.bean.ExamPoint;
import cn.edu.xaut.bean.FromClass;
import cn.edu.xaut.bean.FromSign;
import cn.edu.xaut.bean.FromSubject;
import cn.edu.xaut.bean.FromTime;
import cn.edu.xaut.bean.Questinfo;
import cn.edu.xaut.service.ExamPointInterface;
import cn.edu.xaut.service.FromClassInterface;
import cn.edu.xaut.service.FromSignInterface;
import cn.edu.xaut.service.FromSubjectInterface;
import cn.edu.xaut.service.FromTimeInterface;
import cn.edu.xaut.service.QuestInfoInterface;

@Controller
public class ueditorController {

	@Autowired
	private QuestInfoInterface questInfoInterface;
	@Autowired
	private FromSignInterface FromSignInterface;
	@Autowired
	private FromTimeInterface FromTimeInterface;
	@Autowired
	private FromSubjectInterface FromSubjectInterface;
	@Autowired
	private ExamPointInterface ExamPointInterface;
	@Autowired
	private FromClassInterface FromClassInterface;

	@RequestMapping(value = "questinfo", method = RequestMethod.GET)
	public String ueditor(Model model,HttpServletRequest req) throws Exception {
		List<FromSign> selectAllSign = FromSignInterface.selectAllSign();
		System.out.println(selectAllSign);
		List<FromTime> selectAllTime = FromTimeInterface.selectAllTime();
		System.out.println(selectAllTime);
		List<FromSubject> selectAllSubject = FromSubjectInterface.selectAllSubject();
		System.out.println(selectAllSubject);
		List<FromClass> selectAllClass = FromClassInterface.SelectAllClass();
		System.out.println(selectAllClass);
		model.addAttribute("selectAllSign", selectAllSign);
		model.addAttribute("selectAllTime", selectAllTime);
		model.addAttribute("selectAllSubject", selectAllSubject);
		model.addAttribute("selectAllClass", selectAllClass);
		String SelectPoint = req.getParameter("selectpoint");
		System.out.println(SelectPoint);
		model.addAttribute("selectpoint",SelectPoint);
		return "quest_info";
	}
	
	//更新旧的题目考点
	@ResponseBody
	@RequestMapping(value = "updatePoint", method = RequestMethod.POST)
	public String updatePoint(Model model, HttpServletRequest request) {
		try {
			String newPoint = request.getParameter("alreadyUpdatePoint2");
			String oldPoint = request.getParameter("show");
			if (oldPoint != "" && oldPoint != null && newPoint != "" && newPoint != null) {
				Questinfo questinfo = new Questinfo();
				questinfo.setQuestPoint(oldPoint);
				List<Questinfo> questByOldPoint = questInfoInterface.selectByAnyCondition(questinfo);
				if (questByOldPoint != null && questByOldPoint.size() > 0)
					for (Questinfo questinfo2 : questByOldPoint) {
						String[] split = questinfo2.getQuestPoint().split(",");
						String str ="";
						for (int i = 0; i < split.length; i++) {
							if(split[i].equals(oldPoint))
								 str+=newPoint+",";
							else
								str+=split[i]+",";
						}
						str=str.substring(0, str.length()-1);
						questinfo2.setQuestPoint(str);
						questInfoInterface.updateByPrimaryKeyWithBLOBs(questinfo2);
					}
				return "{\"status\":\"Success\"}";
			} else {
				return "{\"status\":\"Error\"}";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"status\":\"Error\"}";
		}
	}


	@RequestMapping(value = "questFindAll", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questFindAll(@RequestBody Questinfo questinfo, Model model) {
		System.out.println(questinfo);
		if(questinfo.getQuestFromArts().equals("文科理科"))
			questinfo.setQuestFromArts(null);
		List<Questinfo> questinfoBycon = questInfoInterface.selectByAnyCondition(questinfo);
		System.out.println(questinfoBycon);
		return questinfoBycon;
	}

	@RequestMapping(value = "questPageAll", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questPageAll(@RequestBody Questinfo questinfo, Model model) {
		Integer pageSize = 7;// 每页显示记录数
		// 分页查询
		Integer pageNo = questinfo.getQuestId().intValue();
		PageHelper.startPage(pageNo, pageSize);
		System.out.println(pageNo + pageSize);
		if(questinfo.getQuestFromArts().equals("文科理科"))
			questinfo.setQuestFromArts(null);
		System.out.println(questinfo);
		List<Questinfo> questinfoBycon = questInfoInterface.selectByAnyCondition(questinfo);
		PageInfo<Questinfo> pageInfo = new PageInfo<Questinfo>(questinfoBycon);
		System.out.println(questinfoBycon);
		// System.out.println(pageInfo);
		return pageInfo;
	}

	@RequestMapping(value = "newueditor", method = RequestMethod.GET)
	public String newueditor(Model model) throws Exception {
		List<FromSign> selectAllSign = FromSignInterface.selectAllSign();
		System.out.println(selectAllSign);
		List<FromTime> selectAllTime = FromTimeInterface.selectAllTime();
		System.out.println(selectAllTime);
		List<FromSubject> selectAllSubject = FromSubjectInterface.selectAllSubject();
		System.out.println(selectAllSubject);
		List<ExamPoint> selectAllPoint = ExamPointInterface.selectAllPoint();
		System.out.println(selectAllPoint);
		List<FromClass> selectAllClass = FromClassInterface.SelectAllClass();
		System.out.println(selectAllClass);
		model.addAttribute("selectAllSign", selectAllSign);
		model.addAttribute("selectAllTime", selectAllTime);
		model.addAttribute("selectAllSubject", selectAllSubject);
		model.addAttribute("selectAllPoint", selectAllPoint);
		model.addAttribute("selectAllClass", selectAllClass);
		return "question_new";
	}

	// 新建
	@RequestMapping(value = "newueditor", method = RequestMethod.POST)
	public String newueditor(@ModelAttribute("questinfo") Questinfo quest, HttpServletRequest req, Errors errors,
			Model model) throws Exception {
		String quest_point = "";
		try {
			// 获取考点数组
			String[] quest_point_Sum = req.getParameterValues("quest_point_Sum");
			if (quest_point_Sum.length > 1) {
				for (String string : quest_point_Sum) {
					if (string.length() > 0)
						quest_point += string + ",";
				}
				quest_point = quest_point.substring(0, quest_point.length() - 1);// 考点拼串
			}
			System.out.println(quest_point);
			System.out.println(quest);
			// 过滤视频信息，重新赋值题干或者解析，重新赋值视频url
			Questinfo regexRet = regexRet(quest);
			regexRet.setQuestId(null);
			// 给考点属性赋值拼串
			regexRet.setQuestPoint(quest_point);
			System.out.println(regexRet);
			// 插入questinfo
			Long questId = questInfoInterface.insertSelective(regexRet);
			System.out.println("插入ID" + questId);
		} catch (Exception e) {
			model.addAttribute("msg", "上传失败！");
			e.printStackTrace();
			return "redirect:newueditor.do";
		}
		return "redirect:newueditor.do";
	}

	// 编辑
	@RequestMapping(value = "ueditor", method = RequestMethod.POST)
	public String ueditor(@ModelAttribute("questinfo") Questinfo quest, HttpServletRequest req, Errors errors,
			Model model) {
		String quest_point = "";
		try {
			String[] quest_point_Sum = req.getParameterValues("quest_point_Sum");
			if (quest_point_Sum.length > 1) {
				for (String string : quest_point_Sum) {
					if (string.length() > 0)
						quest_point += string + ",";
				}
				quest_point = quest_point.substring(0, quest_point.length() - 1);
			}
			System.out.println(quest_point);
			System.out.println(quest);
			Questinfo regexRet = regexRet(quest);
			regexRet.setQuestPoint(quest_point);
			System.out.println(regexRet);
			boolean questId = questInfoInterface.updateByPrimaryKeyWithBLOBs(regexRet);
			System.out.println("插入ID" + questId);
			HttpSession session = req.getSession();
			// 将当前题目编号放在session，在跳转至编辑页读取题目信息
			session.setAttribute("localquestId", questId);
		} catch (Exception e) {
			model.addAttribute("msg", "上传失败！");
			e.printStackTrace();
			return "redirect:showEdit.do?questId=" + quest.getQuestId();
		}
		return "redirect:showEdit.do?questId=" + quest.getQuestId();
	}

	@RequestMapping(value = "showdetails", method = RequestMethod.GET)
	public String showdetails(Model model, HttpServletRequest req) throws Exception {
		List<FromSign> selectAllSign = FromSignInterface.selectAllSign();
		System.out.println(selectAllSign);
		List<FromTime> selectAllTime = FromTimeInterface.selectAllTime();
		System.out.println(selectAllTime);
		List<FromSubject> selectAllSubject = FromSubjectInterface.selectAllSubject();
		System.out.println(selectAllSubject);
		List<ExamPoint> selectAllPoint = ExamPointInterface.selectAllPoint();
		System.out.println(selectAllPoint);
		List<FromClass> selectAllClass = FromClassInterface.SelectAllClass();
		System.out.println(selectAllClass);
		model.addAttribute("selectAllSign", selectAllSign);
		model.addAttribute("selectAllTime", selectAllTime);
		model.addAttribute("selectAllSubject", selectAllSubject);
		model.addAttribute("selectAllPoint", selectAllPoint);
		model.addAttribute("selectAllClass", selectAllClass);

		Long questId = Long.parseLong(req.getParameter("questId"));
		System.out.println("request中的id" + questId);
		Questinfo questinfo = questInfoInterface.selectByPrimaryKey(questId);
		System.out.println(questinfo);
		model.addAttribute("questinfo", questinfo);
		return "question_details";
	}

	@RequestMapping(value = "showEdit", method = RequestMethod.GET)
	public String showEdit(Model model, HttpServletRequest req) throws Exception {
		List<FromSign> selectAllSign = FromSignInterface.selectAllSign();
		System.out.println(selectAllSign);
		List<FromTime> selectAllTime = FromTimeInterface.selectAllTime();
		System.out.println(selectAllTime);
		List<FromSubject> selectAllSubject = FromSubjectInterface.selectAllSubject();
		System.out.println(selectAllSubject);
		List<ExamPoint> selectAllPoint = ExamPointInterface.selectAllPoint();
		System.out.println(selectAllPoint);
		List<FromClass> selectAllClass = FromClassInterface.SelectAllClass();
		System.out.println(selectAllClass);
		model.addAttribute("selectAllSign", selectAllSign);
		model.addAttribute("selectAllTime", selectAllTime);
		model.addAttribute("selectAllSubject", selectAllSubject);
		model.addAttribute("selectAllPoint", selectAllPoint);
		model.addAttribute("selectAllClass", selectAllClass);

		Long questId = 0L;
		String quest_id = req.getParameter("questId");
		if (quest_id != null && quest_id.length() > 0)
			questId = Long.parseLong(quest_id);
		else {
			HttpSession session = req.getSession();
			// 将当前题目编号放在session，在跳转至编辑页读取题目信息
			questId = (Long) session.getAttribute("localquestId");
		}

		System.out.println("获取request或者session中的id" + questId);
		Questinfo questinfo = questInfoInterface.selectByPrimaryKey(questId);
		System.out.println(questinfo);
		model.addAttribute("questinfo", questinfo);
		return "question_edit";
	}

	@ResponseBody
	@RequestMapping(value = "delQuest", method = RequestMethod.GET)
	public String delQuest(Model model, HttpServletRequest req) throws Exception {
		Long questId = Long.parseLong(req.getParameter("questId"));
		System.out.println("request中的id" + questId);
		boolean questinfo = questInfoInterface.deleteByPrimaryKey(questId);
		System.out.println(questinfo);
		return "Success";
	}

	public Questinfo regexRet(Questinfo quest) {
		if (quest.getQuestContent() != null && quest.getDetail_analysis() != null) {
			// 过滤视频信息
			String reg = "<video.*src=\"(.*)\".* type=\"video/mp4\"/></video>";
			Pattern compile = Pattern.compile(reg);
			Matcher matcher1 = compile.matcher(quest.getQuestContent());
			Matcher matcher2 = compile.matcher(quest.getDetail_analysis());
			String quest_videoUrl = "";
			if (matcher1.find()) {
				quest_videoUrl = matcher1.group(1);
				System.out.println("匹配题干" + quest_videoUrl);
				String questContent = quest.getQuestContent().replaceAll(reg, " ");
				// 重新赋值题干
				quest.setQuestContent(questContent);
			} else if (matcher2.find()) {
				quest_videoUrl = matcher2.group(1);
				System.out.println("匹配题干" + quest_videoUrl);
				String Detail_analysis = quest.getDetail_analysis().replaceAll(reg, " ");
				// 重新赋值题目解析
				quest.setDetail_analysis(Detail_analysis);
			} else {
				System.out.println("都没有匹配到");
			}
			// 过滤的视频url赋值
			quest.setQuest_videoUrl(quest_videoUrl);
		}
		return quest;
	}
}
