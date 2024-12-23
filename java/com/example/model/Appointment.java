package com.example.model;

public class Appointment {
    private String phnumber;
    private String name;
    private int age;
    private String address;
    private String specialist;
    private String reason;

    public Appointment(String phnumber, String name, int age, String address, String specialist, String reason) {
        this.phnumber = phnumber;
        this.name = name;
        this.age = age;
        this.address = address;
        this.specialist = specialist;
        this.reason = reason;
    }

    public String getPhnumber() {
        return phnumber;
    }

    public void setPhnumber(String phnumber) {
        this.phnumber = phnumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSpecialist() {
        return specialist;
    }

    public void setSpecialist(String specialist) {
        this.specialist = specialist;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
