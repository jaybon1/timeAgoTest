package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import db.DBConn;
import dto.Table1;

public class UsersRepository {
	private static final String TAG = "UserRepository : "; // TAG 생성 (오류 발견시 용이)
	private static UsersRepository instance = new UsersRepository();

	private UsersRepository() {
	}

	public static UsersRepository getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//테스트
	public List<Table1> findTime() {
		final String SQL = "SELECT * FROM table1 ";
		List<Table1> table1s = null;
		
		try {

			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			table1s = new ArrayList<>();
			
			while (rs.next()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time = sdf.format(rs.getTimestamp(3));
				
				long ts = Timestamp.valueOf(time).getTime();
				
				Table1 t1 = Table1.builder()
						.id(rs.getInt(1))
						.text(rs.getString(2))
						.time(ts)
						.build();
				
				table1s.add(t1);
				
			}

			return table1s;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "findTime : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}

		return null;
	}
}
