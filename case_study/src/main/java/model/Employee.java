package model;
//Họ tên Employee, Ngày sinh, Số CMND, Số ĐT, Email, Trình độ, Vị trí, Lương.
public class Employee {
    private int id;
    private String employeeName;
    private String employeeBirthday;
    private String employeeIdNumber;
    private String employeePhone;
    private String employeeEmail;
    private String employeeSalary;
    private String employeeAddress;
    private int employeePositionCode;
    private int employeeEduLevelCode;
    private int employeeDepartmentCode;

    public Employee() {
    }

    public Employee(String employeeName, String employeePhone, String employeeAddress) {
        this.employeeName = employeeName;
        this.employeePhone = employeePhone;
        this.employeeAddress = employeeAddress;
    }

    public Employee(int id, String employeeName, String employeeBirthday,
                    String employeePhone, String employeeEmail, String employeeAddress) {
        this.employeeName = employeeName;
        this.employeeBirthday = employeeBirthday;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.employeeAddress = employeeAddress;
        this.id = id;
    }

    public Employee(String employeeName, String employeeBirthday, String employeeIdNumber, String employeePhone,
                    String employeeEmail, String employeeSalary, String employeeAddress, int employeePositionCode,
                    int employeeEduLevelCode, int employeeDepartmentCode) {
        this.employeeName = employeeName;
        this.employeeBirthday = employeeBirthday;
        this.employeeIdNumber = employeeIdNumber;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.employeeSalary = employeeSalary;
        this.employeeAddress = employeeAddress;
        this.employeePositionCode = employeePositionCode;
        this.employeeEduLevelCode = employeeEduLevelCode;
        this.employeeDepartmentCode = employeeDepartmentCode;
    }

    public Employee(int id, String employeeName, String employeeBirthday, String employeeIdNumber, String employeePhone,
                    String employeeEmail, String employeeSalary, String employeeAddress, int employeePositionCode,
                    int employeeEduLevelCode, int employeeDepartmentCode) {
        this.id = id;
        this.employeeName = employeeName;
        this.employeeBirthday = employeeBirthday;
        this.employeeIdNumber = employeeIdNumber;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.employeeSalary = employeeSalary;
        this.employeeAddress = employeeAddress;
        this.employeePositionCode = employeePositionCode;
        this.employeeEduLevelCode = employeeEduLevelCode;
        this.employeeDepartmentCode = employeeDepartmentCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeBirthday() {
        return employeeBirthday;
    }

    public void setEmployeeBirthday(String employeeBirthday) {
        this.employeeBirthday = employeeBirthday;
    }

    public String getEmployeeIdNumber() {
        return employeeIdNumber;
    }

    public void setEmployeeIdNumber(String employeeIdNumber) {
        this.employeeIdNumber = employeeIdNumber;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public String getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(String employeeSalary) {
        this.employeeSalary = employeeSalary;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }

    public int getEmployeePositionCode() {
        return employeePositionCode;
    }

    public void setEmployeePositionCode(int employeePositionCode) {
        this.employeePositionCode = employeePositionCode;
    }

    public int getEmployeeEduLevelCode() {
        return employeeEduLevelCode;
    }

    public void setEmployeeEduLevelCode(int employeeEduLevelCode) {
        this.employeeEduLevelCode = employeeEduLevelCode;
    }

    public int getEmployeeDepartmentCode() {
        return employeeDepartmentCode;
    }

    public void setEmployeeDepartmentCode(int employeeDepartmentCode) {
        this.employeeDepartmentCode = employeeDepartmentCode;
    }
}
