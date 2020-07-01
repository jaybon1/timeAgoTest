package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Table1;
import repository.UsersRepository;


public class TimeTest implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UsersRepository usersRepository = UsersRepository.getInstance();
		List<Table1> table1s = usersRepository.findTime();
		
		request.setAttribute("tables", table1s);
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/time.jsp");
		rd.forward(request, response);

	}
}
