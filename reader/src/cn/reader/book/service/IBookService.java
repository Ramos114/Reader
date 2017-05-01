package cn.reader.book.service;

import cn.reader.book.entity.Book;
import cn.reader.core.base.BaseService;
import cn.reader.core.page.PageModel;

public interface IBookService extends BaseService{

	/**
	 * 查询所有图书 分页
	 * @param pageModel
	 * @throws Exception
	 */
	void findPageBook(PageModel<Book> pageModel) throws Exception;
	
	

}
