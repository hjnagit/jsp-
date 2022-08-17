package com.itwillbs.test;

public class Student {
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	
	// alt shift s -> s toString오버라이딩
	// 작업할 때 toString 오버라이딩 하는 것을 권장 -> 중간중간 확인하면서 작업하려고
	@Override
	public String toString() {
		return "Student [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + "]";
	}

	// alt shift s -> r
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	
}
