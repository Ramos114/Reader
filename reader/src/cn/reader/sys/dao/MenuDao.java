package cn.reader.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.reader.core.base.BaseDao;
import cn.reader.sys.entity.Menu;
import cn.reader.sys.entity.Role;
import cn.reader.sys.entity.RoleMenu;
import cn.reader.sys.vo.MenuVO;

@Repository
public class MenuDao extends BaseDao{

	/**
	 * 查找所有菜单 封装到 VO
	 * @return
	 */
	public List<MenuVO> findAllMenuVO() throws Exception{
		final String hql="select new cn.reader.sys.vo.MenuVO"
				+ "(m as menu) "
				+ "from Menu m ";
		return this.find(hql);
	}

	/**
	 * 查找所有菜单
	 * @return
	 */
	public List<Menu> findAllMenu() throws Exception{
		final String hql="from Menu m";
		return this.find(hql);
	}

	
	/**
	 * 通过父节点Id查找所有子节点
	 * @param menu
	 * @return
	 */
	public List<Menu> findMenuByParent(Menu menu) throws Exception{
		final String hql="from Menu m where m.parentMenu=?";
		return this.find(hql,new Object[]{menu});
	}

	
	/**
	 * 查询角色相对应菜单
	 * @param role
	 * @return
	 */
	public List<RoleMenu> findMenuByRole(Role role) {
		final String hql="from RoleMenu rm where rm.role=?";
		return this.find(hql, new Object[]{role});
	}

	
	/**
	 * 查找系统菜单
	 * @param sysName
	 * @return
	 */
	public Menu findSystemMenu(String sysName) {
		final String hql="from Menu m where m.menuName=?";
		List list=this.find(hql,new Object[]{sysName});
		return list == null || list.isEmpty() ? null: (Menu)list.get(0);
	}
	
	
}
