package DTO;

import java.sql.Date;

public class PlansDTO {
    // 계획번호
    private String planNo;

    // 유저ID
    private String userId;

    // 계획제목
    private String planTitle;

    // 계획내용
    private String planContent;

    // 시작시간
    private Date startDate;

    // 종료시간
    private Date endDate;

    public String getPlanNo() {
        return planNo;
    }

    public void setPlanNo(String planNo) {
        this.planNo = planNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPlanTitle() {
        return planTitle;
    }

    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }

    public String getPlanContent() {
        return planContent;
    }

    public void setPlanContent(String planContent) {
        this.planContent = planContent;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[\"");
        sb.append(this.planNo);
        sb.append("\",\"");
        sb.append(this.planTitle);
        sb.append("\",\"");
        sb.append(this.startDate);
        sb.append("\"]");
        return sb.toString();
    }
}
