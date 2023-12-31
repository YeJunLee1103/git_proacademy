package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 단축키 : ctrl + shift + 'o'

public class UserDAO {
	private Connection conn; // db 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체

	public UserDAO() { // dao 생성자에서 db connection
		try {
			String dbURL = "jdbc:mysql://localhost:3306/academy"; // mySQL 서버의 BBS DB 접근 경로
			String dbID = "root"; // 계정
			String dbPassword = "yejun1103"; // 비밀번호
			Class.forName("com.mysql.jdbc.Driver"); // mysql에 접속을 도와주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 로그인 기능
	public int login(String user_id, String user_pw) {
		String SQL = "SELECT user_pw FROM USER WHERE user_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id); // sql Injection 공격 방어 수단 : 1번째 물음표에 userID 입력
			rs = pstmt.executeQuery(); // 쿼리 실행
			if (rs.next()) {
				if (rs.getString(1).equals(user_pw)) // rs.getString(1) : select된 첫번째 컬럼
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -2; // DB 오류
	}
}