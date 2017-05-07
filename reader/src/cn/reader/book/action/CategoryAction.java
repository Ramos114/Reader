package cn.reader.book.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import cn.reader.book.entity.BigCategory;
import cn.reader.book.entity.SmallCategory;
import cn.reader.book.service.ICategoryService;
import cn.reader.core.base.BaseAction;
import cn.reader.core.page.PageModel;
import cn.reader.core.page.PageUtils;
import cn.reader.core.utils.GsonUtils;
import cn.reader.core.utils.UploadImgUtils;
import cn.reader.front.vo.PicVO;


/**
 * 分类(大类别和小类别)Action
 * @author LMX
 *
 */
@Action(value = "CategoryAction")
@Scope("prototype")
@Results(value = {
		@Result(name="editBigC_UI",location="/model/manager/book/bigCategoryEdit.jsp"),	
		@Result(name="edit_slc",location="/model/manager/book/edit_smallcategory.jsp"),
		@Result(name="add_slc",location="/model/manager/book/smallCategoryAdd.jsp"),
		@Result(name="input",location="/model/manager/book/bigCategoryManage.jsp"),
})
public class CategoryAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(CategoryAction.class);// 日志使用方法
	
	// 注解 自动加载ICategoryService
	@Resource
	private ICategoryService categoryService;

	// 大类别和小类别实体
	private BigCategory bigCategory;
	
	private SmallCategory smallCategory;
	
	private File[] file;            //文件  
	private String[] fileFileName;  //文件名
    private String fileContentType; //文件类型

	
	/**************** 大类别管理 ***************************/

	/**
	 * 分页查询所有大类别,按大类别名称模糊查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String findPageBigCategory() throws Exception {
		String result = "error";
		PrintWriter out = null;
		try {
			out = this.response.getWriter();

			String bgcName = this.request.getParameter("bgcName");

			PageModel<BigCategory> bigCategory = new PageModel<BigCategory>();
			this.setPageModel(bigCategory);
			// 分页查询所有大类别,按大类别名称模糊查询
			this.categoryService.findbgcbybgcName(bigCategory, bgcName);
			out.write(PageUtils.setModelJson(bigCategory));
		} catch (Exception e) {
			e.printStackTrace();
			result = "bgcshow_error";
			out.write(result);
			log.error(e.getMessage(), e);
		} finally {
			out.close();
		}
		return null;
	}
	
	

	/**
	 * 【1】添加大类别信息(包括图片)
	 * 【1】先添加大类别信息，返回该大类id给【2】图片上传用，把图片路径保存到该大类id，更新实体
	 * @return
	 * @throws Exception
	 */
	public String bgcAdd() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			// 判断大类别编号或大类名称是否已存在
			String f = this.categoryService.bgclist(bigCategory.getBgcId(),bigCategory.getBgcName());

			if (f == "bgcId_exist") {
				result.put("status", "bgcId_exist");
			} else if (f == "bgcName_exist") {
				result.put("status", "bgcName_exist");
			} else {
				this.categoryService.savebgc(bigCategory);
				result.put("status", "bgcadd_success");
				result.put("id", bigCategory.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "bgcadd_error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return null;
	}
	
	/**
	 * 【2】大类别封面图片上传(可多个)
	 * 大类别封面上传，(大类别封面是在大类别实体里)
	 * 先添加大类别信息，返回该大类id给【2】图片上传用，把图片路径保存到该大类id，更新实体
	 * @return
	 * @throws Exception
	 */
	public String addPicture() throws Exception{
		//保存图片的文件夹路径(tomcat的项目目录下的-->shop/uploadfile)
		String path = ServletActionContext.getServletContext().getRealPath("/");
		File tempfile = new File(path); // 如果文件夹不存在创建
		if (!tempfile.exists()) {
			tempfile.mkdir();
		}
		PrintWriter out = null;
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		//MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) this.request;
		try{/*
			File file[] = wrapper.getFiles("file");
			String fileName[] = wrapper.getFileNames("file");*/
			List<PicVO> list = new ArrayList<PicVO>();//list里返回图片路径和缩略图路径
			if(file != null && fileFileName != null){//判断是否有文件
				list = UploadImgUtils.upload(file, fileFileName, path, false);//上传文件，false：不缩略图
			}
			for(int i = 0 ; i < list.size(); i++){	
				
				bigCategory=this.categoryService.findbgcbyId(bigCategory.getId());
		
				bigCategory.setBgcImgUrl(list.get(i).getPicUrl());//设置实体中的图片路径
				
				this.categoryService.updatebgc(bigCategory);//再更新大类别实体
			}
			out = this.response.getWriter();
			response.setContentType("application/json");
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", "error");
			out.write(GsonUtils.GSON.toJson(result));
			log.error(e.getMessage(), e);
		}finally{
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return null;
	}
	
	/**
	 * 根据大类id删除大类
	 * 
	 * @return
	 * @throws Exception
	 */
	public String bgcDel() throws Exception {
		String result =null;
		PrintWriter out = null;
		try {
			out = this.response.getWriter();
 			String bid = this.request.getParameter("bid");
 			//根据大类id查找该大类别对应的小类别集合
 			List<SmallCategory> scllist = this.categoryService.findslcbybid(bid);
 			//逐个删除该大类别下对应的小类别
 			if(scllist!=null&&scllist.size()>0){
 				this.categoryService.delscllist(scllist);
 			}
 			//根据id删除大类别
 			this.categoryService.delbgcbyid(bid);
 			result = "bgcdel_success";
 			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
 			result = "bgcdel_error";
 			out.write(result);
 			log.error(e.getMessage(), e);
		} finally {
			out.close();
		}
		return null;
	}

	/**
	 * 跳转到修改大类别信息页面，并根据id查询大类别信息并传到修改页面
	 * 注意:跳转不能混用return是Struts2的;out.write是ajax的
	 * struts2的直接request;ajax就结果集
	 * @return
	 * @throws Exception
	 */
	public String editBigC_UI() throws Exception {
		
		try {
			bigCategory = this.categoryService.findbgcbyId(bigCategory.getId());
			this.request.setAttribute("bigCategory", bigCategory);
			
			return "editBigC_UI";
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		} 
		return "input";
	}
	
	/**
	 * 修改大类别信息
	 * @return
	 */
	public String bgcUpdate(){
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		PrintWriter	out = null;
		try{
			out = this.response.getWriter();
			
			this.categoryService.updatebgc(bigCategory);
			
			result.put("status","update_success");
			result.put("id",bigCategory.getId());//回传id给图片上传绑定对应的大类别
		} catch(Exception e){
			e.printStackTrace();
			result.put("status","update_error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return null;
	}
	
	/***************************************************/

	/**************** 小类别管理 ***************************/

	/**
	 * 分页查询所有小类别,按大类别名称查询或按小类别名称模糊查询
	 * @return
	 * @throws Exception
	 */
	public String findPageSmallCategory() throws Exception {
		String result = "success";
		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			String slcName = this.request.getParameter("slcName");
			String bgcName = this.request.getParameter("bgcName");
			PageModel<SmallCategory> smallCategory = new PageModel<SmallCategory>();
			this.setPageModel(smallCategory);
			// 分页查询所有小类别,按大类别名称查询或按小类别名称模糊查询
			this.categoryService.findslc(smallCategory, bgcName,slcName);

			out.write(PageUtils.setModelJson(smallCategory));
		} catch (Exception e) {
			e.printStackTrace();
			result = "slcshow_error";
			out.write(result);
			log.error(e.getMessage(), e);
		} finally {
			out.close();
		}
		return null;
	}

	/**
	 * 按小类id删除小类
	 * 
	 * @return
	 * @throws Exception
	 */
	public String slcDel() throws Exception {

		String result =null;
		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			String sid = this.request.getParameter("sid");
			this.categoryService.delslcbyid(sid);;
				result="slcdel_success";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
			result = "slcdel_error";
			out.write(result);
			log.error(e.getMessage(), e);
		} finally {
			out.close();
		}
		return null;
	}

	/**
	 * 跳转到添加小类别信息页面，查询所有大类别集合并传过去小类别添加页面
	 * @return
	 * @throws Exception
	 */
	public String slc_ui() throws Exception{
		try{
			List<BigCategory> bgclist = this.categoryService.findbgclist();
			this.request.setAttribute("bgclist", bgclist);
			//this.session.setAttribute("bgclist", this.categoryService.findbgclist());
			return "add_slc";
		}catch(Exception e){
			log.error(e.getMessage(),e);
			return "input";
		}
	}
	
	/**
	 * 【1】添加小类别信息(包括图片)
	 * 【1】先添加小类别信息，返回该小类id给【2】图片上传用，把图片路径保存到该小类id，更新实体
	 * @return
	 * @throws Exception
	 */
	public String slcAdd() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			// 判断大类别编号或大类名称是否已存在
			String f = this.categoryService.slclist(smallCategory.getSlcId(),smallCategory.getSlcName());

			if (f == "slcId_exist") {
				result.put("status", "slcId_exist");
			} else if (f == "slcName_exist") {
				result.put("status", "slcName_exist");
			} else {
				this.categoryService.saveslc(smallCategory);
				result.put("status", "slcadd_success");
				result.put("id", smallCategory.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "slcadd_error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return null;
	}
	
	/**
	 * 【2】小类别封面图片上传(可多个)
	 * 小类别封面上传，(小类别封面是在小类别实体里)
	 * 先添加小类别信息，返回该小类id给【2】图片上传用，把图片路径保存到该小类id，更新实体
	 * @return
	 * @throws Exception
	 */
	public String addSmallPicture() throws Exception{
		//保存图片的文件夹路径(tomcat的项目目录下的-->shop/uploadfile)
		String path = ServletActionContext.getServletContext().getRealPath("/");
		File tempfile = new File(path); // 如果文件夹不存在创建
		if (!tempfile.exists()) {
			tempfile.mkdir();
		}
		PrintWriter out = null;
		//结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		//MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) this.request;
		try{/*
			File file[] = wrapper.getFiles("file");
			String fileName[] = wrapper.getFileNames("file");*/
			List<PicVO> list = new ArrayList<PicVO>();//list里返回图片路径和缩略图路径
			if(file != null && fileFileName != null){//判断是否有文件
				list = UploadImgUtils.upload(file, fileFileName, path, false);//上传文件，false：不缩略图
			}
			for(int i = 0 ; i < list.size(); i++){	
				
				smallCategory=this.categoryService.findslcbyId(smallCategory.getId());
		
				smallCategory.setSlcImgUrl(list.get(i).getPicUrl());//设置实体中的图片路径
				
				this.categoryService.updateslc(smallCategory);//再更新小类别实体
			}
			out = this.response.getWriter();
			response.setContentType("application/json");
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", "error");
			out.write(GsonUtils.GSON.toJson(result));
			log.error(e.getMessage(), e);
		}finally{
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return null;
	}

	
	/**
	 * 跳转到修改信息页面
	 * @return
	 * @throws Exception
	 */
	public String edit_slc() throws Exception{
		try{
			this.session.setAttribute("bgclist", this.categoryService.findbgclist());
			this.session.setAttribute("slc_info", this.categoryService.findslcbyId(smallCategory.getId()));
			return "edit_slc";
		}catch(Exception e){
			log.error(e.getMessage(),e);
			return "input";
		}
	}
	
	public void slcUpdate(){
		try{
			
			this.categoryService.updateslc(smallCategory);
			this.response.getWriter().write("update_success");
		}catch(Exception e){
			log.error(e.getMessage(),e);
		}
	}
	
	
	/**************************************************/
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public BigCategory getBigCategory() {
		return bigCategory;
	}
	public void setBigCategory(BigCategory bigCategory) {
		this.bigCategory = bigCategory;
	}

	public SmallCategory getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(SmallCategory smallCategory) {
		this.smallCategory = smallCategory;
	}

	public File[] getFile() {
		return file;
	}
	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}


}
