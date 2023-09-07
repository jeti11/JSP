package com.bitc.jsp_0504;

public class Person {
  // 자바빈즈 규칙
  // 1. 필드는 반드시 접근제한자를 private 으로 설정해야함
  // 2. 기본생성자는 반드시 존재해야함(안쓰더라도)
  // 3. 필드에 대한 getter 및 setter를 생성
  private String name;
  private int age;

  public Person() {}

  public Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }
}
