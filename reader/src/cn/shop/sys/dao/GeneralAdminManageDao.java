package cn.shop.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.shop.core.base.BaseDao;
import cn.shop.core.page.PageModel;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.Role;

/**
 *@author jerry-HJY
 *上午8:59:57
 */
@Repository("generalAdminManageDao")
public class GeneralAdminManageDao extends BaseDao{
	/**
	 * 查询所有普通管理员 分页
	 * @param pageModel
	 * @param sex 
	 * @param keyWord 
	 * @throws Exception 
	 */
	public void findPageGeneralAdmin(PageModel<GeneralAdmin> pageModel, String keyWord, String sex) throws Exception{
		String hql="from GeneralAdmin ga where 1=1";	
		if(keyWord != null && !"".equals(keyWord)){
			//姓名关键字不为空
			hql+=" and ga.realName like '%"+keyWord+"%'";
		}
		if(sex != null && !"all".equals(sex)){
			//性别不为空
			hql+=" and ga.gender ='"+sex+"'";
		}
		this.find(pageModel, hql, null);
	}
	/**
	 * 查找同名用户名
	 * @throws Exception
	 */
	public boolean findSameGAname(GeneralAdmin generalAdmin) throws Exception{
		List<GeneralAdmin> list=this.find("from GeneralAdmin where userName='"+generalAdmin.getUserName()+"'");
		if(list.size()>0){
			return true;//有同名
		}
		else{
			return false;
		}
	}
	/**
	 * 添加普通管理员
	 * @throws Exception 
	 */
	public void saveGeneralAdmin(GeneralAdmin generalAdmin) throws Exception {
		this.save(generalAdmin);
	}
	/**
	 * 更新、修改普通管理员
	 */	
	public void updateGA(GeneralAdmin generalAdmin) throws Exception {
		this.update(generalAdmin);
	}
	/**
	 * 根据id查找普通管理员
	 */
	public GeneralAdmin findGAbyId(String id) throws Exception {		
		List<GeneralAdmin> list=find("from GeneralAdmin where id='"+id+"'");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	/**
	 * 删除管理员
	 */
	public void deleteGA(GeneralAdmin generalAdmin) throws Exception {
		this.delete(generalAdmin);
	}
	
	/**
	 * 查找所有角色
	 * @return
	 * @throws Exception
	 */
	public List<Role> findAllRole() throws Exception{
		String hql ="from Role";
		List<Role> list = this.find(hql);
		return list;
	}
}
