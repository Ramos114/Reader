package cn.reader.book.service;

import java.util.List;

import cn.reader.book.entity.Book;
import cn.reader.book.entity.Chapter;
import cn.reader.book.entity.ChapterData;
import cn.reader.core.base.BaseService;
import cn.reader.core.page.PageModel;

public interface IBookService extends BaseService{

	/**
	 * 查询所有图书 分页
	 * @param pageModel
	 * @throws Exception
	 */
	void findPageBook(PageModel<Book> pageModel) throws Exception;
	
	/**
	 * 根据图书id查询章节信息		
	 * @return
	 * @throws Exception
	 */
	public List<Chapter> findChapterByBookId(String id) throws Exception;		
	
	/**
	 * 根据图书id和章节id,查询章节内容
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<ChapterData> findChapterDataByBookIdAndChapterId(String bookId,String chapterId) throws Exception;

}
