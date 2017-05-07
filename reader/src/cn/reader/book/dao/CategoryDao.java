package cn.reader.book.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.reader.book.entity.BigCategory;
import cn.reader.book.entity.SmallCategory;
import cn.reader.core.base.BaseDao;
import cn.reader.core.page.PageModel;


/**
 * 
 * @author wrk 2016年11月28日下午12:17:05
 */
@Repository(value = "categoryDao")
public class CategoryDao extends BaseDao {

	/************** 大类别管理 ***********************/

	private List<BigCategory> list1;
	private List<BigCategory> list2;

	/**
	 * 查询大类别集合
	 * @return
	 * @throws Exception
	 */
	public List<BigCategory> findbgclist() throws Exception {
		final String hql = "from BigCategory";
		return this.find(hql);
	}
	
	/**
	 * 分页查询所有大类别,按大类别名称查询
	 * @param bigCategory
	 * @param bgcName
	 * @throws Exception
	 */
	public void findbgcbybgcName(PageModel<BigCategory> bigCategory, String bgcName) throws Exception {
		final String hql;
		if (bgcName == null || bgcName == "") {
			hql = "from BigCategory ";
		} else {
			hql = "from BigCategory where bgcName like '%" + bgcName + "%'";
		}

		this.find(bigCategory, hql, null);
	}
	
	/**
	 * 根据id查找大类别
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public BigCategory findbgcbyId(String id) throws Exception {		
		final String hql = "from BigCategory where id=?";
		List<BigCategory> list = this.find(hql, new Object[]{id});
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 判断大类别编号或大类名称是否已存在	
	 * @param bgcId
	 * @param bgcName
	 * @return
	 * @throws Exception
	 */
	public String bgclist(String bgcId, String bgcName) throws Exception {
		String f = null;
		String hql1 = "from BigCategory where bgcId='" + bgcId + "'";
		list1 = this.find(hql1);

		if (list1 == null || list1.size() == 0) {
			String hql2 = "from BigCategory where bgcName='" + bgcName + "'";

			list2 = this.find(hql2);
			if (list2 == null || list2.size() == 0) {
				f = null;
			} else {
				f = "bgcName_exist";
			}

		} else {
			f = "bgcId_exist";
		}

		return f;
	}
	
	/**
	 * 更新大类别实体
	 * @param bigCategory
	 * @throws Exception
	 */
	public void updatebgc(BigCategory bigCategory)throws Exception{
		this.update(bigCategory);
	}
	
	/*******************************************/


	/************** 小类别管理 ***********************/

	/**
	 * 分页查询所有小类别,按大类别名称查询或按小类别名称模糊查询
	 * @param smallCategory
	 * @param bgcName
	 * @param slcName
	 * @throws Exception
	 */
	public void findslc(PageModel<SmallCategory> smallCategory,String bgcName,String slcName) throws Exception {
		String hql;
		if (!bgcName.equals("全部") && bgcName != "" && slcName == "") {
			hql = "from SmallCategory where bigCategory.bgcName='" + bgcName + "'";
		} else if (slcName != "" && bgcName == "") {
			hql = "from SmallCategory where slcName like '%" + slcName + "%'";
		} else {
			hql = "from SmallCategory";
		}
		this.find(smallCategory, hql, null);
	}

	/**
	 * 根据大类id查找该大类别对应的小类别集合
	 * @param bid
	 * @return
	 * @throws Exception
	 */
	public List<SmallCategory> findslcbybid(String bid)throws Exception {
		final String hql = "from SmallCategory where bigCategory.id=?";
		return this.find(hql, new Object[]{bid});
	}
	
	public void saveslc(SmallCategory smallCategory) throws Exception {
		this.save(smallCategory);
	}
	
	
	/**
	 * 根据小类id查找小类数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SmallCategory  findslcbyId(String id) throws Exception {	
		final String hql = "from SmallCategory where id=?";
		List<SmallCategory> list=find(hql, new Object[]{id});
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	//判断小类编号或小类名称是否已存在
	
		public String slclist(String slcId, String slcName) throws Exception {
				// TODO Auto-generated method stub
			String f=null;
			String hql1 = "from SmallCategory where slcId='" + slcId+ "'";
			list1 = this.find(hql1);
			
			if(list1==null||list1.size()==0){
				String hql2 = "from SmallCategory where slcName='" + slcName+ "'";
				
				list2 = this.find(hql2);
				if(list2==null||list2.size()==0){
					f=null;
					
				}
				else{
					f="slcName_exist";
				}
				
			}else{
				f="slcId_exist";
			}
			
			return f;
		}

	/**
	 * 更新小类别实体
	 * @param smallCategory
	 * @throws Exception
	 */
	public void updateslc(SmallCategory smallCategory)throws Exception{
		this.update(smallCategory);
	}
	/*******************************************/

	/**
	 * 动态获取所有大类
	 * @return
	 * @throws Exception
	 */
	public List<BigCategory> findAllBigcategory() throws Exception{
		final String hql="from BigCategory";
		return this.find(hql);
	}

	/**
	 * 根据大类id查询对应小类
	 * @param id
	 * @return
	 */
	public List<SmallCategory> getSmallcategoryByBigcategoryId(String id) {
		final String hql="from SmallCategory where bigCategory.id=?";
		return this.find(hql,new Object[]{id});
	}

}
