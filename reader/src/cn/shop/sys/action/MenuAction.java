package cn.shop.sys.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import cn.shop.core.base.BaseAction;
import cn.shop.core.utils.GsonUtils;
import cn.shop.core.utils.ZtreeNode;
import cn.shop.sys.entity.Menu;
import cn.shop.sys.service.MenuService;

/**
 * 菜单Action
 * @author ozy
 *
 */

@Action(value = "MenuAction")
@Scope("prototype")
@Results(value = {
		
})
public class MenuAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(MenuAction.class);
	
	//菜单service
	@Resource
	private MenuService menuService;
	
	
	/**
	 * 构建菜单树
	 * @return
	 * @throws Exception
	 */
	public String getMenuTree() throws Exception{
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		//树节点list
		List<ZtreeNode> list=null;
		PrintWriter out=null;
		try{
			list=new ArrayList<ZtreeNode>();
			out=this.response.getWriter();
			//int j=5/0;
			List<Menu> menuList=this.menuService.findAllMenu();
			//添加父节点
			for(int i=0; i<menuList.size(); i++){
				//父节点
				if(menuList.get(i).getParentMenu() == null){
					list.add(new ZtreeNode(menuList.get(i).getId(),"0",
							menuList.get(i).getMenuName(),1,1));
				}else{//子节点
					list.add(new ZtreeNode(menuList.get(i).getId(),menuList.get(i).getParentMenu().getId(),
							menuList.get(i).getMenuName(),0));
				}
				
			}
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
	 * 获取点击节点菜单数据
	 * @return
	 * @throws Exception
	 */
	public String getMenuTreeNode() throws Exception{
		//获取点击节点Id
		final String menuId=this.request.getParameter("menuId");
		
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out=null;
		try{
			Menu menu=this.menuService.get(Menu.class, menuId);
			out=this.response.getWriter();
			result.put("menu", menu);
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
	 * 新增同级菜单
	 * @return
	 * @throws Exception
	 */
	public String addMenu() throws Exception{
		//获取父节点Id
		final String menuId=this.request.getParameter("menuId");
		//获取添加节点名称
		final String menuName=this.request.getParameter("menuName");
		//获取添加节点url
		final String menuUrl=this.request.getParameter("menuUrl");
		//获取添加节点序号
		final String serialNo=this.request.getParameter("serialNo");
		
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			Menu menu=this.menuService.get(Menu.class, menuId);
			
			//添加节点
			if(menu.getLevels() == 0){//如果为一级菜单
				this.menuService.save(new Menu(null,menuName,menuUrl,
						null,Integer.parseInt(serialNo),menu.getLevels()));
			}else{//否则
				this.menuService.save(new Menu(null,menuName,menuUrl,
						menu.getParentMenu(),Integer.parseInt(serialNo),menu.getLevels()));
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
	 * 新增子菜单
	 * @return
	 * @throws Exception
	 */
	public String addMenuSub() throws Exception{
		//获取父节点Id
		final String menuId=this.request.getParameter("menuId");
		//获取添加节点名称
		final String menuName=this.request.getParameter("menuName");
		//获取添加节点url
		final String menuUrl=this.request.getParameter("menuUrl");
		//获取添加节点序号
		final String serialNo=this.request.getParameter("serialNo");
		
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			Menu menu=this.menuService.get(Menu.class, menuId);
			
			//添加节点
			this.menuService.save(new Menu(null,menuName,menuUrl,
						menu,Integer.parseInt(serialNo),menu.getLevels()+1));
			
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
	 * 保存菜单
	 * @return
	 * @throws Exception
	 */
	public String saveMenu() throws Exception{
		//获取节点Id
		final String menuId=this.request.getParameter("menuId");
		//获取节点名称
		final String menuName=this.request.getParameter("menuName");
		//获取节点url
		final String menuUrl=this.request.getParameter("menuUrl");
		//获取节点序号
		final String serialNo=this.request.getParameter("serialNo");
		
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			Menu menu=this.menuService.get(Menu.class, menuId);
			menu.setMenuName(menuName);
			menu.setMenuUrl(menuUrl);
			menu.setSerialNo(Integer.parseInt(serialNo));
			this.menuService.update(menu);
			
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
	 * 删除菜单
	 * @return
	 * @throws Exception
	 */
	public String deleteMenu() throws Exception{
		//获取节点Id
		final String menuId=this.request.getParameter("menuId");
		
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		
		PrintWriter out=null;
		try{
			out=this.response.getWriter();
			Menu menu=this.menuService.get(Menu.class, menuId);
			if(menu.getParentMenu() == null){
				this.menuService.deleteMenuOrAll(menu);
			}else{
				this.menuService.delete(menu);
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

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	
	
	
}
