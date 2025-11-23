package file;

public class BoardVO {
    private int id;
    private String title;
    private String name;
    private String detail;
    private String createdAt;
    private int cnt;

    // --- Getters & Setters ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDetail() { return detail; }
    public void setDetail(String detail) { this.detail = detail; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public int getCnt() { return cnt; }
    public void setCnt(int cnt) { this.cnt = cnt; }
}
