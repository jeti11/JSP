package com.bitc.project_0526.model;

public class BoardDailyDTO {
  private int idxDaily;
  private String title;
  private String content;
  private String postdate;
  private String cate;
  private int visits;
  private int respects;
  private int comments;
  private String dailyOfile;
  private String dailySfile;

  public int getIdxDaily() {
    return idxDaily;
  }

  public void setIdxDaily(int idxDaily) {
    this.idxDaily = idxDaily;
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

  public String getPostdate() {
    return postdate;
  }

  public void setPostdate(String postdate) {
    this.postdate = postdate;
  }

  public String getCate() {
    return cate;
  }

  public void setCate(String cate) {
    this.cate = cate;
  }

  public int getVisits() {
    return visits;
  }

  public void setVisits(int visits) {
    this.visits = visits;
  }

  public int getRespects() {
    return respects;
  }

  public void setRespects(int respects) {
    this.respects = respects;
  }

  public int getComments() {
    return comments;
  }

  public void setComments(int comments) {
    this.comments = comments;
  }

  public String getDailyOfile() {
    return dailyOfile;
  }

  public void setDailyOfile(String dailyOfile) {
    this.dailyOfile = dailyOfile;
  }

  public String getDailySfile() {
    return dailySfile;
  }

  public void setDailySfile(String dailySfile) {
    this.dailySfile = dailySfile;
  }
}
