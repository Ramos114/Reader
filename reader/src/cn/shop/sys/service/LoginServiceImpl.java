package cn.shop.sys.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.core.base.BaseDao;
import cn.shop.core.base.BaseServiceImpl;
import cn.shop.sys.dao.LoginDao;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.SuperAdmin;

@Transactional
@Service("LoginService")
public class LoginServiceImpl extends BaseServiceImpl implements LoginService{
	
	
	//登陆dao
	@Resource
	private LoginDao dao;

	
	public LoginDao getDao() {
		return dao;
	}

	public void setDao(LoginDao dao) {
		this.dao = dao;
	}

	@Override
	public BaseDao getBaseDao() {
		return dao;
	}

	
	
	@Override
	public SuperAdmin findSuperAdmin(String userName) throws Exception{
		return this.dao.findSuperAdmin(userName);
	}

	
	
	@Override
	public GeneralAdmin findGeneralAdmin(String userName) {
		return this.dao.findGeneralAdmin(userName);
	}

}
