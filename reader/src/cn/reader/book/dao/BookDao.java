package cn.reader.book.dao;

import org.springframework.stereotype.Repository;

import cn.reader.book.entity.Book;
import cn.reader.core.base.BaseDao;
import cn.reader.core.page.PageModel;

@Repository
public class BookDao extends BaseDao{

	/**
	 * 查询所有图书 分页
	 * @param pageModel
	 * @throws Exception
	 */
	public void findPageBook(PageModel<Book> pageModel) throws Exception{
		final String hql = "from Book";
		this.find(pageModel, hql, null);
	}

}
