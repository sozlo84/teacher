<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/itschool.css" >

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" >

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">


	<script src="resources/js/jquery-3.1.1.min.js"></script>
	<script src="resources/js/jquery-3.1.1.js"></script>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<style>
	.resultPage{
		font-size: 35px;
		text-align: center !important;
		margin-top: 50px;	
	}
	
	.resultMessage { 
		margin-top: 20px;
		font-size: 25px;
		background-color: #e0e0d1;
		text-align: center !important;
		line-height:250px;
		padding: 15px;
	}
	
	.resultButton {
		text-align: center !important;
		margin-top: 3px;
	}
	
</style>

<body>

<form action="salaryCreate" method="post">
	<div class="contatiner" style="border:3px solid red">
		
		<div class="row" style="border:1px solid yellow">
			<div class="col-md-offset-4 col-md-4 resultPage" style="border:1px solid blue">월급여 생성</div>		
		</div>
		<div class="row" style="border:4px solid black">
			<div class="col-md-offset-4 col-md-4 resultMessage" style="border:1px solid blue">
			<input type="hidden" name="yyyy" value="${yyyy}" />
			<input type="hidden" name="mm" value="${mm}" />
			데이터 소실 후 생성됩니다!
			</div>
			
		</div>
		<div class="row" style="border:7px solid navy">
				<button type="submit" class="col-md-offset-4 col-md-2 btn btn-success resultButton" style="border:5px solid blue">삭제</button>
				<button type="button" onclick="location.href='home'" class="col-md-2 btn btn-success resultButton" style="border:5px solid blue">취소</button>
		</div>
	</div>




</form>

	
</body>
</html>