package cn.shop.sys.action;

import java.io.PrintWriter;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import cn.shop.core.base.BaseAction;
import cn.shop.core.filter.LoginSessionListener;
import cn.shop.core.utils.Constants;
import cn.shop.core.utils.MD5Utils;
import cn.shop.core.utils.UserType;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.SuperAdmin;
import cn.shop.sys.service.LoginService;

/**
 * 登陆Action
 * 
 * @author ozy
 *
 */
@Action(value = "LoginAction")
@Scope("prototype")
@Results(value = {
		@Result(name = "main", location = "/model/manager/common/main.jsp"),
		@Result(name = "login", type = "redirect", location = "/login.jsp"),
		@Result(name = "login_font", type = "redirect", location = "/model/front/demo/front_login.jsp"),
		@Result(name = "front_main", location = "/shopLogin.jsp"), })
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(LoginAction.class);

	private String userName;

	private String passWord;

	// 登陆service
	@Resource
	private LoginService loginService;

	/**
	 * 登陆
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {

		String resultState = "error";
		PrintWriter out = null;
		try {
			userName = StringUtils.trim(userName);
			String md5Passwrod = MD5Utils
					.encryption(StringUtils.trim(passWord));
			// 超级管理员
			SuperAdmin superAdmin = this.loginService.findSuperAdmin(userName);
			if (superAdmin != null) {
				if (StringUtils.equals(superAdmin.getUserName(), userName)) {
					if (StringUtils.equals(superAdmin.getPassWord(),
							md5Passwrod)) {
						this.session.setAttribute(Constants.LOGINUSER,
								superAdmin);
						this.session.setAttribute(Constants.USERTYPE,
								UserType.SUPER_ADMIN);
						resultState = "success";
					}
				}
			} else {
				// 普通管理员
				GeneralAdmin generalAdmin = this.loginService
						.findGeneralAdmin(userName);
				if (generalAdmin != null) {
					if (StringUtils
							.equals(generalAdmin.getUserName(), userName)) {
						if (StringUtils.equals(generalAdmin.getPassWord(),
								md5Passwrod)) {
							this.session.setAttribute(Constants.LOGINUSER,
									generalAdmin);
							this.session.setAttribute(Constants.USERTYPE,
									UserType.GENERAL_ADMIN);
							resultState = "success";
						}
					}
				}
			}
			// 放到sessionList中，监听Session过期
			if (StringUtils.equals("success", resultState)) {
				LoginSessionListener
						.putSessionList(this.userName, this.session);
			}
			out = this.response.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			resultState = "error";
		} finally {
			out.write(resultState);
			out.close();
		}
		return null;
	}


	/**
	 * 登出
	 * 
	 * @return
	 * @throws Exception
	 */
	public String logOut() throws Exception {
		this.session.invalidate();
		return "login";
	}

	/**
	 * @author jerry-HJY
	 * @return
	 * @throws Exception
	 */
	public String logOut_font() throws Exception {
		this.session.invalidate();
		return "login_font";
	}

	/**
	 * 根据角色 跳转主页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String forward() throws Exception {

		return "main";
	}

	/**
	 * 根据角色 跳转游客主页面
	 * @author jerry-HJY
	 * @return
	 * @throws Exception
	 */
	public String forward_front() throws Exception {

		return "front_main";
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}
