package student;

import student.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public StudentDAO() {
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

    public String test(String student_id, String student_pwd) {
        String test = student_id + " " + student_pwd;
        return test;
    }

    public int login(String student_id, String student_pwd) { //로그인 코드
        String SQL = "SELECT student_pwd FROM STUDENT WHERE student_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(student_pwd)) {
                    return 1; //로그인 성공
                }
                else {
                    return 0; //비밀번호 불일치
                }
            } return -1; // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } return -2; // 데이터베이스 오류
    }

    public int join(Student student) { //회원가입 코드
        String SQL = "INSERT INTO STUDENT VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student.getStudent_id());
            pstmt.setString(2, student.getStudent_pwd());
            pstmt.setString(3, student.getStudent_name());
            pstmt.setString(4, student.getStudent_gender());
            pstmt.setInt(5, 0);
            pstmt.setInt(6, 0);
            pstmt.setInt(7, 0);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } return -1; // 데이터베이스 오류
    }

    public ArrayList<Student> showAll() { //학생 정보 출력 코드
        String SQL = "SELECT * FROM STUDENT";
        ArrayList<Student> studentList = new ArrayList<Student>();
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                Student student = new Student();
                student.setStudent_id(rs.getString(1));
                student.setStudent_pwd(rs.getString(2));
                student.setStudent_name(rs.getString(3));
                student.setStudent_gender(rs.getString(4));
                student.setMajor_id(rs.getInt(5));
                student.setLecturer_id(rs.getInt(6));
                student.setYear(rs.getInt(7));
                studentList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return studentList;
    }
}

