package cn.shop.sys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.core.base.BaseDao;
import cn.shop.core.base.BaseServiceImpl;
import cn.shop.core.page.PageModel;
import cn.shop.core.utils.ZtreeNode;
import cn.shop.sys.dao.RoleDao;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.Menu;
import cn.shop.sys.entity.Role;
import cn.shop.sys.entity.RoleMenu;
import cn.shop.sys.vo.MenuVO;

@Transactional
@Service("RoleService")
public class RoleServiceImpl extends BaseServiceImpl implements RoleService{
	
	//登陆dao
	@Resource
	private RoleDao dao;

	
	public RoleDao getDao() {
		return dao;
	}

	public void setDao(RoleDao dao) {
		this.dao = dao;
	}

	@Override
	public BaseDao getBaseDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Override
	public void findPageRole(PageModel<Role> pageModel) throws Exception {
		this.dao.findPageRole(pageModel);
	}

	@Override
	public List<RoleMenu> findMenuByRole(Role role) throws Exception{
		return this.dao.findMenuByRole(role);
	}

	@Override
	public List<RoleMenu> findAllRoleMenu() throws Exception {
		return this.dao.findAllRoleMenu();
	}

	@Override
	public List<ZtreeNode> findRoleMenuToCheck(Role role, List<Menu> menuList)
			throws Exception {
		//菜单树
		List<ZtreeNode> list=new ArrayList<ZtreeNode>();
		//拥有该权限的角色菜单list
		List<RoleMenu> roleMenuList=this.dao.findMenuByRole(role);
		
		for(int i=0; i<menuList.size(); i++){
			Menu menu=menuList.get(i);
			ZtreeNode node=new ZtreeNode(menu.getId(),menu.getMenuName(),1);

			//循环判断是否有该菜单权限
			for(int j=0;j<roleMenuList.size();j++){
				//如果有
				if(menu.getId().equals(roleMenuList.get(j).getMenu().getId())){
					node.setChecked(true);
				}
			}

			//父节点
			if(menuList.get(i).getParentMenu() == null){
				node.setIsParent(1);
				node.setpId(0);
			}else{//子节点
				node.setpId(menuList.get(i).getParentMenu().getId());
			}
			
			list.add(node);
		}
		
		return list;
	}

	@Override
	public List<MenuVO> findRoleMenuVOByPower(GeneralAdmin generalAdmin) throws Exception {
		Role role=generalAdmin.getRole();
		//获取菜单权限集合
		List<RoleMenu> roleMenuList=this.dao.findMenuByRole(role);
		
		
		List<MenuVO> list=new ArrayList<MenuVO>();
		for(int i=0; i<roleMenuList.size(); i++){
			MenuVO menuVO=new MenuVO(roleMenuList.get(i).getMenu());
			list.add(menuVO);
		}
		return list;
	}

}
