package lecturer;

public class Lecturer {
    private String lecturer_id;
    private String lecturer_name;
    private String lecturer_pwd;
    private int major_id;
    private int administrator;

    public String getLecturer_id() {
        return lecturer_id;
    }

    public void setLecturer_id(String lecturer_id) {
        this.lecturer_id = lecturer_id;
    }

    public String getLecturer_name() {
        return lecturer_name;
    }

    public void setLecturer_name(String lecturer_name) {
        this.lecturer_name = lecturer_name;
    }

    public String getLecturer_pwd() {
        return lecturer_pwd;
    }

    public void setLecturer_pwd(String lecturer_pwd) {
        this.lecturer_pwd = lecturer_pwd;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
    }

    public int getAdministrator() {
        return administrator;
    }

    public void setAdministrator(int administrator) {
        this.administrator = administrator;
    }
}
