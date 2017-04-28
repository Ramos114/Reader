package cn.shop.sys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.core.base.BaseDao;
import cn.shop.core.base.BaseServiceImpl;
import cn.shop.core.page.PageModel;
import cn.shop.sys.dao.GeneralAdminManageDao;
import cn.shop.sys.entity.GeneralAdmin;
import cn.shop.sys.entity.Role;

/**
 *@author jerry-HJY
 *上午8:58:06
 */
@Transactional
@Service("generalAdminManageService")
public class GeneralAdminManageServiceImpl extends BaseServiceImpl implements GeneralAdminManageService{
	
	@Resource
	private GeneralAdminManageDao generalAdminManageDao;
	/**
	 * 查询所有普通管理员 分页
	 * @param pageModel
	 * @throws Exception 
	 */
	@Override
	public void findPageGeneralAdmin(PageModel<GeneralAdmin> pageModel, String keyWord, String sex)
			throws Exception {		
		 this.generalAdminManageDao.findPageGeneralAdmin(pageModel,keyWord, sex);
	}

	@Override
	public BaseDao getBaseDao() {		
		return generalAdminManageDao;
	}
	/**
	 * 查找同名用户名
	 * @throws Exception
	 */
	@Override
	public boolean findSameGAname(GeneralAdmin generalAdmin) throws Exception {
		return generalAdminManageDao.findSameGAname(generalAdmin);				
	}
	/**
	 * 添加普通管理员
	 * @throws Exception 
	 */
	@Override
	public void saveGeneralAdmin(GeneralAdmin generalAdmin) throws Exception {
		this.generalAdminManageDao.saveGeneralAdmin(generalAdmin);
	}
	/**
	 * 更新、修改普通管理员
	 */	
	@Override
	public void updateGA(GeneralAdmin generalAdmin) throws Exception {
		this.generalAdminManageDao.updateGA(generalAdmin);
	}
	/**
	 * 根据id查找普通管理员
	 */
	
	@Override
	public GeneralAdmin findGAbyId(String id) throws Exception {
		return this.generalAdminManageDao.findGAbyId(id);				
	}
	/**
	 * 删除管理员
	 */
	@Override
	public void deleteGA(GeneralAdmin generalAdmin) throws Exception {
		this.generalAdminManageDao.deleteGA(generalAdmin);
	}

	/**
	 * 查找所有角色
	 */
	@Override
	public List<Role> findAllRole() throws Exception {
		// TODO Auto-generated method stub
		return this.generalAdminManageDao.findAllRole();
	}

}
