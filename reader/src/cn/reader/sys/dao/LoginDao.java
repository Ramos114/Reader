package cn.reader.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.reader.core.base.BaseDao;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.SuperAdmin;

@Repository
public class LoginDao extends BaseDao{

	/**
	 * 通过 用户名 查找超级管理员
	 * @param userName
	 * @return
	 */
	public SuperAdmin findSuperAdmin(String userName) throws Exception{
		final String hql="from SuperAdmin sa where sa.userName=?";
		List list=this.find(hql, new Object[]{userName});
		return list == null || list.isEmpty() ? null: (SuperAdmin)list.get(0);
	}

	
	/**
	 * 通过 用户名 查找普通管理员
	 * @param userName
	 * @return
	 */
	public GeneralAdmin findGeneralAdmin(String userName) {
		final String hql="from GeneralAdmin ga where ga.userName=?";
		List list=this.find(hql, new Object[]{userName});
		return list == null || list.isEmpty() ? null: (GeneralAdmin)list.get(0);
	}


	
}
