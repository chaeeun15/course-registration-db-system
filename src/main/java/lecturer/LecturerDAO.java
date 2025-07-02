package lecturer;

import java.sql.*;
import java.util.ArrayList;

public class LecturerDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public LecturerDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/db2020029607?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "kce1005!!";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public String test(String lecturer_id, String lecturer_pwd) {
        String test = lecturer_id + " " + lecturer_pwd;
        return test;
    }

    public int administrator(String lecturer_id, int administrator) //관리자 로그인 코드
    {
        String SQL = "SELECT administrator FROM LECTURER WHERE lecturer_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, lecturer_id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals("1")) {
                    return administrator;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return 0; // 데이터베이스 오류
    }

    public int login(String lecturer_id, String lecturer_pwd) {
        String SQL = "SELECT lecturer_pwd, administrator FROM LECTURER WHERE lecturer_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, lecturer_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(lecturer_pwd) && rs.getString(2).equals("1")) {
                    return 1; //관리자 계정으로 로그인 성공
                } else {
                    return 0; //비밀번호 불일치
                }
            } return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } return -2; // 데이터베이스 오류
    }
}
