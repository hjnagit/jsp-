package com.itwillbs.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	
	// 공통으로 사용되는 객체를 선언
	Connection con = null; // 디비 연결 정보를 저장, 처리
	PreparedStatement pstmt = null; // sql 쿼리 실행, 처리
	ResultSet rs = null; // select 구문 결과 저장
	String sql = ""; // sql 쿼리 저장
	
	//디비 연결 메서드
	//예외처리 Exception이것을 둘 다 적용
	private Connection getCon() throws Exception {
		//디비 연결 정보
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";
		
		//1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버로드 성공");
		
		//2. 디비연결
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("디비 연결 성공");
		System.out.println("con : " + con);
		
		
		return con;
	}//디비 연결 메서드 끝
	
	//디비자원해제메서드
	public void closeDB(){
		//위에 생성한 3개를 close해준다
		try {
			//자원 해제
			//null이 아니라면 종료해라
			//종료는 생성의 역순으로 한다 - 데이터 안전성을 위해서
			//finally는 이미 작업이 다 끝난거지만 안전을 위해서 단계별로 끄자
			//지금은 그냥 아무거나 꺼도 상관은 없지만 
			if(rs != null) rs.close();
			if(pstmt != null )pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	//회원가입 - insertMember(MB) - 멤버빈이 들어가야 한다 - 시작
	public void insertMember(MemberBean mb){
		
		
		//1. 드라이버 로드
		// 오류창? 보기 f2
		//예외가 발행할 수 있을 때 
		try {
			/*//1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("드라이버로드 성공");
			
			//2. 디비연결
			//오류 catch문만 추가 2번째꺼
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("디비 연결 성공");
			System.out.println("con : " + con);*/
			
			//1.2. 디비 연결
			//예외 캐치구문만 추가
			// 디비 연결을 통해서 connection의 정보를 얻는다
			//connection의 정보가 필요하므로
			con = getCon();
			
			//3. sql 작성 & pstmt 객체
			// 너무 긴 코드 엔터치면 +로 연결된다 -> 공백 뒤를 띄어야 한다 - 공백을 지우면 안된다 
			String sql = "insert into itwill_member(id, pw, name, age, gender, email, regdate) "
					   + "values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//???
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getRegdate());
			
			//4. sql 실행 - insert니까 업데이트
			pstmt.executeUpdate();
			
			System.out.println("DAO : 회원가입 성공");
			
			
		} catch (ClassNotFoundException e) { 
			System.out.println("드라이버로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("디비 연결 실패");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			// 디비처리동작 끝
			try {
				//자원 해제
				//null이 아니라면 종료해라
				if(pstmt != null )pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}//회원가입 - insertMember() 끝
	
	
	
	
	
	//로그인여부체크 - loginMember(MB) 시작
	//로그인이 되었는지 아닌지 확인을 위해서 리턴을 해준다 간편한 int타입을 설정
	//리턴값이 1이면 로그인 성공/ 0이면 비밀번호가 틀림/ -1이면 아이디 오류 라고 지정하자
	public int loginMember(MemberBean mb){
		
		// -1로 초기화
		int result = -1;

		try {
			//1.2. 디비 연결
			con = getCon();
			
			//3. sql 작성(select) & pstmt 객체
			String sql = "select pw from itwill_member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//???
			pstmt.setString(1, mb.getId());
			//4. sql 실행
			ResultSet rs = pstmt.executeQuery();
			
			//5. 데이터 처리
			if(rs.next()){
				//아이디있음 회원
				if(mb.getPw().equals(rs.getString("pw"))){//자바빈에서 꺼내온다
					//로그인 성공
					result = 1;
				}else{
					//아이디 있음 비번 다름 -> 비밀번호 오류
					result = 0;
				}
			}else{
				// 아이디없음 비회원
				result = -1;
			}
			
			System.out.println("DAO : 로그인 체크 완료 (" + result + ")");
	
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("디비 연결 실패");
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}

		return result;
		
	}//로그인여부체크 - loginMember(MB) 끝
	
	
	
	//회원정보 조회 - getMember(id)
	//리턴은 MemberBean
	public MemberBean getMember(String id){
		//회원정보를 저장할 객체 
		MemberBean mb = new MemberBean();
		
		try {
			//1. 드라이버 로드
			//2. 디비 연결
			//연결정보 con에 저장
			con = getCon();
			
			//3. sql(select) & pstmt
			//특정 사용자의 모든 정보를 조회
			sql = "select * from itwill_member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			//???
			pstmt.setString(1, id);
			
			//4. sql 실행
			// select 구문 결과 저장
			rs = pstmt.executeQuery();
			
			//5. 데이터처리
			if(rs.next()){//데이터 있을 때 -> 조회된 회원정보를 저장
				//rs에 있는 이름이 id인 정보를 mb에 넣는다 
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGender(rs.getString("gender"));
				mb.setEmail(rs.getString("email"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
				System.out.println("DAO : 회원정보 저장 완료");
			}
			System.out.println("DAO : 조회된 회원 정보");
			System.out.println("DAO : " + mb);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
	
		return mb;
	
	} //회원정보 조회 - getMember(id)
	
	
	
	//회원 정보 수정 메서드(이름, 나이, 성별, 이메일)-updateMember(MB)
	public int updateMember(MemberBean mb){
		//회원인지 확인-> 본인인지 확인->수정
		//수정 결과를 표시하는 변수: 1 수정성공, 0 수정실패(본인아님-비밀번호), -1 수정실패(비회원)
		int result = -1;
		
		try {
			//1.2. 디비연결
			con = getCon();
			
			//3.sql & pstmt
			//1) 수정하려는 정보가 회원, 본인여부 체크 - 로그인 로직
			//2) 본인일때만, 정보 수정
			
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			//??
			pstmt.setString(1, mb.getId());
			
			
			// 4. sql 실행
			// select를 쓰면 항상 rs에 담아야한다
			rs = pstmt.executeQuery();
			
			//5. 데이터 처리
			//2) 본인일때만, 정보 수정
			if(rs.next()){
				//회원
				if(mb.getPw().equals(rs.getString("pw"))){
					//회원이면서 비밀번호 동일 => 본인
					
					//앞에서 이미 디비연결해서 3번부터 시작
					//3.sql(update) & pstmt
					//특정 사용자의 정보(이름, 나이, 성별, 이메일) 수정
					sql = "update itwill_member set name=?, age=?, gender=?, email=? where id=?";
					pstmt = con.prepareStatement(sql); // 까먹지말고 쓰자 쿼리만들었으면 이거 무조건 써야함
					
					//????
					pstmt.setString(1, mb.getName());
					pstmt.setInt(2, mb.getAge());
					pstmt.setString(3, mb.getGender());
					pstmt.setString(4, mb.getEmail());
					pstmt.setString(5, mb.getId());
					
					
					//4.sql실행
					pstmt.executeUpdate();
					//성공하면 1을 지정
					result = 1;
					System.out.println("DAO : 정보 수정 완료!");
					
				}else{
					//회원이지만 비밀번호 오류
					result = 0;
				}
			}else{
				//비회원
				result = -1;
			}
			
			
			System.out.println("DAO : 디비동작 처리 끝(수정처리)("+result+")");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		
		
		
		return result;
		
	}//회원 정보 수정 메서드
	
	
	//회원 정보 탈퇴 메서드 - deleteMember(id, pw);
	public int deleteMember(String id, String pw){
		//update와 동일한 로직으로 구현
		int result = -1;
		
		try {
			//1,2 디비연결
			con = getCon();
			
			
			//3. sql(select) 생성 & pstmt 객체
			//삭제하려는 회원정보가 있는지 체크
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			//???
			pstmt.setString(1, id);
			
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			
			
			//5. 데이터 처리
			if(rs.next()){
				//회원
				if(pw.equals(rs.getString("pw"))){
					//회원이면서 비밀번호 동일 => 본인
					
					//5-3. sql(delete) 생성 & pstmt 객체
					//id만 비교해도 된다 
					sql = "delete from itwill_member where id=? and pw=?";
					pstmt = con.prepareStatement(sql); 
					
					//???
					pstmt.setString(1, id); 
					pstmt.setString(2, pw); 
					
					
					//5-4. sql 실행
					// update가 되면 정수 데이터를 리턴한다
					// 몇 줄 바꼈는지 리턴이 되는데 삭제는 한줄만 바꾸니까 1이 리턴됨
					result = pstmt.executeUpdate();
					
					//성공하면 1을 지정
					//result = 1;
					System.out.println("DAO : 정보 삭제 완료!");
					
				}else{
					//회원이지만 비밀번호 오류
					result = 0;
				}
			}else{
				//비회원
				result = -1;
			}
			
			System.out.println("DAO : 디비동작 처리 끝(삭제처리)("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		
		
		return result;
		
	}//회원 정보 탈퇴 메서드 - deleteMember(id, pw);
	
	
	
	//전체 회원정보 조회 메서드- getMemberList
	public ArrayList<MemberBean> getMemberList(){
		
		//회원목록 전체를 저장하는 가변길이 배열 - try 밖에 있어야 리턴가능
		ArrayList<MemberBean> memberList = new ArrayList<>();
		//List<MemberBean> memberList = new ArrayList<>(); 같은 의미
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			
			// 3. sql 생성(select) & pstmt 객체
			sql = "select * from itwill_member";
			pstmt = con.prepareStatement(sql);
			
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			
			// 5. 데이터 처리
			// 데이터가 여러개니까
			while(rs.next()){
				//회원정보를 ArrayList에 저장
				//DB(rs) -> MemberBean -> ArrayList 이렇게 저장한다
				// memberbean은 지역변수로 while문 안에서만 사용가능한
				MemberBean mb = new MemberBean();
				
				
				//DB(rs) -> MemberBean 객체에 저장
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPw(rs.getString("pw"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
				// MemberBean -> ArrayList 저장하기
				//memberList는 전역변수
				memberList.add(mb);
				
			}
			
			System.out.println("DAO : 회원 목록 조회 성공");
			//배열은 length ArrayList는 size
			System.out.println("DAO : " + memberList.size());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		
		
		return memberList;
		
	}//전체 회원정보 조회 메서드- getMemberList
	
}
