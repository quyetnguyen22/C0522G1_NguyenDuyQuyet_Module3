package model;

public class Service {
    private int id;
    private String serviceName;
    private String area;
    private String price;
    private String capacity;
    private String standard;
    private String util;
    private String poolArea;
    private String floor;
    private String freeService;
    private int idRenting;
    private int idServiceCode;

    public Service() {
    }

    public Service(String serviceName, String price, String capacity) {
        this.serviceName = serviceName;
        this.price = price;
        this.capacity = capacity;
    }

    public Service(int id, String serviceName, String area, String price, String capacity, String standard, String util,
                   String poolArea, String floor, String freeService) {
        this.id = id;
        this.serviceName = serviceName;
        this.area = area;
        this.price = price;
        this.capacity = capacity;
        this.standard = standard;
        this.util = util;
        this.poolArea = poolArea;
        this.floor = floor;
        this.freeService = freeService;
    }

    public Service(String serviceName, String area, String price, String capacity, String standard, String util,
                   String poolArea, String floor, String freeService, int idRenting, int idServiceCode) {
        this.serviceName = serviceName;
        this.area = area;
        this.price = price;
        this.capacity = capacity;
        this.standard = standard;
        this.util = util;
        this.poolArea = poolArea;
        this.floor = floor;
        this.freeService = freeService;
        this.idRenting = idRenting;
        this.idServiceCode = idServiceCode;
    }

    public Service(int id, String serviceName, String area, String price, String capacity, String standard,
                   String util, String poolArea, String floor, String freeService, int idRenting, int idServiceCode) {
        this.id = id;
        this.serviceName = serviceName;
        this.area = area;
        this.price = price;
        this.capacity = capacity;
        this.standard = standard;
        this.util = util;
        this.poolArea = poolArea;
        this.floor = floor;
        this.freeService = freeService;
        this.idRenting = idRenting;
        this.idServiceCode = idServiceCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getUtil() {
        return util;
    }

    public void setUtil(String util) {
        this.util = util;
    }

    public String getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(String poolArea) {
        this.poolArea = poolArea;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getFreeService() {
        return freeService;
    }

    public void setFreeService(String freeService) {
        this.freeService = freeService;
    }

    public int getIdRenting() {
        return idRenting;
    }

    public void setIdRenting(int idRenting) {
        this.idRenting = idRenting;
    }

    public int getIdServiceCode() {
        return idServiceCode;
    }

    public void setIdServiceCode(int idServiceCode) {
        this.idServiceCode = idServiceCode;
    }
}
