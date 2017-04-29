package cn.reader.core.tag;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

import cn.reader.core.init.SpringContext;
import cn.reader.core.utils.Constants;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.service.MenuService;
import cn.reader.sys.service.RoleService;
import cn.reader.sys.utils.MenuHtmlUtils;
import cn.reader.sys.vo.MenuVO;

/**
 * 动态菜单标签生成
 * @author ozy
 *
 */
public class MenuTag extends TagSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(MenuTag.class);

	//菜单service
	private MenuService menuService;
	
	//角色service
	private RoleService roleService;
	
	
	@Override
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		HttpSession session = this.pageContext.getSession();
		String path = pageContext.getServletContext().getContextPath();
		
		//菜单vo
		List<MenuVO> menuVoList = (List<MenuVO>)session.getAttribute("menuList");
		if(menuVoList == null){
			
			menuService=SpringContext.getBean(MenuService.class);
			//获取用户类型
			String userType=(String) session.getAttribute(Constants.USERTYPE);
			try{
				//系统管理员拥有全部菜单
				if("0".equals(userType)){
					menuService=SpringContext.getBean(MenuService.class);
					//menuVoList=assembleMenu(this.menuService.findAllMenuVO());
					menuVoList=assembleMenu(this.menuService.findSystemMenuVO("系统管理"));
				}else{//普通管理员
					roleService=SpringContext.getBean(RoleService.class);
					GeneralAdmin generalAdmin=(GeneralAdmin) session.getAttribute(Constants.LOGINUSER);
					menuVoList=assembleMenu(this.roleService.findRoleMenuVOByPower(generalAdmin));
				}
				
			}catch(Exception e){
				e.printStackTrace();
				log.error(e.getMessage(), e);
			}
		}
		
		menuSort(menuVoList);
		
		//菜单输出
		if(menuVoList != null) {
			String html = MenuHtmlUtils.getMenuHtml(menuVoList,path);
			try {
				this.pageContext.getOut().println(html);
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e.getMessage(), e);
			}
		}
		return SKIP_BODY;
	}
	
	
	
	/**
	 * 组装 父 子 菜单
	 * @param menuVoList
	 * @return
	 */
	public List<MenuVO> assembleMenu(List<MenuVO> menuVoList){
		List<MenuVO> assembleMenuList = new ArrayList<MenuVO>();
		//Iterator<MenuVO> it = menuVoList.iterator();
		
		//循环组装
		//先组装一级菜单
		for(int i=0; i< menuVoList.size(); i++){
			//System.out.println(menuVoList.get(i).getMenu().getMenuName());
			if(menuVoList.get(i).getMenu().getParentMenu() == null){
				assembleMenuList.add(menuVoList.get(i));
			}
		}
		
		//循环组装
		//组装二级菜单
		for(int i=0; i< menuVoList.size(); i++){
			//System.out.println(menuVoList.get(i).getMenu().getMenuName());
			if(menuVoList.get(i).getMenu().getParentMenu() != null){
				//是子 菜单
				for(int j=0; j< assembleMenuList.size(); j++){
					//子菜单集合
					List<MenuVO> childrenList=null;
					if(assembleMenuList.get(j).getChildrenList() == null){
						childrenList = new ArrayList<MenuVO>();
					}else {
						childrenList=assembleMenuList.get(j).getChildrenList();
					}
					
					//判断是否为该子菜单
					if(assembleMenuList.get(j).getMenu().getId().equals(
							menuVoList.get(i).getMenu().getParentMenu().getId())){
						childrenList.add(menuVoList.get(i));
						assembleMenuList.get(j).setChildrenList(childrenList);
					}
				}

			}
		}
		
		return assembleMenuList;
	}
	
	
	
	/**
	 * 菜单递归排序
	 * @param menuVoList
	 */
	public static void menuSort(List<MenuVO> menuVoList){
		if(menuVoList != null && !menuVoList.isEmpty()){
			//排序
			Collections.sort(menuVoList,new Comparator<MenuVO>(){
				
				@Override
				public int compare(MenuVO o1, MenuVO o2) {
					Integer serialNo1=o1.getMenu().getLevels() == null ? 0 : o1.getMenu().getSerialNo();
					Integer serialNo2=o2.getMenu().getLevels() == null ? 0 : o2.getMenu().getSerialNo();
					return serialNo1-serialNo2;
				}
				
			});
			
			for(int i=0; i<menuVoList.size();i++){
				menuSort(menuVoList.get(i).getChildrenList());
			}
			
		}
	}
}
