package com.bitc.project_0526.model;

public class BoardPlayDTO {
  private int idxPlay;
  private String title;
  private String content;
  private String postdate;
  private String cate;
  private int visits;
  private int respects;
  private int comments;
  private String playOfile;
  private String playSfile;

  public int getIdxPlay() {
    return idxPlay;
  }

  public void setIdxPlay(int idxPlay) {
    this.idxPlay = idxPlay;
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

  public String getPlayOfile() {
    return playOfile;
  }

  public void setPlayOfile(String playOfile) {
    this.playOfile = playOfile;
  }

  public String getPlaySfile() {
    return playSfile;
  }

  public void setPlaySfile(String playSfile) {
    this.playSfile = playSfile;
  }
}
