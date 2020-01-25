package stddb;

import java.sql.*; 
import java.util.ArrayList; 

// table studenti 연동 자바빈 
public class StudentDatabase {

	// ?곗씠?곕쿋?댁뒪 ?곌껐 愿???곸닔 ?좎뼵
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://right.jbnu.ac.kr:3306/A201414290";
	private static final String USER = "A201414290";
	private static final String PASSWD = "1234";

	// ?곗씠?곕쿋?댁뒪 ?곌껐 愿??蹂???좎뼵
	private Connection con = null;
	private Statement stmt = null;

	// JDBC ?쒕씪?대쾭瑜?濡쒕뱶?섎뒗 ?앹꽦??
	public StudentDatabase() {
		// JDBC Driver load
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	// Database Connection method
	public void connect() {
		try {
			// Store actual connection object
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// disconnect 
	public void disconnect() {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// return all record
		public ArrayList<StudentEntity> getStudentList() {	
		connect();
		// Store query result into ArrayList
		ArrayList<StudentEntity> list = new ArrayList<StudentEntity>();

		String SQL = "select * from student";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);

			//ResultSet??寃곌낵?먯꽌 紐⑤뱺 ?됱쓣 媛곴컖??StudentEntity 媛앹껜????? 
			while (rs.next()) {		
				//Strore one student record
				StudentEntity stu = new StudentEntity();

				//store std into javabean object
				stu.setId ( rs.getString("id") );
				stu.setName ( rs.getString("name") );
				stu.setYear ( rs.getInt("year") );
				stu.setDepart ( rs.getString("department") );
				//ArrayList???숈깮?뺣낫 StudentEntity 媛앹껜瑜?異붽?
				list.add(stu);
			}
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		//?꾩꽦??ArrayList 媛앹껜瑜?諛섑솚
		return list;
	}

}

