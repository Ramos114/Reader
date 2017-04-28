package cn.shop.core.page;

import java.util.HashMap;
import java.util.Map;

import cn.shop.core.utils.GsonUtils;

/**
 * 分页工具类
 */
public final class PageUtils {
	
	

	
	//每页显示数据
	public static final String PAGE_ROWS = "rows";
	
	//当前页码
	public static final String PAGE_PAGE = "page";
	
	//页码总数
	public static final String PAGE_TOTAL = "total";
	
	//数据
	public static final String PAGE_RESULT = "result";
	
	/**
	 * 获取hql统计总记录数hql语句
	 * @param hql
	 * @return
	 */
	public static String getCountHql(String hql) {
		int fromIndex = hql.indexOf("from ");
		//截取from后的语句
		String hqlFrom = hql.substring(fromIndex);

		return "select count(*) " + hqlFrom;
	}
	
	
	/**
	 * 封装分页数据
	 * @param pageModel
	 * @return
	 */
	public static String setModelJson(PageModel pageModel) {

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		result.put(PAGE_PAGE, pageModel.getCurrentPage());
		result.put(PAGE_TOTAL, pageModel.getTotalPage());
		result.put(PAGE_ROWS, pageModel.getTotalRecords());
		result.put(PAGE_RESULT, pageModel.getResult());
		return GsonUtils.GSON.toJson(result);
	}
}
