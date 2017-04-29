package cn.reader.sys.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.reader.core.base.BaseDao;
import cn.reader.core.base.BaseServiceImpl;
import cn.reader.sys.dao.LoginDao;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.SuperAdmin;

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
