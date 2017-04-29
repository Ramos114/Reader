package cn.reader.sys.service;

import java.util.List;

import cn.reader.core.base.BaseService;
import cn.reader.core.page.PageModel;
import cn.reader.sys.entity.GeneralAdmin;
import cn.reader.sys.entity.Role;

/**
 *@author jerry-HJY
 *上午8:57:57
 */
public interface GeneralAdminManageService extends BaseService{
	/**
	 * 查询所有普通管理员 分页
	 * @param pageModel
	 * @param sex 
	 * @param keyWord 
	 * @throws Exception 
	 */
	public void findPageGeneralAdmin(PageModel<GeneralAdmin> pageModel, String keyWord, String sex) throws Exception;
	/**
	 * 查找同名用户名
	 * @throws Exception
	 */
	public boolean findSameGAname(GeneralAdmin generalAdmin) throws Exception;
	/**
	 * 添加普通管理员
	 */
	public void saveGeneralAdmin(GeneralAdmin generalAdmin) throws Exception;
	
	/**
	 * 更新、修改普通管理员
	 */
	public void updateGA(GeneralAdmin generalAdmin) throws Exception;
	/**
	 * 根据id查找普通管理员
	 */
	public GeneralAdmin findGAbyId(String id) throws Exception;
	/**
	 * 删除管理员
	 */
	public void deleteGA(GeneralAdmin generalAdmin) throws Exception;
	/**
	 * 查找所有角色
	 * @return
	 * @throws Exception
	 */
	public List<Role> findAllRole() throws Exception;
}
