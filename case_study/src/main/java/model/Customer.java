package model;

public class Customer {
    private int id;
    private String customerName;
    private String customerBirthday;
    private String customerGender;
    private String customerIdNum;
    private String customerPhone;
    private String customerEmail;
    private String customerAddress;
    private int customerRankId;

    public Customer() {
    }

    public Customer(String customerName, String customerBirthday, String customerGender, String customerIdNum,
                    String customerPhone, String customerEmail, String customerAddress, int customerRankId) {
        this.customerName = customerName;
        this.customerBirthday = customerBirthday;
        this.customerGender = customerGender;
        this.customerIdNum = customerIdNum;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.customerAddress = customerAddress;
        this.customerRankId = customerRankId;
    }

    public Customer(int id, String customerName, String customerBirthday, String customerGender, String customerIdNum,
                    String customerPhone, String customerEmail, String customerAddress, int customerRankId) {
        this.id = id;
        this.customerName = customerName;
        this.customerBirthday = customerBirthday;
        this.customerGender = customerGender;
        this.customerIdNum = customerIdNum;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.customerAddress = customerAddress;
        this.customerRankId = customerRankId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerBirthday() {
        return customerBirthday;
    }

    public void setCustomerBirthday(String customerBirthday) {
        this.customerBirthday = customerBirthday;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerIdNum() {
        return customerIdNum;
    }

    public void setCustomerIdNum(String customerIdNum) {
        this.customerIdNum = customerIdNum;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public int getCustomerRankId() {
        return customerRankId;
    }

    public void setCustomerRankId(int customerRankId) {
        this.customerRankId = customerRankId;
    }
}
