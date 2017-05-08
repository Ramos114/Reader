package cn.reader.book.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.reader.book.dao.CategoryDao;
import cn.reader.book.entity.BigCategory;
import cn.reader.book.entity.SmallCategory;
import cn.reader.core.base.BaseDao;
import cn.reader.core.base.BaseServiceImpl;
import cn.reader.core.page.PageModel;


// 此处表示自动完成事物的开始和提交
@Transactional
// 注册CategoryServiceImpl为一个名为：categoryService的逻辑业务，在action中的名称要一致
@Service("categoryService")
public class CaregoryServiceImpl extends BaseServiceImpl implements ICategoryService {

	// 注入一级分类Dao
	@Resource
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	/************** 一级分类管理 ***********************/
	
	/**
	 * 查询一级分类集合
	 */
	@Override
	public List<BigCategory> findbgclist() throws Exception {
		return this.categoryDao.findbgclist();
	}
	
	/**
	 * 分页查询所有一级分类,按一级分类名称查询
	 */
	@Override
	public void findbgcbybgcName(PageModel<BigCategory> bigCategory, String bgcName) throws Exception {
		this.categoryDao.findbgcbybgcName(bigCategory, bgcName);
	}
	
	/**
	 * 根据id删除一级分类
	 */
	@Override
	public void delbgcbyid(String bid) throws Exception{
		this.categoryDao.delete(BigCategory.class, bid);
	}
	
	/**
	 * 根据id查找一级分类
	 */
	@Override
	public BigCategory findbgcbyId(String id) throws Exception {
		return this.categoryDao.findbgcbyId(id);
	}
	
	/**
	 * 判断一级分类编号或大类名称是否已存在
	 */
	@Override
	public String bgclist(String bgcId, String bgcName) throws Exception {
		return this.categoryDao.bgclist(bgcId, bgcName);
	}

	/**
	 * 保存一级分类实体
	 */
	@Override
	public void savebgc(BigCategory bigCategory) throws Exception {
		this.categoryDao.save(bigCategory);
	}

	//更新一级分类实体
	@Override
	public void updatebgc(BigCategory bigCategory) throws Exception {
		this.categoryDao.updatebgc(bigCategory);
	}
	
	/*******************************************/

	/************** 二级分类管理 ***********************/
	
	/**
	 * 分页查询所有二级分类,按一级分类名称查询或按二级分类名称模糊查询
	 */
	@Override
	public void findslc(PageModel<SmallCategory> smallCategory, String bgcName,String slcName) throws Exception {
		this.categoryDao.findslc(smallCategory,bgcName,slcName);
	}


	/**
	 * 根据大类id查找该一级分类对应的二级分类集合
	 */
	@Override
	public List<SmallCategory> findslcbybid(String bid) throws Exception {
		return this.categoryDao.findslcbybid(bid);
	}
	
	/**
	 * 删除二级分类集合
	 */
	@Override
	public void delscllist(List<SmallCategory> scllist) throws Exception {
		if (scllist != null && scllist.size() > 0) {
			for (int i = 0; i < scllist.size(); i++)
				this.delslcbyid(scllist.get(i).getId());
		}
	}
	

	/**
	 * 根据小类id删除小类
	 */
	@Override
	public void delslcbyid(String sid) {
		this.categoryDao.delete(SmallCategory.class, sid);
	}
	

	/**
	 * 根据小类id查找小类数据
	 */
	@Override
	public SmallCategory findslcbyId(String id) throws Exception {
		return this.categoryDao.findslcbyId(id);
	}

	/**
	 * 更新二级分类实体
	 */
	@Override
	public void updateslc(SmallCategory smallCategory) throws Exception {
		this.categoryDao.updateslc(smallCategory);
	}
	

	@Override
	public String slclist(String slcId, String slcName) throws Exception {
		return this.categoryDao.slclist(slcId, slcName);
	}
	
	@Override
	public void saveslc(SmallCategory smallCategory) throws Exception {
		this.categoryDao.save(smallCategory);
	}

	/*******************************************/

	@Override
	public BaseDao getBaseDao() {
		return null;
	}

	
	/**
	 * 动态获取所有大类
	 */
	@Override
	public List<BigCategory> findAllBigcategory() throws Exception {
		return this.categoryDao.findAllBigcategory();
	}

	/**
	 * 根据大类id查询对应小类
	 */
	@Override
	public List<SmallCategory> getSmallcategoryByBigcategoryId(String id) throws Exception {
		return this.categoryDao.getSmallcategoryByBigcategoryId(id);
	}



}
