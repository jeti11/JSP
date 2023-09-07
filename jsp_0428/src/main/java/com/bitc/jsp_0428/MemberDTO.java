package com.bitc.jsp_0428;

// DTO : 데이터베이스와 JAVA 사이에서 데이터를 주고받기 위한 클래스
// 해당 클레스의 필드는 데이터베이스의 컬럼명과 동일해야 함
// 필드는 모두 접근제한자를 모두 private으로 설정하고 getter와 setter를 사용하여 접근하도록 하는것이 좋음
public class MemberDTO {
  private String id;
  private String pass;
  private String name;
  private String regidate;

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

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getRegidate() {
    return regidate;
  }

  public void setRegidate(String regidate) {
    this.regidate = regidate;
  }
}
