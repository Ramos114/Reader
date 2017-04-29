package cn.reader.sys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.reader.core.base.BaseDao;
import cn.reader.core.base.BaseServiceImpl;
import cn.reader.sys.dao.MenuDao;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.Menu;
import cn.reader.sys.entity.Role;
import cn.reader.sys.entity.RoleMenu;
import cn.reader.sys.vo.MenuVO;

@Transactional
@Service("MenuService")
public class MenuServiceImpl extends BaseServiceImpl implements MenuService{
	
	//菜单dao
	@Resource
	private MenuDao menuDao;
	
	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	@Override
	public BaseDao getBaseDao() {
		// TODO Auto-generated method stub
		return menuDao;
	}

	
	@Override
	public List<MenuVO> findAllMenuVO() throws Exception {
		// TODO Auto-generated method stub
		return this.menuDao.findAllMenuVO();
	}

	@Override
	public List<Menu> findAllMenu() throws Exception {
		// TODO Auto-generated method stub
		return this.menuDao.findAllMenu();
	}

	@Override
	public void deleteMenuOrAll(Menu menu) throws Exception{
		//查找出所有父节点
		List<Menu> list=this.menuDao.findMenuByParent(menu);
		//删除
		this.menuDao.delete(list);
		
		//再删除父节点
		this.menuDao.delete(menu);
	}

	@Override
	public void addRoleMenuPower(String roleId, String menuIds) throws Exception{
		Role role=this.menuDao.get(Role.class, roleId);
		//先删除该角色所有权限
		List<RoleMenu> roleMenuList=this.menuDao.findMenuByRole(role);
		this.menuDao.delete(roleMenuList);
		
		//分割菜单Id字符
		String menuId[]=menuIds.split(",");
		
		List<RoleMenu> list=new ArrayList<RoleMenu>();
		for(int i=0;i<menuId.length;i++){
			Menu menu=this.menuDao.get(Menu.class,menuId[i]);
			RoleMenu roleMenu=new RoleMenu(role,menu);
			list.add(roleMenu);
		}
		//保存权限集合
		this.menuDao.save(list);
	}

	@Override
	public void deleteAllRoleMenu(String roleId) {
		Role role=this.menuDao.get(Role.class, roleId);
		List<RoleMenu> roleMenuList=this.menuDao.findMenuByRole(role);
		this.menuDao.delete(roleMenuList);
	}

	@Override
	public List<MenuVO> findSystemMenuVO(String sysName) throws Exception {
		//查找系统菜单
		Menu menu=this.menuDao.findSystemMenu(sysName);
		//查找系统菜单子节点
		List<Menu> childrenList=this.menuDao.findMenuByParent(menu);
		
		List<MenuVO> childrenMenuVOList=new ArrayList<MenuVO>();
		for(int i=0;i<childrenList.size();i++){
			MenuVO menuVO=new MenuVO(childrenList.get(i), null);
			childrenMenuVOList.add(menuVO);
		}
		
		List<MenuVO> list=new ArrayList<MenuVO>();
		MenuVO menuVO=new MenuVO(menu, childrenMenuVOList);
		list.add(menuVO);
		
		return list;
	}


}
