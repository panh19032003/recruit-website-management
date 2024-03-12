package model;

public class Jobs {
    private int idJob;
    private String nameJob;
    private String salary;
    private String status;
    private String address;
    private String deadline;
    private String describes;
    private String requirements;
    private String benefits;
    private String idCategory;
    private int idEmployer;
    private String experience;
    private int typeSalary;

    public Jobs() {
    }

    public Jobs(int idJob, String nameJob, String salary, String status, 
            String address, String deadline, String describes,
            String requirements, String benefits, String idCategory, 
            int idEmployer, String experience, int typeSalary) {
        this.idJob = idJob;
        this.nameJob = nameJob;
        this.salary = salary;
        this.status = status;
        this.address = address;
        this.deadline = deadline;
        this.describes = describes;
        this.requirements = requirements;
        this.benefits = benefits;
        this.idCategory = idCategory;
        this.idEmployer = idEmployer;
        this.experience = experience;
        this.typeSalary = typeSalary;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }

    public String getNameJob() {
        return nameJob;
    }

    public void setNameJob(String nameJob) {
        this.nameJob = nameJob;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getBenefits() {
        return benefits;
    }

    public void setBenefits(String benefits) {
        this.benefits = benefits;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }

    public int getIdEmployer() {
        return idEmployer;
    }

    public void setIdEmployer(int idEmployer) {
        this.idEmployer = idEmployer;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public int getTypeSalary() {
        return typeSalary;
    }

    public void setTypeSalary(int typeSalary) {
        this.typeSalary = typeSalary;
    }

    @Override
    public String toString() {
        return "Jobs{" + "idJob=" + idJob + ", nameJob=" + nameJob + ", salary=" 
            + salary + ", status=" + status + ", address=" + address + ", deadline=" 
            + deadline + ", describes=" + describes + ", requirements=" 
            + requirements + ", benefits=" + benefits + ", idCategory=" + idCategory 
            + ", idEmployer=" + idEmployer + ", experience=" + experience 
                + ", typeSalary=" + typeSalary + '}';
    }
    
    

    
    
}
