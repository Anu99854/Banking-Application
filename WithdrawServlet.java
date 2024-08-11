

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root", "Mysql@123");

            PreparedStatement ps = con.prepareStatement("SELECT initial_balance FROM customer WHERE account_no = ?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double currentBalance = rs.getDouble("initial_balance");
                if (currentBalance >= amount) {
                    ps = con.prepareStatement("UPDATE customer SET initial_balance = initial_balance - ? WHERE account_no = ?");
                    ps.setDouble(1, amount);
                    ps.setString(2, accountNo);
                    ps.executeUpdate();

                    ps = con.prepareStatement("INSERT INTO transactions (customer_id, amount, type) VALUES ((SELECT customer_id FROM customer WHERE account_no=?), ?, 'Withdraw')");
                    ps.setString(1, accountNo);
                    ps.setDouble(2, amount);
                    ps.executeUpdate();

                    response.sendRedirect("viewCustomers.jsp");
                } else {
                    response.getWriter().print("Insufficient Balance");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
