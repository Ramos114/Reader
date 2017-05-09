package cn.reader.book.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.reader.book.dao.BookDao;
import cn.reader.book.entity.Book;
import cn.reader.book.entity.Chapter;
import cn.reader.book.entity.ChapterData;
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
	
	/**
	 * 根据图书id查询章节信息
	 */
	@Override
	public List<Chapter> findChapterByBookId(String id) throws Exception {
		return this.bookDao.findChapterByBookId(id);
	}
	
	/**
	 * 根据图书id和章节id,查询章节内容
	 */
	@Override
	public List<ChapterData> findChapterDataByBookIdAndChapterId(String bookId,
			String chapterId) throws Exception {
		return this.bookDao.findChapterDataByBookIdAndChapterId(bookId,chapterId);
	}



}
