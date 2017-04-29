package cn.reader.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.reader.core.base.BaseDao;
import cn.reader.core.page.PageModel;
import cn.reader.sys.entity.Role;
import cn.reader.sys.entity.RoleMenu;

@Repository
public class RoleDao extends BaseDao{

	/**
	 * 查询所有角色 分页
	 * @param pageModel
	 */
	public void findPageRole(PageModel<Role> pageModel) throws Exception{
		final String hql="from Role";
		this.find(pageModel, hql, null);
	}

	
	/**
	 * 查询角色相对应菜单
	 * @param role
	 * @return
	 */
	public List<RoleMenu> findMenuByRole(Role role) throws Exception{
		final String hql="from RoleMenu rm where rm.role=?";
		return this.find(hql, new Object[]{role});
	}


	/**
	 * 获取所有角色菜单
	 * @return
	 */
	public List<RoleMenu> findAllRoleMenu() throws Exception{
		final String hql="from RoleMenu";
		return this.find(hql, null);
	}
	
}
