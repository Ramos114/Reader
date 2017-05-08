package cn.reader.book.service;

import java.util.List;

import cn.reader.book.entity.BigCategory;
import cn.reader.book.entity.SmallCategory;
import cn.reader.core.base.BaseService;
import cn.reader.core.page.PageModel;


public interface ICategoryService extends BaseService {

	/************** 一级分类管理 ***********************/
	/**
	 * 查询一级分类集合信息
	 * @return
	 * @throws Exception
	 */
	public List<BigCategory> findbgclist()throws Exception;
	
	/**
	 * 分页查询所有一级分类,按一级分类名称查询
	 * @param bigCategory
	 * @param bgcName
	 * @throws Exception
	 */
	public void findbgcbybgcName(PageModel<BigCategory> bigCategory, String bgcName) throws Exception;
	
	/**
	 * 根据id查找一级分类
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public BigCategory findbgcbyId(String id) throws Exception;
	
	/**
	 * 判断一级分类编号或大类名称是否已存在
	 * @param bgcId
	 * @param bgcName
	 * @return
	 * @throws Exception
	 */
	public String bgclist(String bgcId,String bgcName)throws Exception;
	
	/**
	 * 更新一级分类实体
	 * @param bigCategory
	 * @throws Exception
	 */
	public void updatebgc(BigCategory bigCategory)throws Exception;
	
	/**
	 * 保存一级分类实体
	 * @param bigCategory
	 * @throws Exception
	 */
	public void savebgc(BigCategory bigCategory) throws Exception;
	
	/**
	 * 根据id删除一级分类
	 * @param bid
	 */
	public void delbgcbyid(String bid) throws Exception;

	/*******************************************/

	/************** 二级分类管理 ***********************/

	/**
	 * 分页查询所有二级分类,按一级分类名称查询或按二级分类名称模糊查询
	 * @param smallCategory
	 * @param bgcName
	 * @param slcName
	 * @throws Exception
	 */
	public void findslc(PageModel<SmallCategory> smallCategory,String bgcName,String slcName) throws Exception;
	
	public String slclist(String slcId,String slcName)throws Exception;//判断小类编号或小类名称是否已存在
	
	/**
	 * 根据大类id查找该一级分类对应的二级分类集合
	 * @param mid
	 * @return
	 * @throws Exception
	 */
	public List<SmallCategory> findslcbybid(String bid) throws Exception;

	
	/**
	 * 删除二级分类集合
	 * @param scllist
	 * @throws Exception
	 */
	public void delscllist(List<SmallCategory> scllist) throws Exception;
	
	//删除小类
	public void delslcbyid(String bid)throws Exception;
	
	/**
	 * 根据小类id查找小类数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SmallCategory findslcbyId(String id) throws Exception;
	
	/**
	 * 更新二级分类实体
	 * @param smallCategory
	 * @throws Exception
	 */
	public void updateslc(SmallCategory smallCategory)throws Exception;
	

	public void saveslc(SmallCategory smallCategory) throws Exception;// 保存实体
	
	/*******************************************/

	/**
	 * 动态获取所有大类
	 * @author LMX
	 * @return
	 * @throws Exception
	 */
	public List<BigCategory> findAllBigcategory() throws Exception;

	/**
	 * 根据大类id查询对应小类
	 * @author LMX
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<SmallCategory> getSmallcategoryByBigcategoryId(String id) throws Exception;
	
}
