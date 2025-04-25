package ex03_parameter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetServlet
 */
@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터의 인코딩 방식은 UTF-8로 설정
		request.setCharacterEncoding("UTF-8");
		//name = model인 입력값을 조회
		String model = request.getParameter("model");
		//name = price인 입력값을 조회
		String price = request.getParameter("price");
		//response.setContentType("text/html; charset=UTF-8") : servlet에서 한글이 깨지지 않게 출력하는 코드
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("모델명 : "+ model).append(",가격 : "+price);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
