package cn.shop.sys.service;

import java.util.List;

import cn.shop.core.base.BaseService;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.Menu;
import cn.shop.sys.vo.MenuVO;

public interface MenuService extends BaseService{

	/**
	 * 查找所有菜单 封装到 VO
	 * @return
	 * @throws Exception 
	 */
	public List<MenuVO> findAllMenuVO() throws Exception;

	/**
	 * 查找所有菜单
	 * @return
	 * @throws Exception 
	 */
	public List<Menu> findAllMenu() throws Exception;

	
	/**
	 * 删除菜单(父菜单或子菜单)
	 * @param menu
	 * @throws Exception 
	 */
	public void deleteMenuOrAll(Menu menu) throws Exception;

	
	/**
	 * 分配权限
	 * @param roleId
	 * @param menuIds
	 * @throws Exception 
	 */
	public void addRoleMenuPower(String roleId, String menuIds) throws Exception;

	
	/**
	 * 删除所有角色菜单权限
	 * @param roleId
	 */
	public void deleteAllRoleMenu(String roleId);

	
	/**
	 * 获取系统管理员菜单
	 * @return
	 * @throws Exception 
	 */
	public List<MenuVO> findSystemMenuVO(String sysName) throws Exception;



}
