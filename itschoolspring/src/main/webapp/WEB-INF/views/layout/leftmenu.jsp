<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<c:if test="${sessionid != null }">
      <p><a href="memberList">테이블</a></p>
      <p><a href="memberUpdateForm?id=${sessionid}"><i claclass="fa fa-fw fa-user"></i>Profile</a></p>
	</c:if>
      <p style="margin-top: 10px;"><a href="memberbody">회원가입</a></p>
      <p><a href="boardInsertForm">게시판</a></p>
      <p><a href="boardList">게시판리스트</a></p>
      <p><a href="SalaryInsertForm">Salaryinsert</a></p>
      <p><a href="salaryList">Salarylist</a></p>
      <p><a href="salaryCreateForm">월 급여 생성</a></p>
      <p><a href="upload">월별 급여 계산</a></p>
      <p><a href="salaryRollupForm">월별 급여</a></p>
      <p><a href="upload">upload</a></p>

</body>
</html>