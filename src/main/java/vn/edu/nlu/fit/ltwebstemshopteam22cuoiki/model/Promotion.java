package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model;

import java.sql.Date;

public class Promotion {
    private int id;
    private String code;
    private String description;
    private Date startDate;
    private Date endDate;
    private String status;

    public Promotion() {}

    public Promotion(int id, String code, String description,
                     Date startDate, Date endDate, String status) {
        this.id = id;
        this.code = code;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getId() { return id; }
    public String getCode() { return code; }
    public String getDescription() { return description; }
    public Date getStartDate() { return startDate; }
    public Date getEndDate() { return endDate; }
    public String getStatus() { return status; }

    public void setId(int id) { this.id = id; }
    public void setCode(String code) { this.code = code; }
    public void setDescription(String description) { this.description = description; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
    public void setStatus(String status) { this.status = status; }
}