package cn.reader.book.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.reader.book.entity.Book;
import cn.reader.book.entity.Chapter;
import cn.reader.book.entity.ChapterData;
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

	/**
	 * 根据图书id查询章节信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<Chapter> findChapterByBookId(String id) throws Exception{
		final String hql = "from Chapter where book.id=?";
		return this.find(hql, new Object[]{id});
	}

	/**
	 * 根据图书id和章节id,查询章节内容
	 * @param bookId
	 * @param chapterId
	 * @return
	 */
	public List<ChapterData> findChapterDataByBookIdAndChapterId(String bookId,String chapterId) {
		final String hql = "from ChapterData where chapter.id=? and chapter.book.id=?";
		return this.find(hql, new Object[] { chapterId, bookId });
	}

}
