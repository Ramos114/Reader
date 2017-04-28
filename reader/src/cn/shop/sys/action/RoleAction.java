package cn.shop.sys.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import cn.shop.core.base.BaseAction;
import cn.shop.core.page.PageModel;
import cn.shop.core.page.PageUtils;
import cn.shop.core.utils.GsonUtils;
import cn.shop.core.utils.ZtreeNode;
import cn.shop.sys.entity.Menu;
import cn.shop.sys.entity.Role;
import cn.shop.sys.entity.RoleMenu;
import cn.shop.sys.service.MenuService;
import cn.shop.sys.service.RoleService;

/**
 * 角色Action
 * @author ozy
 *
 */

@Action(value = "RoleAction")
@Scope("prototype")
@Results(value = {
		@Result(name="addRole",location="/model/manager/sys/add_Role.jsp"),
		@Result(name="role_info",location="/model/manager/sys/edit_Role.jsp"), //跳转到更改角色页面
		@Result(name="roleManage",location="/model/manager/sys/roleManage.jsp"), //跳转到角色列表
})
public class RoleAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(RoleAction.class);
	
	private Role role;
	//角色service
	@Resource
	private RoleService roleService;
	
	//菜单service
	@Resource
	private MenuService menuService;
	
	
	/**
	 * 查询所有角色 分页
	 * @return
	 * @throws Exception
	 */
	public String findPageRole() throws Exception{
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "error");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			
			PageModel<Role> pageModel=new PageModel<Role>();
			this.setPageModel(pageModel);
			this.roleService.findPageRole(pageModel);
			out.write(PageUtils.setModelJson(pageModel));
		}catch(Exception e){
			e.printStackTrace();
			out.write(GsonUtils.GSON.toJson(result));
			log.error(e.getMessage(), e);
		}finally{
			out.close();
		}
		return null;
	}
	
	
	
	/**
	 * 获取所有菜单(角色相对应的要勾选)
	 * @return
	 * @throws Exception
	 */
	public String getMenuRoleTree() throws Exception{
		//角色Id
		final String roleId=this.request.getParameter("roleId");
		
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			
			Role role=this.menuService.get(Role.class, roleId);
			//选中有权限菜单,无权限菜单不选中
			//树节点list
			List<ZtreeNode> list=this.roleService.findRoleMenuToCheck(role,this.menuService.findAllMenu());
			result.put("list", list);
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", "error");
			log.error(e.getMessage(), e);
		}finally{
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return null;
	}
	
	
	/**
	 * 分配权限
	 * @return
	 * @throws Exception
	 */
	public String addRoleMenuPower() throws Exception{
		//角色Id
		final String roleId=this.request.getParameter("roleId");
		//待分配权限的菜单Id
		final String menuIds=this.request.getParameter("menuIds");
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			if(menuIds != null && !"".equals(menuIds)){
				this.menuService.addRoleMenuPower(roleId,menuIds);
			}else{
				this.menuService.deleteAllRoleMenu(roleId);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", "error");
			log.error(e.getMessage(), e);
		}finally{
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		
		return null;
	}
	
	
	/**
	 * 跳转到添加页面
	 * @return
	 * @throws Exception
	 */
	public String toAddRole() throws Exception{
		return "addRole";
	}
	
	/**
	 * 保存添加角色
	 * @return
	 * @throws Exception
	 */
	public String saveRole() throws Exception{
		try{
			this.roleService.save(role);
			this.response.getWriter().write("success");
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 跳转到更改会员页面
	 * @return
	 * @throws Exception
	 */
	public String edit_ui() throws Exception{
		try{
			String id = this.request.getParameter("id");
			Role role = this.roleService.get(Role.class,id);
			this.request.setAttribute("role", role);
			return "role_info";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 更改角色信息
	 * @return
	 * @throws Exception
	 */
	public String updateRole() throws Exception{
		try{
			String id = this.request.getParameter("id");
			String roleName = this.request.getParameter("roleName");
			String roleType = this.request.getParameter("roleType");
			String description = this.request.getParameter("description");
			Role role = this.roleService.get(Role.class, id);
			role.setRoleName(roleName);
			role.setRoleType(roleType);
			role.setDescription(description);
			this.roleService.update(role);
			this.response.getWriter().write("success");
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 删除角色
	 * @return
	 * @throws Exception
	 */
	public String deleteRole() throws Exception{
		try{
			String id = this.request.getParameter("id");
			Role role = this.roleService.get(Role.class, id);
			this.roleService.delete(role);
			return "roleManage";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return null;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
}
