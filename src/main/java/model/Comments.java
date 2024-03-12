/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Comments {
    private int idComment;
    private String contentComment;
    private int idJob;
    private int idUser;

    public Comments() {
    }

    public Comments(int idComment, String contentComment, int idJob, int idUser) {
        this.idComment = idComment;
        this.contentComment = contentComment;
        this.idJob = idJob;
        this.idUser = idUser;
    }

    public int getIdComment() {
        return idComment;
    }

    public void setIdComment(int idComment) {
        this.idComment = idComment;
    }

    public String getContentComment() {
        return contentComment;
    }

    public void setContentComment(String contentComment) {
        this.contentComment = contentComment;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Override
    public String toString() {
        return "Comments{" + "idComment=" + idComment + ", contentComment=" + contentComment + ", idJob=" + idJob + ", idUser=" + idUser + '}';
    }
    
    
    
}
