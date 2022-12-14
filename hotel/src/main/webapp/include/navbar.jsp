<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="memberPackage.memberLoginMethod" />
<!--  세션에 웹페이지 기본 경로(path) commonURL 이란 키값으로 저장하기.
	a 태그에 href 를 이용한 하이퍼링크 사용시 ${commonURL} 작성 후 경로 지정하기. -->
<%
	request.setAttribute("commonURL", request.getContextPath());
	
	int key = 0;
	int ad_key = 0;
	
	if (request.getAttribute("MEM_ID") != null) {
		key = login.sessionSetMEMKEY((String)request.getAttribute("MEM_ID"), (String)request.getAttribute("MEM_PW"));
		ad_key = login.sessionSetADUCKEY((String)request.getAttribute("MEM_ID"), (String)request.getAttribute("MEM_PW"));
		session.setAttribute("MEM_KEY", key);
		session.setAttribute("AD_UC_KEY", ad_key);
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 부트스트랩 css 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
<link rel="stylesheet" href="${commonURL}/css/navbar.css">
</head>

<body class="w3-white">
<div class="w3-bar w3-white w3-large">
  <a href="${commonURL}/index.jsp" class="w3-bar-item w3-button w3-green w3-mobile"><i class="fa fa-bed w3-margin-right"></i>Hotel The Green</a>
  <a href="${commonURL}/room/roomInfo.jsp" class="w3-bar-item w3-button w3-mobile">Rooms</a>
  <a href="#about" class="w3-bar-item w3-button w3-mobile">호텔안내</a>
  <a href="#contact" class="w3-bar-item w3-button w3-mobile">오시는길</a>
  <a href="${commonURL}/room/rooms_reservation1_date.jsp" class="w3-bar-item w3-button w3-mobile">예약하기</a>
  <a href="${commonURL}/dining/dining1_info.jsp" class="w3-bar-item w3-button w3-mobile">다이닝안내</a>
  <a href="${commonURL}/cscenter/cscenter_faq1.jsp" class="w3-bar-item w3-button w3-mobile">고객센터</a>
  <a href="${commonURL}/member/member_login.jsp" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile" id="login_btn">로그인</a>
  <a href="${commonURL}/member/memberLogoutProc.jsp" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile" id="logout_btn">로그아웃</a>
  <a href="#contact" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile" data-bs-toggle="modal" data-bs-target="#reservation_check_nomember" id="noMember_rsv_btn">예약조회</a>
  <a href="${commonURL}/dining/dining1_info.jsp" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile" id="manage_btn">관리자 페이지</a>
  <button class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" id="mypage_btn">
    마이페이지
  </button>
  </div>
  
  <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
	  <div class="offcanvas-body">
	    
	    	<div>
	    	<a href="${commonURL}/mypage/my_info.jsp">내 정보 변경</a>
	    	</div>
	    	<div>
	    	<a href="${commonURL}/mypage/my_point.jsp">포인트</a>
	    	</div>
	    	<div>
	     	<a href="${commonURL}/mypage/room_reservation_check_plan_member.jsp">룸 예약</a>
	     	</div>
	    	<div>
	     	<a href="${commonURL}/mypage/dining_reservation_check_plan_member.jsp">식사 예약</a>
	     	</div>
	    	<div>
	     	<a href="${commonURL}/cscenter/cscenter_counsel.jsp">문의하기</a>
	     	</div>
	    	<div>
	     	<a href="${commonURL}/mypage/my_counsel.jsp">문의내역</a>
	     	</div>
	    
	  </div>
	</div>


<!-- 비회원 예약조회 모달 -->
<div class="modal fade" id="reservation_check_nomember" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비회원 예약 조회</h1>
      </div>
      <form method="post" action="../reservation_check_nomember/noemember_rsv_check.jsp">
        <div class="modal-body">
          <h2 class="modal-title fs-5">연락처</h2>
          <input name="phone" class="form-control" type="text" placeholder="010-xxxx-xxxx">
          <h2 class="modal-title fs-5">비밀번호</h2>
          <input name="pwd" type="password" class="form-control" id="inputPassword" placeholder="****">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-success">조회</button>
        </div>
      </form>
    </div>
  </div>
</div>

	<!-- 로그인에 성공하지 않았다면 -->
<% 	if(session.getAttribute("messageType") != "success"){%>
	<script>
		const a = document.getElementById("login_btn"); //로그인 보임
		const b = document.getElementById("logout_btn"); //로그인아웃 안보임
		const c = document.getElementById("mypage_btn"); //마이페이지 안보임
		const d = document.getElementById("noMember_rsv_btn"); //예약 내역
		a.style.display = "block";
		b.style.display = "none";
		c.style.display = "none";
		d.style.display = "block";
		</script>
	<!-- 로그인에 성공했다면 -->
<%}else{%>
	<script>	
		const a = document.getElementById("login_btn"); //로그인 안보임
		const b = document.getElementById("logout_btn"); //로그인아웃 보임
		const c = document.getElementById("mypage_btn"); //마이페이지 보임
		const d = document.getElementById("noMember_rsv_btn"); //예약 내역
		a.style.display = "none";
		b.style.display = "block";
		c.style.display = "block";
		d.style.display = "none";
	</script>
<%}%>
<!-- 관리자 페이지 -->
<% if(ad_key==3){%>
	<script>
		const e = document.getElementById("manage_btn");
		const f = document.getElementById("mypage_btn");	  
		
		e.style.display = "block";
		f.style.display = "none";
	</script>
<%} else {%>
	<script>
		const e = document.getElementById("manage_btn");
	  
		e.style.display = "none";
	</script>
<%} %>

<!-- 부트스트랩 JavaScript 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>