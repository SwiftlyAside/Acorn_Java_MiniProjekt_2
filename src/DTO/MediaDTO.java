package DTO;

public class MediaDTO {
    public MediaDTO(String recordNo, String media) {
        this.recordNo = recordNo;
        this.media = media;
    }

    // 글번호
    private String recordNo;

    // 미디어
    private String media;

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
