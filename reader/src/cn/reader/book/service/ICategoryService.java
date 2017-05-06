package cn.reader.book.service;

import java.util.List;

import cn.reader.book.entity.BigCategory;
import cn.reader.book.entity.SmallCategory;
import cn.reader.core.base.BaseService;
import cn.reader.core.page.PageModel;


public interface ICategoryService extends BaseService {

	/************** 大类别管理 ***********************/
	
	public List<BigCategory> findbgclist()throws Exception;
	
	/**
	 * 分页查询所有大类别,按大类别名称查询
	 * @param bigCategory
	 * @param bgcName
	 * @throws Exception
	 */
	public void findbgcbybgcName(PageModel<BigCategory> bigCategory, String bgcName) throws Exception;
	
	/**
	 * 根据id查找大类别
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public BigCategory findbgcbyId(String id) throws Exception;
	
	/**
	 * 判断大类别编号或大类名称是否已存在
	 * @param bgcId
	 * @param bgcName
	 * @return
	 * @throws Exception
	 */
	public String bgclist(String bgcId,String bgcName)throws Exception;
	
	/**
	 * 更新大类别实体
	 * @param bigCategory
	 * @throws Exception
	 */
	public void updatebgc(BigCategory bigCategory)throws Exception;
	
	/**
	 * 保存大类别实体
	 * @param bigCategory
	 * @throws Exception
	 */
	public void savebgc(BigCategory bigCategory) throws Exception;
	
	/**
	 * 根据id删除大类别
	 * @param bid
	 */
	public void delbgcbyid(String bid) throws Exception;

	/*******************************************/

	/************** 小类别管理 ***********************/

	public void findslc(PageModel<SmallCategory> smallCategory,String bgcName,
			String slcName) throws Exception;// 查找小类数据
	
	public String slclist(String slcId,String slcName)throws Exception;//判断小类编号或小类名称是否已存在
	
	/**
	 * 根据大类id查找该大类别对应的小类别集合
	 * @param mid
	 * @return
	 * @throws Exception
	 */
	public List<SmallCategory> findslcbybid(String bid) throws Exception;

	
	/**
	 * 删除小类别集合
	 * @param scllist
	 * @throws Exception
	 */
	public void delscllist(List<SmallCategory> scllist) throws Exception;
	
	//删除小类
	public void delslcbyid(String bid)throws Exception;
	
	public SmallCategory findslcbyId(String id) throws Exception;// 按小类id查找小类数据
	
	public void updateslc(SmallCategory smallCategory)throws Exception;// 更新实体
	

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
