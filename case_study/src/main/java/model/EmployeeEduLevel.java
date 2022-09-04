package model;

public class EmployeeEduLevel {
    int id;
    String eduLevelName;

    public EmployeeEduLevel() {
    }

    public EmployeeEduLevel(int id, String eduLevelName) {
        this.id = id;
        this.eduLevelName = eduLevelName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEduLevelName() {
        return eduLevelName;
    }

    public void setEduLevelName(String eduLevelName) {
        this.eduLevelName = eduLevelName;
    }
}
