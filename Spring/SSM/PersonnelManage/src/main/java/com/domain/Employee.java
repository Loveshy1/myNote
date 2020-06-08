package com.domain;

import java.util.Date;

public class Employee {
    private int id;
    private String name;
    private String gender;
    private String email;
    private String departmentName;
    private String tel;
    private Date indate;
    private String bz;
    private Date outdate;
    private int isdelete;
    private String del_type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getIndate() {
        return indate;
    }

    public void setIndate(Date indate) {
        this.indate = indate;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public Date getOutdate() {
        return outdate;
    }

    public void setOutdate(Date outdate) {
        this.outdate = outdate;
    }

    public int getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(int isdelete) {
        this.isdelete = isdelete;
    }

    public String getDel_type() {
        return del_type;
    }

    public void setDel_type(String del_type) {
        this.del_type = del_type;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", departmentName='" + departmentName + '\'' +
                ", tel='" + tel + '\'' +
                ", indate=" + indate +
                ", bz='" + bz + '\'' +
                ", outdate=" + outdate +
                ", isdelete=" + isdelete +
                ", del_type='" + del_type + '\'' +
                '}';
    }
}
