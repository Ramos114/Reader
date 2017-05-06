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

	public List<BigCategory> findbgclist() throws Exception {
		final String hql = "from BigCategory";

		return this.find( hql);
	}
	
	/**
	 * 分页查询所有大类别,按大类别名称查询
	 * @param bigcategory
	 * @param bgcName
	 * @throws Exception
	 */
	public void findbgcbybgcName(PageModel<BigCategory> bigcategory, String bgcName) throws Exception {
		final String hql;
		if (bgcName == null || bgcName == "") {
			hql = "from BigCategory ";
		} else {
			hql = "from BigCategory where bgcName like '%" + bgcName + "%'";
		}

		this.find(bigcategory, hql, null);
	}
	
	/**
	 * 根据id查找大类
	 */
	public BigCategory findbgcbyId(String id) throws Exception {		
		List<BigCategory> list=find("from BigCategory where id='"+id+"'");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	//判断大类编号或大类名称是否已存在
		
	public String bgclist(String bgcId, String bgcName) throws Exception {
			// TODO Auto-generated method stub
		String f=null;
		String hql1 = "from BigCategory where bgcId='" + bgcId+ "'";
		list1 = this.find(hql1);
		
		if(list1==null||list1.size()==0){
			String hql2 = "from BigCategory where bgcName='" + bgcName+ "'";
			
			list2 = this.find(hql2);
			if(list2==null||list2.size()==0){
				f=null;
				
			}
			else{
				f="bgcName_exist";
			}
			
		}else{
			f="bgcId_exist";
		}
		
		return f;
	}
	
	public void updatebgc(BigCategory bigcategory)throws Exception{
		this.update(bigcategory);
	}
	
	/*******************************************/


	/************** 小类别管理 ***********************/

	
	/**
	 * 查询小类
	 * 
	 * @return
	 * @throws Exception
	 */
	public void findslc(PageModel<SmallCategory> smallCategory,
			String bgcName,String slcName) throws Exception {
		// TODO Auto-generated method stub
		  
		String hql;
		if(!bgcName.equals("全部")&&bgcName!=""&&slcName==""){
			hql = "from SmallCategory where bigcategory.bgcName='"
				+ bgcName + "'";
		}
		else if(slcName!=""&&bgcName==""){
			hql = "from SmallCategory where slcName like '%"
					+ slcName + "%'";
		}
		else{
			hql="from SmallCategory";
			
		}
		this.find(smallCategory, hql, null);
	}

	public List<SmallCategory> findslcbybid(String bid)throws Exception {
		
		final String hql = "from SmallCategory where bigcategory.id='"+ bid + "'";
		return this.find(hql);
	}
	
	public void saveslc(SmallCategory smallCategory) throws Exception {
		this.save(smallCategory);
	}
	
	/**
	 * 根据id查找大类
	 */
	public SmallCategory  findslcbyId(String id) throws Exception {		
		List<SmallCategory> list=find("from SmallCategory where id='"+id+"'");
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
		final String hql="from SmallCategory where bigcategory.id=?";
		return this.find(hql,new Object[]{id});
	}

}
