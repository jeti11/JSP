package com.bitc.project_0526.model;

public class MemberDTO {
  private String id;
  private String pass;
  private String nickname;
  private String regidate;
  private int grade;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPass() {
    return pass;
  }

  public void setPass(String pass) {
    this.pass = pass;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getRegidate() {
    return regidate;
  }

  public void setRegidate(String regidate) {
    this.regidate = regidate;
  }

  public int getGrade() {
    return grade;
  }

  public void setGrade(int grade) {
    this.grade = grade;
  }
}
