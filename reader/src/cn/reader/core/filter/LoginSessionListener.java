package cn.reader.core.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.lang3.StringUtils;

import cn.reader.core.base.BaseAction;
import cn.reader.core.utils.Constants;
import cn.reader.core.utils.UserType;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.SuperAdmin;

/**
 *
 * @author jerry-HJY
 * @time 2016年11月25日-上午11:20:58
 */
public class LoginSessionListener extends BaseAction implements HttpSessionListener{
	
	    private static final long serialVersionUID = 1L;
	    //用户Session
		private static Map<String, HttpSession> sessionList = new HashMap<String, HttpSession>();
		
		@Override
		public void sessionCreated(HttpSessionEvent event) {
			HttpSession session = event.getSession();
			String loginUser = getLoginUserAccount(session);
		
			System.out.println("用户id【" + loginUser  + "】登录成功");
		}

		@Override
		public void sessionDestroyed(HttpSessionEvent event) {
			
			HttpSession session = event.getSession();
			String loginUser = getLoginUserAccount(session);
			//注销在线用户Session
			if(sessionList.containsKey(loginUser)) {
				HttpSession userSession = sessionList.get(loginUser);
				//userSession.invalidate();
				sessionList.remove(loginUser);				
			}
			System.out.println("用户id【" + loginUser  + "】过期，注销成功");
		}

		/**
		 * 添加用户(只保证一个用户只能登录一次)
		 * @param key
		 * @param session
		 */
		public static void putSessionList(String userAccount, HttpSession session) {
			//注销在线用户Session
			if(sessionList.containsKey(userAccount)) {
				HttpSession userSession = sessionList.get(userAccount);
				//判断是否同一个Session
				if(!StringUtils.equals(session.getId(), userSession.getId())) {
					//userSession.invalidate();
					sessionList.remove(userAccount);
					
				}
			}
			sessionList.put(userAccount, session);
			//System.out.println("sessionList@:"+sessionList.toString());
		}
		
		/**
		 * 获取登录账号
		 * @param session
		 * @return
		 */
		private String getLoginUserAccount(HttpSession session) {
			String loginUserAccount = "";
			
			String userType = (String)session.getAttribute(Constants.USERTYPE);
			if(userType != null) {
				//超级管理员
				if(UserType.SUPER_ADMIN.equals(userType)) {
					loginUserAccount = Constants.SUPERADMIN;
				}else {
					Object object = session.getAttribute(Constants.LOGINUSER);
					if(object != null) {
						//普通管理员
						if(object instanceof GeneralAdmin) {
							GeneralAdmin generalAdmin = (GeneralAdmin)object;
							loginUserAccount = generalAdmin.getUserName();
						}else if(object instanceof SuperAdmin) {
							//学校管理员
							SuperAdmin superAdmin = (SuperAdmin) object;
							loginUserAccount = superAdmin.getUserName();
						}
					}
				}
			}
			
			return loginUserAccount;
		}

	

}
