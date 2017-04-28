package cn.shop.sys.action;

import java.io.PrintWriter;
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
import cn.shop.core.utils.MD5Utils;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.Role;
import cn.shop.sys.service.GeneralAdminManageService;

/**
 * 普通管理员管理
 *@author jerry-HJY
 *上午8:52:42
 */

@Action(value="GeneralAdminManageAction")
@Scope("prototype")
@Results(value={
		@Result(name="success",location="/model/manager/sys/generalAdminManage.jsp"),
		@Result(name="edit_ui",location="/model/manager/sys/edit_gnlAdmin.jsp"),
		@Result(name="delete_success",location="/model/manager/sys/generalAdminManage.jsp"),
		@Result(name="input",location="/model/manager/sys/generalAdminManage.jsp"),		
		@Result(name="findAllRole",location="/model/manager/sys/add_generalAdmin.jsp"), 
	
})
public class GeneralAdminManageAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(GeneralAdminManageAction.class);
	@Resource
	private GeneralAdminManageService generalAdminManageService;
	
	private GeneralAdmin generalAdmin;
	
	private Role role;
	
	/**
	 * 查询所有普通管理员 分页
	 * @throws Exception 
	 */	
	public void findPageGeneralAdmin() throws Exception {
		//姓名关键字
		final String keyWord=this.request.getParameter("keyWord");
		//性别筛选
		final String sex=this.request.getParameter("sex_sele");
		
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "error");
		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			PageModel<GeneralAdmin> pageModel = new PageModel<GeneralAdmin>();
			this.setPageModel(pageModel);
			this.generalAdminManageService.findPageGeneralAdmin(pageModel,keyWord,sex);
			out.write(PageUtils.setModelJson(pageModel));				
		} catch (Exception e) {
			out.write(GsonUtils.GSON.toJson(result));		
			log.error(e.getMessage(), e);
		} finally {
			out.close();
		}
	}
	/**
	 * 添加普通管理员
	 * @throws Exception 
	 */
	public void saveGeneralAdmin() throws Exception{
		try{
			generalAdmin.setPassWord(MD5Utils.encryption(generalAdmin.getPassWord()));
			this.generalAdminManageService.saveGeneralAdmin(generalAdmin);
			this.response.getWriter().write("success");
		}catch(Exception e){
			log.error(e.getMessage(),e);
		}
	}
	/**
	 * 查找同名用户名
	 * @throws Exception
	 */
	public void findSameGAname() throws Exception{
		try{
			boolean flag = this.generalAdminManageService.findSameGAname(generalAdmin);
			if(flag == true){ //有同名
				this.response.getWriter().write("same");
			}else{
				this.response.getWriter().write("notsame");
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
		}		
	}
	/**
	 * 跳转到修改信息页面
	 * @return
	 * @throws Exception
	 */
	public String edit_ui() throws Exception{
		try{
			this.request.setAttribute("ga_info", this.generalAdminManageService.findGAbyId(generalAdmin.getId()));
			List<Role> list = this.generalAdminManageService.findAllRole();
			this.request.setAttribute("role_list", list);
			return "edit_ui";
		}catch(Exception e){
			log.error(e.getMessage(),e);
			return "input";
		}
	}
	/**
	 * 删除普通管理员
	 * @throws Exception
	 */
	public String deleteGA() throws Exception {
		try{
			generalAdmin.setId(generalAdmin.getId());
			generalAdmin.setOptLock(generalAdmin.getOptLock());
			this.generalAdminManageService.deleteGA(generalAdmin);	
			//System.out.println("ok");
			return "delete_success";
		}catch(Exception e){
			log.error(e.getMessage(),e);
			return "input";
		}
	}
	/**
	 * 更新普通管理员
	 */
	public void updateGA() throws Exception {
		try{
			generalAdmin.setPassWord(MD5Utils.encryption(generalAdmin.getPassWord()));
			this.generalAdminManageService.updateGA(generalAdmin);
			this.response.getWriter().write("success");
		}catch(Exception e){
			log.error(e.getMessage(),e);
		}
	}
	
	/**
	 * 查找所有角色
	 * @return
	 * @throws Exception
	 */
	public String role_list() throws Exception{
		try{
			List<Role> list = this.generalAdminManageService.findAllRole();
			this.request.setAttribute("role_list", list);
			return "findAllRole";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return null;
	}
	
	public void setGeneralAdminManageService(
			GeneralAdminManageService generalAdminManageService) {
		this.generalAdminManageService = generalAdminManageService;
	}
	public void setGeneralAdmin(GeneralAdmin generalAdmin) {
		this.generalAdmin = generalAdmin;
	}
	public GeneralAdmin getGeneralAdmin() {
		return generalAdmin;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
