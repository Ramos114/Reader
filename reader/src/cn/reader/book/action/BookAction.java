package cn.reader.book.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import cn.reader.book.entity.Book;
import cn.reader.book.entity.Chapter;
import cn.reader.book.entity.ChapterData;
import cn.reader.book.service.IBookService;
import cn.reader.core.base.BaseAction;
import cn.reader.core.page.PageModel;
import cn.reader.core.page.PageUtils;
import cn.reader.core.utils.GsonUtils;

/**
 * 图书Action
 * 
 * @author LMX
 *
 */
@Action(value = "BookAction")
@Scope("prototype")
@Results(value={
		@Result(name="bookDetailsUI",location="/model/manager/book/bookDetails.jsp"),
		@Result(name="productAddUI",location="/model/manager/pro/productAdd.jsp"),
		@Result(name="productEditUI",location="/model/manager/pro/productEdit.jsp"),
		@Result(name="input",location="/model/manager/book/bookManage.jsp"),
})
public class BookAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(BookAction.class);
	
	// 注入商品Service
	@Resource
	private IBookService bookService;
	
	//图书实体
	private Book book;

	//章节实体
	private Chapter chapter;
	



	/**
	 * 分页查询所有图书 
	 * @return
	 * @throws Exception
	 */
	public String findPageBook() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "error");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();

			PageModel<Book> pageModel = new PageModel<Book>();
			this.setPageModel(pageModel);
			this.bookService.findPageBook(pageModel);
			out.write(PageUtils.setModelJson(pageModel));
		} catch (Exception e) {
			e.printStackTrace();
			out.write(GsonUtils.GSON.toJson(result));
			log.error(e.getMessage(), e);
		} finally {
			out.close();
		}
		return null;
	}
	
	
	/**
	 * 根据图书id查询图书信息
	 * http://localhost:8080/reader/BookAction!findBookById?book.id=01
	 * @return
	 * @throws Exception
	 */
	public String findBookById() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			book = this.bookService.get(Book.class, book.getId());
			result.put("book", book);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return "input";
	}
	
	/**
	 * 根据章节id查询章节信息
	 * @return
	 * @throws Exception
	 */
	public String findChapterById() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			chapter = this.bookService.get(Chapter.class, chapter.getId());
			result.put("chapter", chapter);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return "input";
	}
	
	/**
	 * 根据图书id查询章节信息
	 * http://localhost:8080/reader/BookAction!findChapterByBookId?book.id=01
	 * @return
	 * @throws Exception
	 */
	public String findChapterByBookId() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			List<Chapter> list= this.bookService.findChapterByBookId(book.getId());
			result.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return "input";
	}
	
	
	/**
	 * 根据图书id和章节id,查询章节内容
	 * http://localhost:8080/reader/BookAction!findChapterDataByBookIdAndChapterId?book.id=01&chapter.id=01
	 * @return
	 * @throws Exception
	 */
	public String findChapterDataByBookIdAndChapterId() throws Exception {
		// 结果集
		final Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");

		PrintWriter out = null;
		try {
			out = this.response.getWriter();
			List<ChapterData> list= this.bookService.findChapterDataByBookIdAndChapterId(book.getId(),chapter.getId());
			result.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			log.error(e.getMessage(), e);
		} finally {
			out.write(GsonUtils.GSON.toJson(result));
			out.close();
		}
		return "input";
	}
	
	/**
	 * 跳转到商品详细页面,(获取id,并将id传到详情页面中)
	 * @return
	 * @throws Exception
	 */
	public String bookDetailsUI() throws Exception {
		try {
			// 获取选中的图书Id,传到详情页
			this.request.setAttribute("bookId", book.getId());
			return "bookDetailsUI";
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			return "input";
		}
	}
	
	
	
	
	public IBookService getBookService() {
		return bookService;
	}
	public void setBookService(IBookService bookService) {
		this.bookService = bookService;
	}

	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}

	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}
	
	
}
