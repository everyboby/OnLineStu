package cn.edu.xaut.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.edu.xaut.bean.Userinfo;

@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest  req=(HttpServletRequest) request;
		Userinfo loginUser = (Userinfo) req.getSession().getAttribute("loginUser");
//		System.out.println(loginUser);
		 //访问login.jsp时，才放过，并且login.jsp的后续操作，继续执行，不拦截
		String servletPath = req.getServletPath();
//		System.out.println("++"+servletPath);
        if (servletPath.equals("/signin.jsp")||servletPath.equals("/login.do")) {
            chain.doFilter(req, res);
            System.out.println("fangle");
		}else {
			if(loginUser==null){
//				System.out.println("----"+contextPath);
	 	        response.setCharacterEncoding("utf-8");
			    request.setCharacterEncoding("utf-8");
				request.setAttribute("msg","当前未登录，请先登陆");
				//否则拦截，跳转指定的页面
				System.out.println("未登录");
				req.getRequestDispatcher("signin.jsp").forward(req, res);
			}else{
				System.out.println("一登陆");	
				chain.doFilter(req, res);
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
