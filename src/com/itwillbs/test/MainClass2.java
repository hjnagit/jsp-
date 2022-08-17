package com.itwillbs.test;

public class MainClass2 {

	public static void main(String[] args) {
		
		Student s = new Student();
		
		s.setName("우영우");
		s.setKor(100);
		s.setEng(100);
		s.setMath(100);
		
		Calculator cal = new Calculator();
		System.out.println(cal.sum(s));
		cal.avg(s);
		
	}

}
