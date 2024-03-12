/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Employers {
    private int idEmployer;
    private String emailEmployer;
    private int foundedYear;
    private String numberOfEmployees;
    private String describes;
    private String address;

    public Employers() {
    }

    public Employers(int idEmployer, String emailEmployer, int foundedYear, String numberOfEmployees, String describes, String address) {
        this.idEmployer = idEmployer;
        this.emailEmployer = emailEmployer;
        this.foundedYear = foundedYear;
        this.numberOfEmployees = numberOfEmployees;
        this.describes = describes;
        this.address = address;
    }

    public int getIdEmployer() {
        return idEmployer;
    }

    public void setIdEmployer(int idEmployer) {
        this.idEmployer = idEmployer;
    }

    public String getEmailEmployer() {
        return emailEmployer;
    }

    public void setEmailEmployer(String emailEmployer) {
        this.emailEmployer = emailEmployer;
    }

    public int getFoundedYear() {
        return foundedYear;
    }

    public void setFoundedYear(int foundedYear) {
        this.foundedYear = foundedYear;
    }

    public String getNumberOfEmployees() {
        return numberOfEmployees;
    }

    public void setNumberOfEmployees(String numberOfEmployees) {
        this.numberOfEmployees = numberOfEmployees;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Employers{" + "idEmployer=" + idEmployer + ", emailEmployer=" + emailEmployer + ", foundedYear=" + foundedYear + ", numberOfEmployees=" + numberOfEmployees + ", describes=" + describes + ", address=" + address + '}';
    }
    
    
    
    

}
