/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class HistorySubmit {
    private int idHistory;
    private String timeSubmit;
    private int idUser;
    private String name;
    private String email;
    private String phone;
    private int idJob;
    private String status;
    private String link;
    private String handle;

    public HistorySubmit() {
    }

    public HistorySubmit(int idHistory, String timeSubmit, int idUser, String name, 
            String email, String phone, int idJob, String status, String link, String handle) {
        this.idHistory = idHistory;
        this.timeSubmit = timeSubmit;
        this.idUser = idUser;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.idJob = idJob;
        this.status = status;
        this.link = link;
        this.handle = handle;
    }

    public int getIdHistory() {
        return idHistory;
    }

    public void setIdHistory(int idHistory) {
        this.idHistory = idHistory;
    }

    public String getTimeSubmit() {
        return timeSubmit;
    }

    public void setTimeSubmit(String timeSubmit) {
        this.timeSubmit = timeSubmit;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    @Override
    public String toString() {
        return "HistorySubmit{" + "idHistory=" + idHistory + ", timeSubmit=" + 
            timeSubmit + ", idUser=" + idUser + ", name=" + name + ", email=" + 
            email + ", phone=" + phone + ", idJob=" + idJob + ", status=" + 
            status + ", link=" + link + ", handle=" + handle + '}';
    }

    
    

    
    
}
