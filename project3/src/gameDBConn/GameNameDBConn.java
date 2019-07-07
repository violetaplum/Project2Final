package gameDBConn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GameNameDBConn {
	private Connection con;
	public Connection getConnection(){
		return con;
	}
	public GameNameDBConn() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");		
		con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "hr", "hr");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
