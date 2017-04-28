package cn.shop.core.utils;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.shop.core.base.BaseEntity;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.SuperAdmin;

/**
 *
 * @author jerry-HJY
 * @time 2016年11月23日-上午11:34:03
 */
public class AppContext {
	/**
	 * 设置实体创建信息
	 * @param entity
	 */
	public static void setEntityInfo(BaseEntity entity) {
		if(entity.getId() == null || "".equals(entity.getId())) {
			setAddEntityInfo(entity);
		}else {
			setModifyEntityInfo(entity);
		}
	}
	
	/**
	 * 设置创建者信息
	 */
	private static void setAddEntityInfo(BaseEntity baseEntity) {
		baseEntity.setCreateDate(new Date());
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request == null) {
			return;
		}
		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute(Constants.USERTYPE);
		if(userType != null) {
			//超级管理员
			if(UserType.SUPER_ADMIN.equals(userType)) {
				baseEntity.setCreateName(Constants.SUPERADMIN);
				
			}else {
				Object object = session.getAttribute(Constants.LOGINUSER);
				if(object != null) {
					//普通管理员
					if(object instanceof GeneralAdmin) {
						GeneralAdmin generalAdmin = (GeneralAdmin)object;
						baseEntity.setCreateId(generalAdmin.getId());
						baseEntity.setCreateName(generalAdmin.getUserName());
					
					}else if(object instanceof SuperAdmin){
						//超级管理员
						SuperAdmin superAdmin = (SuperAdmin) object;
						baseEntity.setCreateId(superAdmin.getId());
						baseEntity.setCreateName(superAdmin.getUserName());
					
					}
				}
			}
		}
	}
	
	/**
	 * 设置修改者信息
	 * @param baseEntity
	 */
	private static void setModifyEntityInfo(BaseEntity baseEntity) {
		baseEntity.setModifyDate(new Date());
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request == null) {
			return;
		}
		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute(Constants.USERTYPE);
		if(userType != null) {
			//超级管理员
			if(UserType.SUPER_ADMIN.equals(userType)) {
				baseEntity.setModifyName(Constants.SUPERADMIN);
			}else {
				Object object = session.getAttribute(Constants.LOGINUSER);
				if(object != null) {
					//普通管理员
					if(object instanceof GeneralAdmin) {
						GeneralAdmin generalAdmin = (GeneralAdmin)object;
						baseEntity.setModifyId(generalAdmin.getId());
						baseEntity.setModifyName(generalAdmin.getUserName());
						
					}else if(object instanceof SuperAdmin) {
						//超级管理员
						SuperAdmin superAdmin = (SuperAdmin) object;
						baseEntity.setModifyId(superAdmin.getId());
						baseEntity.setModifyName(superAdmin.getUserName());
					}
				}
			}
		}
	}
}
