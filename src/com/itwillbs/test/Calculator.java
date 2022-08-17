package com.itwillbs.test;

public class Calculator {
	//계산기 객체
	public int sum(int a, int b, int c){
		return (a+b+c);
	}
	//sum 오버로딩
	public int sum(Student s){
		return s.getKor()+s.getEng()+s.getMath();
	}
	
	public void avg(int a, int b, int c){
		System.out.println(sum(a, b, c)/3.0);
	}
	//오버로딩
	public void avg(Student s){
		System.out.println(sum(s)/3.0);
	}
	
}
