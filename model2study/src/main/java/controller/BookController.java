package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.book.Book;
import model.book.BookDao;

@WebServlet(urlPatterns = {"/book/*"},
	initParams= {@WebInitParam(name="view", value="/view/")})
public class BookController extends MskimRequestMapping {
	private BookDao dao = new BookDao();	
	
	@RequestMapping("bookwrite")
	public String bookwrite(HttpServletRequest request,
			HttpServletResponse response) {	
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//로그인 되었을때만 접근하게 만들자
	String login = (String)request.getSession().getAttribute("login");
	if(!writer.equals(login)){
		request.setAttribute("msg", "글쓴이와 로그인 사용자 이름이 같지 않습니다.");
		request.setAttribute("url", "bookForm");
	}else {
	// Book 객체 생성
	Book b = new Book();
	//파라미터 값 book 객체에 저장
	b.setWriter(writer);
	b.setTitle(title);
	b.setContent(content);
	if(dao.insert(b)) {
		return "redirect:bookList";
		} else {
		request.setAttribute("msg", "오류발생 저장못함");
		request.setAttribute("url", "writeForm");
		}
	}
		return "alert";
	}
	
	@RequestMapping("bookList")
	public String booklist(HttpServletRequest request,
			HttpServletResponse response) {	
		List<Book> list = dao.list();
		request.setAttribute("list", list);
		return "book/bookList";  //view로 forward 함
								//view : /webapp/view/book/bookList.jsp
	}
	
}
	

