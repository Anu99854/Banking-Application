

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

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root", "Mysql@123");
            String getCustomerIdQuery = "SELECT customer_id FROM customer WHERE account_no = ?";
            PreparedStatement ps1 = con.prepareStatement(getCustomerIdQuery);
            ps1.setString(1, accountNo);
            ResultSet rs = ps1.executeQuery();
            int customerId = -1;
            if (rs.next()) {
                customerId = rs.getInt("customer_id");
            }
            
            String deleteTransactionsQuery = "DELETE FROM transactions WHERE customer_id = ?";
            PreparedStatement ps2 = con.prepareStatement(deleteTransactionsQuery);
            ps2.setInt(1, customerId);
            ps2.executeUpdate();
            PreparedStatement ps = con.prepareStatement("DELETE FROM customer WHERE account_no = ?");
            ps.setString(1, accountNo);
            ps.executeUpdate();

            session.invalidate();
            response.sendRedirect("customerLogin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}