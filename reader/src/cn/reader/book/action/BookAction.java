package cn.reader.book.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import cn.reader.book.entity.Book;
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
		@Result(name="productDetailsUI",location="/model/manager/pro/productDetails.jsp"),
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
	
	/**
	 * 查询所有图书 分页
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

}
