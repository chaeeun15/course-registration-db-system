package classTable;

import java.sql.*;
import java.util.ArrayList;

public class ClassDAO {
    private Connection conn;
    private ResultSet rs;

    public ClassDAO() {
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

    public int getNext() {
        String SQL = "SELECT class_id FROM class ORDER BY class_id DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs=pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            } return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } return -1;
    }

    public int addClass(String class_id, String course_id, String class_no, String class_name, int person_max, int room_id) { //과목 추가 코드
        String SQL = "INSERT INTO class VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            pstmt.setString(2, class_no);
            pstmt.setString(3, course_id);
            pstmt.setString(4, class_name);
            pstmt.setInt(5, 0);
            pstmt.setInt(6, 0);
            pstmt.setInt(7, 0);
            pstmt.setInt(8, 0);
            pstmt.setInt(9, person_max);
            pstmt.setInt(10, 0);
            pstmt.setInt(11, room_id);
            pstmt.setInt(12, 1);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; //데이터베이스 오류
    }

    public ArrayList<Class> getList(int pageNumber) { //과목 리스트
        String SQL = "SELECT * FROM class WHERE class_id < ? AND classAvailable = 1 ORDER BY class_id LIMIT 20";
        ArrayList<Class> list = new ArrayList<Class>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext()-(pageNumber-1)*20);
            rs=pstmt.executeQuery();
            while (rs.next()) {
                Class classTable = new Class();
                classTable.setClass_id(rs.getString(1));
                classTable.setClass_no(rs.getString(2));
                classTable.setCourse_id(rs.getString(3));
                classTable.setClass_name(rs.getString(4));
                classTable.setMajor_id(rs.getInt(5));
                classTable.setYear(rs.getInt(6));
                classTable.setCredit(rs.getInt(7));
                classTable.setLecturer_id(rs.getInt(8));
                classTable.setPerson_max(rs.getInt(9));
                classTable.setOpened(rs.getInt(10));
                classTable.setRoom_id(rs.getInt(11));
                classTable.setClassAvailable(rs.getInt(12));
                list.add(classTable);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return list;
    }

    public boolean nextPage(int pageNumber) { //다음 페이지. 과목이 20개 단위로 끊겼을 경우 다음 페이지가 없기 때문에
        String SQL = "SELECT * FROM Class WHERE class_id < ? AND classAvailable = 1";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext()-(pageNumber-1)*20);
            rs=pstmt.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Class getClass(String class_id) { //class_id 누르면 정보 보여주는 코드
        String SQL = "SELECT * FROM Class WHERE class_id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            rs=pstmt.executeQuery();
            while (rs.next()) {
                Class classTable = new Class();
                classTable.setClass_id(rs.getString(1));
                classTable.setClass_no(rs.getString(2));
                classTable.setCourse_id(rs.getString(3));
                classTable.setClass_name(rs.getString(4));
                classTable.setMajor_id(rs.getInt(5));
                classTable.setYear(rs.getInt(6));
                classTable.setCredit(rs.getInt(7));
                classTable.setLecturer_id(rs.getInt(8));
                classTable.setPerson_max(rs.getInt(9));
                classTable.setOpened(rs.getInt(10));
                classTable.setRoom_id(rs.getInt(11));
                classTable.setClassAvailable(rs.getInt(12));
                return classTable;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updatePerson(String class_id, String person_max) { //인원 증원 코드
        String SQL = "UPDATE CLASS SET person_max = ? WHERE class_id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, person_max);
            pstmt.setString(2, class_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; //데이터베이스 오류
    }

    public int delete(String class_id) { //과목 삭제 코드
        String SQL = "DELETE FROM class WHERE class_id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; //데이터베이스 오류
    }

    public ArrayList<Class> getSearch(String searchField, String searchText) { //과목 검색 코드
        ArrayList<Class> list = new ArrayList<Class>();
        String SQL = "select * from class where " + searchField.trim();
        try {
            if(searchText != null && !searchText.equals("") ){
                SQL +=" LIKE '%"+searchText.trim()+"%' order by class_id desc limit 20";
            }
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            rs=pstmt.executeQuery();
            while(rs.next()) {
                Class classTable = new Class();
                classTable.setClass_id(rs.getString(1));
                classTable.setClass_no(rs.getString(2));
                classTable.setCourse_id(rs.getString(3));
                classTable.setClass_name(rs.getString(4));
                classTable.setMajor_id(rs.getInt(5));
                classTable.setYear(rs.getInt(6));
                classTable.setCredit(rs.getInt(7));
                classTable.setLecturer_id(rs.getInt(8));
                classTable.setPerson_max(rs.getInt(9));
                classTable.setOpened(rs.getInt(10));
                classTable.setRoom_id(rs.getInt(11));
                list.add(classTable);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
