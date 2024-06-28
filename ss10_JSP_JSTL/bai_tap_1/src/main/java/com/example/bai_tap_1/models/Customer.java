package com.example.bai_tap_1.models;

public class Customer {
    private String name;
    private String address;
    private String dob;
    private String linkImage;

    public Customer(String name, String dob, String address, String linkImage) {
        this.name = name;
        this.address = address;
        this.dob = dob;
        this.linkImage = linkImage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }
}
