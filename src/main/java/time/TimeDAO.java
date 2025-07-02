package time;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class TimeDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public TimeDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/db2020029607?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "kce1005!!";
            java.lang.Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String classStartTime(String class_id) { //수업 시작 시간
        String SQL = "SELECT begin FROM TIME WHERE class_id =?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 데이터베이스 오류
    }

    public String classEndTime(String class_id) { //수업 끝나는 시간
        String SQL = "SELECT end FROM TIME WHERE class_id =?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 데이터베이스 오류
    }

    public int getNextTimeID() { //마지막 time_id 반환
        String SQL = "SELECT time_id FROM time order by time_id DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            } return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; //데이터베이스 오류
    }

    public int addClassTime(String class_id, String date, String begin, String end) { //과목 시간 추가 코드
        String SQL = "INSERT INTO time VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNextTimeID());
            pstmt.setString(2, class_id);
            pstmt.setInt(3, 0);
            pstmt.setString(4, date + "T" + begin);
            pstmt.setString(5, date + "T" + end);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; //데이터베이스 오류
    }

    public int delete(String class_id) { //과목 시간 삭제 코드
        String SQL = "DELETE FROM time WHERE class_id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; //데이터베이스 오류
    }

    public String getDayOfWeek(String begin) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
        Date myDate = df.parse(begin);
        String m_week = null;

        Calendar cal = Calendar.getInstance();
        cal.setTime(myDate);

        int day_of_week = cal.get(Calendar.DAY_OF_WEEK);
        switch (day_of_week) {
            case 1:
                m_week = "일요일";
                break;
            case 2:
                m_week = "월요일";
                break;
            case 3:
                m_week = "화요일";
                break;
            case 4:
                m_week = "수요일";
                break;
            case 5:
                m_week = "목요일";
                break;
            case 6:
                m_week = "금요일";
                break;
            case 7:
                m_week = "토요일";
                break;
        } return m_week;
    }
}
