package cn.reader.sys.service;

import cn.reader.core.base.BaseService;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.SuperAdmin;

public interface LoginService extends BaseService{

	/**
	 * 通过 用户名 查找超级管理员
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public SuperAdmin findSuperAdmin(String userName) throws Exception;

	/**
	 * 通过 用户名 查找普通管理员
	 * @param userName
	 * @return
	 */
	public GeneralAdmin findGeneralAdmin(String userName);

	

}
