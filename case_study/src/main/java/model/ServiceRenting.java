package model;

public class ServiceRenting {
    private int id;
    private String rentingName;

    public ServiceRenting() {
    }

    public ServiceRenting(int id, String rentingName) {
        this.id = id;
        this.rentingName = rentingName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRentingName() {
        return rentingName;
    }

    public void setRentingName(String rentingName) {
        this.rentingName = rentingName;
    }
}
