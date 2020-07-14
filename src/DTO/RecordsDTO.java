package DTO;

import java.sql.Date;

public class RecordsDTO {
    // 글번호
    private String recordNo;

    // 유저ID
    private String userId;

    // 날짜
    private Date recordDate;

    // 제목
    private String title;

    // 내용
    private String content;

    // 위치
    private Integer geoInfo;

    // 날씨
    private String weather;

    // 컨디션
    private String condition;

    public String getRecordNo() {
        return recordNo;
    }

    public void setRecordNo(String recordNo) {
        this.recordNo = recordNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getGeoInfo() {
        return geoInfo;
    }

    public void setGeoInfo(Integer geoInfo) {
        this.geoInfo = geoInfo;
    }

    public String getWeather() {
        return weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
