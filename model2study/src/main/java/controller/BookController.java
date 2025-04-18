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
	
	
//	@RequestMapping("bookForm")
//	public String bookForm(HttpServletRequest request,
//			HttpServletResponse response) {	
//	String login = (String)request.getSession().getAttribute("login");
//	
//	if(login == null) {
//		request.setAttribute("msg", "로그인하십쇼");
//		request.setAttribute("url", "../member/loginForm");
//	}
//	return "alert";
//	}
	
	
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
		request.setAttribute("msg", "방명록이 저장되었습니다");
		request.setAttribute("url", "bookList");
		} else {
		request.setAttribute("msg", "오류발생 저장못함");
		request.setAttribute("url", "writeForm");
		}
	}
		return "alert";
	}
	
	@RequestMapping("listForm")
	public String list(HttpServletRequest request,
			HttpServletResponse response) {
		Book b = new Book();
		Book book = dao.selectOne(writer);
		
		return null;
	}
	
}
	

