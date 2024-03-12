/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class LoveJobs {
    private int idLove;
    private int idUser;
    private int idJob;
    private String status;

    public LoveJobs() {
    }

    public LoveJobs(int idLove, int idUser, int idJob, String status) {
        this.idLove = idLove;
        this.idUser = idUser;
        this.idJob = idJob;
        this.status = status;
    }

    public int getIdLove() {
        return idLove;
    }

    public void setIdLove(int idLove) {
        this.idLove = idLove;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
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

    @Override
    public String toString() {
        return "LoveJobs{" + "idLove=" + idLove + ", idUser=" + idUser + ", idJob=" + idJob + ", status=" + status + '}';
    }

    

    

}
