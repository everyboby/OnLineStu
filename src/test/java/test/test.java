package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.xaut.bean.Userinfo;

public class test {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		Userinfo bean = (Userinfo) ac.getBean(Userinfo.class);
		System.out.println(bean);
//		bean.getUserInfoById(10001L);
	}
}
