package cn.reader.sys.service;

import java.util.List;

import cn.reader.core.base.BaseService;
import cn.reader.core.page.PageModel;
import cn.reader.core.utils.ZtreeNode;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.Menu;
import cn.reader.sys.entity.Role;
import cn.reader.sys.entity.RoleMenu;
import cn.reader.sys.vo.MenuVO;

public interface RoleService extends BaseService{

	/**
	 * 查询所有角色 分页
	 * @param pageModel
	 * @throws Exception 
	 */
	public void findPageRole(PageModel<Role> pageModel) throws Exception;

	
	/**
	 * 查询角色相对应菜单
	 * @param role
	 * @return
	 */
	public List<RoleMenu> findMenuByRole(Role role) throws Exception;


	/**
	 * 获取所有角色菜单
	 * @return
	 * @throws Exception
	 */
	public List<RoleMenu> findAllRoleMenu() throws Exception;


	
	/**
	 * 选中有权限菜单,无权限菜单不选中
	 * @param role
	 * @param menuList
	 * @return
	 * @throws Exception
	 */
	public List<ZtreeNode> findRoleMenuToCheck(Role role, 
			List<Menu> menuList) throws Exception;


	
	/**
	 * 获取普通管理员菜单
	 * @param generalAdmin
	 * @return
	 * @throws Exception 
	 */
	public List<MenuVO> findRoleMenuVOByPower(GeneralAdmin generalAdmin) throws Exception;

	

}
