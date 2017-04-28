package cn.shop.sys.utils;

import java.util.List;

import cn.shop.sys.vo.MenuVO;



/**
 * html菜单动态显示工具类
 * @author ozy
 *
 */
public final class MenuHtmlUtils {
	
	private MenuHtmlUtils() {}
	
	
	/**
	 * 获取菜单html
	 * @param menuList
	 * @return
	 */
	public static String getMenuHtml(List<MenuVO> menuVoList,String path){
		StringBuilder html = new StringBuilder();

		if(menuVoList != null && !menuVoList.isEmpty()) {
			for(MenuVO menuVo : menuVoList) {
				//有子菜单
				if(menuVo.getChildrenList() != null && !menuVo.getChildrenList().isEmpty()) {
					html.append("<li>");
					html.append(" <a href class=\"auto\">");
					html.append("  <span class=\"pull-right text-muted\">");
					html.append("   <i class=\"fa fa-fw fa-angle-right text\"></i>");
					html.append("   <i class=\"fa fa-fw fa-angle-down text-active\"></i>");
					html.append("  </span>");
					html.append("  <i class=\"glyphicon glyphicon-th-large icon text-success\"></i>");
					html.append("  <span class=\"font-bold\">"+menuVo.getMenu().getMenuName()+"</span>");
					html.append(" </a>");
					html.append(  getSubMenuHtml(menuVo.getChildrenList(),path));
					html.append("<li>");
				}else{
					//无子菜单
					html.append(getLastMenuHtml(menuVo,path));
				}
			}
		}
		return html.toString();
	}
	
	

	
	/**
	 * 获取子菜单html
	 * @param menuVoList
	 * @return
	 */
	public static String getSubMenuHtml(List<MenuVO> menuVoList,String path){
		StringBuilder html = new StringBuilder();
		html.append("<ul class=\"nav nav-sub dk\">");
		
		for(MenuVO menuVo : menuVoList) {

				html.append("<li id=\""+path+menuVo.getMenu().getMenuUrl()+"\" class=\"content_Item\" ui-sref-active=\"active\"  style=\"overflow:hidden; height:100%\">");
				html.append(" <a ui-sref=\"apps.note\">");
				html.append("  <span>"+menuVo.getMenu().getMenuName()+"</span>");
				html.append(" </a>");
				html.append("</li>");

		}
		
		html.append("</ul>");
		
		return html.toString();
	}
	
	
	/**
	 * 获取没有子菜单的菜单html
	 * @param menuVo
	 * @param path
	 * @return
	 */
	public static String getLastMenuHtml(MenuVO menuVo,String path){
		StringBuilder html = new StringBuilder();
		html.append("<li id=\""+path+menuVo.getMenu().getMenuUrl()+"\" class=\"content_Item\" ui-sref-active=\"active\"  style=\"overflow:hidden; height:100%\">");
		html.append(" <a ui-sref=\"app.calendar\">");
		html.append("  <i class=\"glyphicon glyphicon-calendar icon text-info-dker\"></i>");
		html.append("  <span class=\"font-bold\" translate=\"aside.nav.CALENDAR\">"+menuVo.getMenu().getMenuName()+"</span>");
		html.append(" </a>");
		html.append("</li>");
		return html.toString();
	}
}
