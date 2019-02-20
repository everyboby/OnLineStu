package cn.edu.xaut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.xaut.bean.FromArts;
import cn.edu.xaut.bean.FromClass;
import cn.edu.xaut.bean.FromSign;
import cn.edu.xaut.bean.FromSubject;
import cn.edu.xaut.bean.FromTime;
import cn.edu.xaut.service.ExamPointInterface;
import cn.edu.xaut.service.FromArtsInterface;
import cn.edu.xaut.service.FromClassInterface;
import cn.edu.xaut.service.FromSignInterface;
import cn.edu.xaut.service.FromSubjectInterface;
import cn.edu.xaut.service.FromTimeInterface;

@Controller
public class selectOptions {
	@Autowired
	private FromArtsInterface FromArtsInterface;
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

	@RequestMapping(value = "preSelect", method = RequestMethod.GET)
	public String preSelect(Model model, HttpServletRequest request) throws Exception {
		List<FromSign> selectAllSign = FromSignInterface.selectAllSign();
		List<FromTime> selectAllTime = FromTimeInterface.selectAllTime();
		List<FromSubject> selectAllSubject = FromSubjectInterface.selectAllSubject();
		List<FromClass> selectAllClass = FromClassInterface.SelectAllClass();
		model.addAttribute("selectAllSign",selectAllSign);
		model.addAttribute("selectAllTime",selectAllTime);
		model.addAttribute("selectAllSubject",selectAllSubject);
		model.addAttribute("selectAllClass",selectAllClass);
		return "knowleage_manager";
	}
	
	// 卷标AD
	@ResponseBody
	@RequestMapping(value = "sign_add", method = RequestMethod.GET)
	public String sign_add(Model model, HttpServletRequest request) throws Exception {
		String signname = request.getParameter("artname");
		FromSign fromSign = new FromSign(signname);
		FromSignInterface.insertSelective(fromSign);
		return "Success";
	}

	@ResponseBody
	@RequestMapping(value = "sign_del", method = RequestMethod.GET)
	public String sign_del(Model model, HttpServletRequest request) throws Exception {
		String[] delsign = request.getParameterValues("delsign");
		if (delsign != null && delsign.length > 0) {
			for (String string : delsign) {
				System.out.println(string);
				boolean flag = FromSignInterface.deleteByPrimaryKey(Integer.parseInt(string));
				if (flag) {
					continue;
				} else {
					return "error";
				}
			}
			return "Success";
		} else {
			return "error";
		}
	}

	// 时间出处Ad
	@ResponseBody
	@RequestMapping(value = "time_add", method = RequestMethod.GET)
	public String time_add(Model model, HttpServletRequest request) throws Exception {
		String datename = request.getParameter("indate");
		FromTime fromTime = new FromTime(datename);
		FromTimeInterface.insertTimeSelective(fromTime);
		return "Success";
	}
	@ResponseBody
	@RequestMapping(value = "time_del", method = RequestMethod.POST)
	public String time_del(Model model, HttpServletRequest request) throws Exception {
		String[] deldate = request.getParameterValues("deldate");
		if (deldate != null && deldate.length > 0) {
			for (String string : deldate) {
				System.out.println(string);
				boolean flag = FromTimeInterface.deleteTimeByPrimaryKey(Long.valueOf(string));
				if (flag) {
					continue;
				} else {
					return "error";
				}
			}
			return "Success";
		} else {
			return "error";
		}
	}

	// 分科AD
	@ResponseBody
	@RequestMapping(value = "arts_add", method = RequestMethod.GET)
	public String arts_add(Model model, HttpServletRequest request) throws Exception {
		FromArts fromArts = new FromArts();
		FromArtsInterface.insertSelective(fromArts);
		return "Success";
	}
	@ResponseBody
	@RequestMapping(value = "arts_del", method = RequestMethod.GET)
	public String arts_del(Model model, HttpServletRequest request) throws Exception {
		FromArts fromArts = new FromArts();
		FromArtsInterface.deleteByPrimaryKey(fromArts);
		return "Success";
	}

	// 科目AD
	@ResponseBody
	@RequestMapping(value = "sub_add", method = RequestMethod.GET)
	public String sub_add(Model model, HttpServletRequest request) throws Exception {
		String subname = request.getParameter("subname");
		FromSubject fromSubject = new FromSubject(subname);
		FromSubjectInterface.insertSelective(fromSubject);
		return "Success";
	}
	@ResponseBody
	@RequestMapping(value = "sub_del", method = RequestMethod.GET)
	public String sub_del(Model model, HttpServletRequest request) throws Exception {
		String[] delsubject = request.getParameterValues("delsubject");
		if (delsubject != null && delsubject.length > 0) {
			for (String string : delsubject) {
				boolean flag = FromSubjectInterface.deleteByPrimaryKey(Integer.parseInt(string));
				if (flag) {
					continue;
				} else {
					return "error";
				}
			}
			return "Success";
		} else {
			return "error";
		}
	}

	// 删除AD
	@ResponseBody
	@RequestMapping(value = "point_del", method = RequestMethod.GET)
	public String point_del(Model model, HttpServletRequest request) throws Exception {
		String[] delpoint = request.getParameterValues("delpoint");
		if (delpoint != null && delpoint.length > 0) {
			for (String string : delpoint) {
				System.out.println(string);
				int flag = ExamPointInterface.deleteById(Integer.parseInt(string));
				if (flag>0) {
					continue;
				} else {
					return "error";
				}
			}
			return "Success";
		} else {
			return "error";
		}
	}
	@ResponseBody
	@RequestMapping(value = "class_add", method = RequestMethod.GET)
	public String class_add(Model model, HttpServletRequest request) throws Exception {
		String classname = request.getParameter("classname");
		FromClassInterface.insertSelective(new FromClass(classname));
		return "Success";
	}
	@ResponseBody
	@RequestMapping(value = "class_del", method = RequestMethod.GET)
	public String class_del(Model model, HttpServletRequest request) throws Exception {
		FromClassInterface.deleteByPrimaryKey(0);
		String[] delclass = request.getParameterValues("delclass");
		if (delclass != null && delclass.length > 0) {
			for (String string : delclass) {
				int flag = FromClassInterface.deleteByPrimaryKey(Integer.parseInt(string));
				if (flag>0) {
					continue;
				} else {
					return "error";
				}
			}
			return "Success";
		} else {
			return "error";
		}
	}
}
