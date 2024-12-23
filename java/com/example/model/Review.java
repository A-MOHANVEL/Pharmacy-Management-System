package com.example.model;

public class Review {
    private String name;
    private String phnumber;
    private String address;
    private String review;

    // Constructor
    public Review(String name, String phnumber, String address, String review) {
        this.name = name;
        this.phnumber = phnumber;
        this.address = address;
        this.review = review;
    }

    // Getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhnumber() {
        return phnumber;
    }

    public void setPhnumber(String phnumber) {
        this.phnumber = phnumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }
}
