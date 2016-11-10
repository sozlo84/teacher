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
	

<content tag="local_script">
<script type="text/javascript">
	function doReset() {
	
		document.insert_form.id.value="";
		document.insert_form.password.value="";
		document.insert_form.repassword.value="";
		document.insert_form.name.value="";
// 		document.insert_form.image.value="";
		document.insert_form.phone2.value="";
		document.insert_form.phone3.value="";
		
		
	}
	
	

	$(document).ready(function(){
// 		$('#cancel').click(function(){
					
// 			$(location).attr('href',
// 					'memberList');
			
// 		});	
		
// 		$('#delete').click(function(){
		
// 			$(location).attr('href',
// 					'memberDelete?id='+$('#id').val());
			
// 		});	
		
		
	});

</script>
</content>
</head>

<body class="div-bgcolor-gray" onload="doReset();">
<form id ="update_form" action="memberUpdate"  class="form-horizontal" name="insert_form" action="memberInsert" method="post" role="form" data-parsley-validate="ture">
	<div class="contatiner">
	  <span class="text-success text-center"><h1>My First ITSCHOOL Page</h1></span>
	  <p class="text-success text-center">이것은 연습을 하기위한 페이지 입니다.</p>
	  <br><br>
		<div class="row">
			<div class="col-md-4"><span></span></div>
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
					<input id="id" name="id" class="form-control" text="text" size="16" placeholder="id" value="${member.getId()}" readonly="readonly"
					required="" data-parsley-error-message="please insert your ID" data-parsley-errors-container="div[id='validateId']" />
					<span class="input-group-btn">

						
						<input id="confirm_chk" type="hidden" name="confirm_chk" value="no"/>
					</span>
				</div>
				<div id="validateId" style="color:#ff0000"></div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
					<input id="password" name="password" class="form-control" id="password" type="password" size="16" placeholder="PASSWORD" value="${member.getPassword()}"
					required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
				</div>
				
				
				<div id="validatePassword" style="color:#ff0000"></div>
				<br>
				
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<input name="name" class="form-control" text="text" size="20" placeholder="NAME" value="${member.getName() }"
					required="" data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validateName']" />
				</div>
				<div id="validateName" style="color:#ff0000"></div>
			</div>
			<div class="col-md-1">
				<img name="image" id="image" src="resources/photo/soso.jpg" class="img-thumbnail" width="120px" height="120px">
				<br>
				<div align="right">
<!-- 				<input type="file" id="exampleInputFile"> -->
<!-- 				<button class="btn btn-default" >Image</button> -->
				<input type="file" id="photo" name="photo">
				
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4"><span></span></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
						<select name="phone1">
							<option value="010"  <c:if test="${member.phone1=='010'}"> selected </c:if> > 010</option>
							<option value="011"  <c:if test="${member.phone1=='011'}">selected</c:if> > 011</option>
							<option value="016"  <c:if test="${member.phone1=='016'}">selected</c:if> > 016</option>
							<option value="017"  <c:if test="${member.phone1=='017'}">selected</c:if> > 017</option>
							<option value="018"  <c:if test="${member.phone1=='018'}">selected</c:if> > 018</option>
							<option value="019"  <c:if test="${member.phone1=='019'}">selected</c:if> > 019</option>
						</select>
					<span class="input-group-addon">-</span>
					<input name="phone2" class="form-control" text="text" size="4" placeholder="Phone"  value="${member.getPhone2()}"
					required="" data-parsley-error-message="please insert your PHONE" data-parsley-errors-container="div[id='validatePhone']"/>
					<span class="input-group-addon">-</span>
					<input name="phone3" class="form-control" text="text" size="4" placeholder="Number" value="${member.getPhone3()}"/>
				</div>
				<div id="validatePhone" style="color:#ff0000"></div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-location-arrow" aria-hidden="true"></i></span>
					<input name="zipcode" class="form-control" text="text" size="6" placeholder="ZIPCODE"
					required="" data-parsley-error-message="please insert your ZIPCODE" data-parsley-errors-container="div[id='validateZipcode']" />
					<span class="input-group-btn">
						<button type="button" class="btn btn-default">Searching</button>
					</span>
				</div>
				<div id="validateZipcode" style="color:#ff0000"></div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
					<input name="addr1" class="form-control" text="text" size="50" placeholder="ADDRESS" value="${member.getAddr1()}"/>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
					<input name="addr2" class="form-control" text="text" size="30" placeholder="DETAIL ADDRESS" value="${member.getAddr2()}" />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
					<input name="email" class="form-control" text="text" size="30" placeholder="E-MAIL" />
					<span class="input-group-addon"><label>@</label></span>
					<input name="email_domain"class="form-control" text="text" size="30" placeholder="example.com" />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
					<input name="cardno" class="form-control" text="text" size="30" placeholder="Card No." />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-briefcase" aria-hidden="true"></i></span>
					<input name="job" class="form-control" text="text" size="30" placeholder="JOB" value="${member.getJob()}" />
				</div>
				<br>
				<div align="center">
					<button id="save" name="save" type="submit" class="btn btn-default">Save</button>
					<span>&nbsp;&nbsp;</span>
					<span>&nbsp;&nbsp;</span>
					<button type="button" id="cancel" name="cancel" onclick="location.href='memberList'" class="btn btn-default">Cancel</button>
						<span>&nbsp;&nbsp;</span>
					<span>&nbsp;&nbsp;</span>
					<button type="button" id="delete" name="delete" onclick="location.href='memberDeleteYn?id=${member.id}'" class="btn btn-default">delete</button>
				</div>
				<div align="right">
					<kbd name="inputdate">2016.10.07</kbd> 
				</div>
				
			</div>
			<div class="col-md-4"></div>
		</div>
		
	</div>
</form>
</body>
</html>









