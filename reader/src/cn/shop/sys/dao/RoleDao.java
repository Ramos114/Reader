package cn.shop.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.shop.core.base.BaseDao;
import cn.shop.core.page.PageModel;
import cn.shop.sys.entity.Role;
import cn.shop.sys.entity.RoleMenu;

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
