<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<content tag="local_script">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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
	<script type="text/javascript">
		$(document).ready(function(){
			

		
			
		});
	
	
	
	</script>
	
	
</content>	
</head>
<body>
	<div class="container text-center">
	  <h2>Horizontal form</h2>
	  <form class="form-horizontal" id="insert_form" action="boardUpdate" name="insert_form"  method="post" role="form" data-parsley-validate="ture">
		    <div class="form-group" style="text-align:center">
		      <label class="control-label col-sm-3" for="email" >아 이 디</label>
		      <div class="col-sm-7">
		      	<input type="hidden" id="b_seq" name="b_seq" value="${board.b_seq}">
		        <input type="text" class="form-control" value="${board.b_id}" readonly="readonly" id="b_id" name="b_id" placeholder="">
		      </div>
		    </div>
		    <div class="form-group" >
		      <label class="control-label col-sm-3" for="pwd"  >이 름</label>
		      <div class="col-sm-7">
		        <input type="text" class="form-control" value="${board.b_name}" readonly="readonly" id="b_name" name="b_name" placeholder="">
		      </div>
		    </div>
		    <div class="form-group" >
		      <label class="control-label col-sm-3" for="pwd"  >이 메 일</label>
		      <div class="col-sm-7">
		        <input type="text" class="form-control" value="${board.b_email}"  readonly="readonly" id="b_email" name="b_email" placeholder="">
		      </div>
		    </div>
		    
	     	<div class="form-group" style="text-align:center">
				<label class="control-label col-sm-3" for="pwd" >제 목</label>
				<div class="col-sm-7">
					<input type="text" autofocus class="form-control" value="${board.b_title}" id="b_title" name="b_title" placeholder="">
				</div>
		    </div>
			<div class="form-group" style="text-align:center">
				<label class="control-label col-sm-3" for="pwd">내 용</label>
				<div class="col-sm-7">
					<textarea class="form-control"   rows="5" id="b_content" name="b_content">${board.b_content}</textarea>
				</div>	
			</div>
		
			<div class="row">
			 	<div class="col-sm-6" style="float:right;">
			 		<button type="button" onclick="location.href='boardList'" class="btn btn-info" id="list" name="list">글목록</button>
			 		<c:if test="${sessionid == 'admin'|| sessionid == board.b_id}">
						<button type="submit" class="btn btn-info" id="save" name="save">수정</button>
						<button type="button" class="btn btn-danger" onclick="location.href='boardDeleteYN?b_seq=${board.b_seq}'"  id="save" name="save">글삭제</button>
					</c:if>
					<c:if test="${sessionid == 'admin' && board.b_step == 0}">
						<button type="button" onclick="location.href='boardReply?b_seq=${board.b_seq}'"  class="btn btn-info" id="boardReply" name="cancel" >답글</button>
					</c:if>
				</div>	
			</div>	
	    
	  </form>
	</div>
	

</body>
</html>