package DTO;

import java.sql.Date;

public class MediaDTO {
    // 글번호
    private String recordNo;
    // 미디어
    private String media;
    // 날짜
    private Date date;

    public MediaDTO(String recordNo, String media, Date date) {
        this.recordNo = recordNo;
        this.media = media;
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getRecordNo() {
        return recordNo;
    }

    public void setRecordNo(String recordNo) {
        this.recordNo = recordNo;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

}
