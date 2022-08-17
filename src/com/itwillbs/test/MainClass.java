package com.itwillbs.test;

public class MainClass {
	public void show(String name, int kor, int eng, int math){
		int sum = kor+eng+math;
		double avg = sum/3.0;
		System.out.println("이름 : " + name);
		System.out.println("총점 : " + sum + "점 평균 : " + avg + "점");
	}
	public static void show2(String name, int kor, int eng, int math){
		int sum = kor+eng+math;
		double avg = sum/3.0;
		System.out.println("이름 : " + name);
		System.out.println("총점 : " + sum + "점 평균 : " + avg + "점");
	}
	//오버로딩
	public static void show2(Student s){
		int sum = s.getKor()+s.getEng()+s.getMath();
		double avg = sum/3.0;
		System.out.println("이름 : " + s.getName());
		System.out.println("총점 : " + sum + "점 평균 : " + avg + "점");
	}


	public static void main(String[] args) {
		//학생이름, 국, 영, 수 점수
		String name = "학생1";
		int kor = 95;
		int eng = 88;
		int math = 77;
		
		//=> 학생 점수의 종합, 평균 출력
		int sum = kor+eng+math;
		double avg = sum/3.0;
		
		System.out.println("이름 : " + name);
		System.out.println("총점 : " + sum + "점 평균 : " + avg + "점");
		
		//=> 위의 동작을 동일하게 실행하는 메서드 show()
		MainClass s = new MainClass();
		s.show("학생2", 66,80,90);
		MainClass.show2("학생3", 99,87,90);
		
		Student s1 = new Student();
		s1.setName("학생3");
		s1.setKor(90);
		s1.setEng(96);
		s1.setMath(99);
		MainClass.show2(s1);
		
		System.out.println(s1);
		// 계산기 객체를 생성해서 계산하기
		Calculator cal = new Calculator();
		System.out.print("총점 : "+cal.sum(s1) + " 평균 : ");
		cal.avg(s1);
		System.out.print(cal.sum(50, 80, 43));
		
	}
	

}


