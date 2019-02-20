package cn.edu.xaut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.xaut.bean.Userinfo;
import cn.edu.xaut.service.UserInfoInterface;

@Controller
@RequestMapping(value = "/")
public class UserController {
	@Autowired
	private UserInfoInterface userInfoInterface;

	@RequestMapping(value = "login", method = RequestMethod.GET) // 表示如果是get请求的login.do则调用这个方法
	public String login(Model model) throws Exception {// 依靠处理适配器RequestMappingHandlerAdapter调用这个方法
		// 可以将model理解为request的attribute作用域，用于采用request向页面传递数据
		return "forward:signin.jsp";// 逻辑地址名，需要依靠视图解析器InternalResourceViewResolver将其转换为物理地址
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) throws Exception {
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		HttpSession session = request.getSession();
		Userinfo userinfo = null;
		try {
			if (userName != null && userName != "") {
				userinfo = userInfoInterface.selectByUserName(userName);
				if (userinfo != null && userPwd != null && userinfo.getUserPwd().equals(userPwd)) {
					session.setAttribute("loginUser", userinfo);
					return "index";
				} else {
					model.addAttribute("msg", "登录失败！请重新登录");
					return "forward:signin.jsp";
				}
			} else {
				model.addAttribute("msg", "登录失败！请重新登录");
				return "forward:signin.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:signin.jsp";
	}

	@RequestMapping(value = "user_manager", method = RequestMethod.GET)
	public String showUser(Model model,
			@RequestParam(defaultValue = "1", required = true, value = "pageNo") Integer pageNo) throws Exception {
		Integer pageSize = 3;// 每页显示记录数
		// 分页查询
		PageHelper.startPage(pageNo, pageSize);
		List<Userinfo> allUsers = userInfoInterface.selectAll();// 获取所有用户信息
		PageInfo<Userinfo> pageInfo = new PageInfo<Userinfo>(allUsers);
		model.addAttribute("allUsers", pageInfo);
		return "user_manager";
	}

	@RequestMapping(value = "delUser", method = RequestMethod.GET)
	public String delUser(Model model,HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		Userinfo userinfo = (Userinfo) session.getAttribute("loginUser");
		if("1".equals(userinfo.getUserIsroot())){
			String delid = req.getParameter("delid");
			@SuppressWarnings("unused")
			boolean delete = userInfoInterface.delete(Long.valueOf(delid));
		}else{
			session.setAttribute("msg","2");
			}
		return "redirect:user_manager.do?";
	}

	@RequestMapping(value = "loginshow", method = RequestMethod.GET)
	public String loginshow(Model model) throws Exception {
		return "index";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "forward:signin.jsp";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, Userinfo userinfo) throws Exception {
		HttpSession session = request.getSession();
		try {
			String addroot = request.getParameter("addroot");
			String[] addpower = request.getParameterValues("addpower");
			int power = 0;
			if (addroot == null) {
				userinfo.setUserIsroot("0");
				if (addpower != null) {
					for (String string : addpower) {
						power += Integer.parseInt(string);
					}
					userinfo.setUserPower("" + power);
				} else
					userinfo.setUserPower("0");
			} else {
				userinfo.setUserIsroot("1");
				userinfo.setUserPower("7");
			}
			userInfoInterface.insertSelective(userinfo);
			session.setAttribute("msg", "添加成功！");
		} catch (Exception e) {
			session.setAttribute("msg", "添加失败！");
			e.printStackTrace();
		}
		return "redirect:user_manager.do";
	}

	@RequestMapping(value = "editUser", method = RequestMethod.POST)
	public String editUser(Model model, HttpServletRequest request, Userinfo userinfo) throws Exception {
		HttpSession session = request.getSession();
		try {
			String addroot = request.getParameter("addroot");
			String[] addpower = request.getParameterValues("addpower");
			int power = 0;
			if (addroot == null) {
				userinfo.setUserIsroot("0");
				if (addpower != null) {
					for (String string : addpower) {
						power += Integer.parseInt(string);
					}
					userinfo.setUserPower("" + power);
				} else
					userinfo.setUserPower("0");
			} else {
				userinfo.setUserIsroot("1");
				userinfo.setUserPower("7");
			}
			userInfoInterface.updateByPrimaryKey(userinfo);
			session.setAttribute("msg", "编辑成功！");
		} catch (Exception e) {
			session.setAttribute("msg", "编辑失败！");
			e.printStackTrace();
		}
		return "redirect:user_manager.do";
	}
}
