package com.bitc.project_0526.model;

public class CommentDailyDTO {
  private int no;
  private String id;
  private String comment;
  private String cate;
  private String postdate;
  private int idxDaily;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public String getCate() {
    return cate;
  }

  public void setCate(String cate) {
    this.cate = cate;
  }

  public String getPostdate() {
    return postdate;
  }

  public void setPostdate(String postdate) {
    this.postdate = postdate;
  }

  public int getIdxDaily() {
    return idxDaily;
  }

  public void setIdxDaily(int idxDaily) {
    this.idxDaily = idxDaily;
  }
}
