package room;

import student.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RoomDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public RoomDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/db2020029607?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "kce1005!!";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int roomOccupancy(int room_id) {
        String SQL = "SELECT occupancy FROM ROOM WHERE room_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, room_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // 데이터베이스 오류
    }

    public int getRoom_id(String class_id) {
        String SQL = "SELECT room_id FROM CLASS WHERE class_id =?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // 데이터베이스 오류
    }
}
