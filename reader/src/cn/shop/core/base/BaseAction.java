package cn.shop.core.base;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;




import cn.shop.core.page.PageModel;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Action基类
 * @author jerry-HJY
 * @time 2016年11月22日-下午3:56:26
 */
//以IOC方式获得，降低耦合性
public class BaseAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,ServletContextAware{

	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected ServletContext application;
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application=application;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		this.session=this.request.getSession();
	}
	
	/**
	 * 获取设置分页model
	 * @param pageModel
	 */
	protected void setPageModel(PageModel pageModel) {
        final String page = this.request.getParameter("page");
        final String rows = this.request.getParameter("rows");
        pageModel.setCurrentPage(StringUtils.isNumeric(page) ? Integer.parseInt(page) : 0);
        pageModel.setPageSize(StringUtils.isNumeric(rows) ? Integer.parseInt(rows) : 0);
    }

}
