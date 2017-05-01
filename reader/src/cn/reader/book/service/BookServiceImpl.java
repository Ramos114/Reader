package cn.reader.book.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.reader.book.dao.BookDao;
import cn.reader.book.entity.Book;
import cn.reader.core.base.BaseDao;
import cn.reader.core.base.BaseServiceImpl;
import cn.reader.core.page.PageModel;

@Transactional
@Service("BookService")
public class BookServiceImpl extends BaseServiceImpl implements IBookService{
	
	//注入图书DAO
	@Resource
	private BookDao bookDao;

	public BookDao getBookDao() {
		return bookDao;
	}
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	
	@Override
	public BaseDao getBaseDao() {
		// TODO Auto-generated method stub
		return bookDao;
	}
	
	/**
	 * 查询所有图书 分页
	 */
	@Override
	public void findPageBook(PageModel<Book> pageModel) throws Exception {
		this.bookDao.findPageBook(pageModel);
	}



}
