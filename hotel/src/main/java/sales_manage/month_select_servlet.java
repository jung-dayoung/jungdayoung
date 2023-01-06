package sales_manage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/monDivServlet")
public class month_select_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;



  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    sales_function function = new sales_function();


    if (request.getParameter("year") != null && request.getParameter("month") != null) {

      request.setAttribute("start", request.getParameter("start"));
      request.setAttribute("end", request.getParameter("end"));
      request.setAttribute("year", Integer.parseInt(request.getParameter("year")));
      request.setAttribute("month", Integer.parseInt(request.getParameter("month")));

    } else {

      request.setAttribute("start", request.getParameter("start"));
      request.setAttribute("end", request.getParameter("end"));
      request.setAttribute("year", Integer.parseInt(request.getParameter("year")));
      request.setAttribute("month", Integer.parseInt(request.getParameter("month")));
      request.setAttribute("mis", "mis");
    }
    request.getRequestDispatcher("./manage/sales_manage/sales.jsp").forward(request, response);

  }
}
