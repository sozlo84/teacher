<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/itschool.css" >

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" >

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">


	<script src="resources/js/jquery-3.1.1.min.js"></script>
	
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	

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
		$('#save').click(function(){
			
			$('#salaryinsert_form').submit();
			
		});	
		
		$('#photo').change(function(event){
			var tmppath = URL.createObjectURL(event.target.files[0]);
			alert($(this).val());
			$('#image').attr('src',tmppath);
// 			alert(tmppath);
		});
		
		$('#confirm').click(function(){
			
			var no = $('#no').val();
			if( no == "") {
				alert("ID를 입력하세요!");
				return;
			}
			$.ajax({
				type : 'POST',
				data : "no="+no,
				dataType : 'json',
				url : 'noconfirm',
				
				success : function(data) {
					
					alert(data+"모지?");
					if(data==0){
						alert("사용 가능한 ID입니다.");
						$('#confirm_chk').attr('value','yes');
						
					}else{
						alert("중복된 ID입니다.");
					}
					return false;
				}
				
			});
			
// 			alert($('#id').val());
// 			$(location).attr('href',
// 					'http://localhost:8082/sozlo/idconfirm?id='+$('#id').val()+'&'+'password='+$('#password').val());

	
		});
		
		$('#ulphone1 li').click(function(){
		
			$('#phone1').attr('value',$(this).text());
		});
		
		
	});

</script>
</content>

</head>
<body>

<form id ="salaryinsert_form" action="salaryUpdate" enctype="multipart/form-data" class="form-horizontal" name="insert_form"  method="post" role="form" data-parsley-validate="ture">
	<div class="contatiner">
	  <span class="text-success text-center"><h1>Salary Page</h1></span>
	  <br><br>	
	  	<div class="row">
	  		
			<div class="col-md-offset-4 col-md-4">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
					<input id="no" name="no" value="${salary.no}" class="form-control" type="text" size="10" maxlength="10" placeholder="사번"
					 readonly="readonly" data-parsley-error-message="please insert your ID" data-parsley-errors-container="div[id='validateId']" />
					
				</div>
				
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
					<input id="name" name="name" class="form-control"  type="text" size="16" placeholder="이름" value="${salary.name}"
					 data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
				</div>
				
				<br>
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
					<select name="dept" id="dept" class="selectpicker form-control"  >
						<option  <c:if test="${salary.dept == '영업부'}">selected</c:if> > 영업부</option>
						<option <c:if test="${salary.dept == '총무부'}">selected</c:if> > 총무부</option>
						<option <c:if test="${salary.dept == '기획부'}">selected</c:if>> 기획부</option>
						<option <c:if test="${salary.dept == '비서부'}">selected</c:if>> 비서부</option>
					</select>
				</div>	
				
				<br>
				
				<div class="input-group">
					<label class="radio-inline" >
				      <input type="radio"  value="1" name="partner" id="partner"  ${salary.partner == '1'?'checked':''}>배우자 유
				    </label>
				    <label class="radio-inline"  >
				      <input type="radio" value="0" name="partner" id="partner" ${salary.partner == '0'?'checked':''} >배우자 무
				    </label>
			    </div>
			    
				<br>
				
				
			
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<span class="input-group-addon">부양자20</span>
					<select name="dependent20" id="dependent20" class="selectpicker form-control" style="width: 65px"  >
						<c:forEach var="dependent20" begin="1" end="20" step="1">

							<option <c:if test="${salary.dependent20== dependent20}">selected</c:if>>${dependent20}</option>
							
						</c:forEach>				
					</select>
			
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<span class="input-group-addon">부양자60</span>
					<select name="dependent60" id="dependent60"  class="selectpicker form-control" style="width: 65px"  >
						<c:forEach var="dependent60" begin="1" end="20" step="1">	
							<option <c:if test="${salary.dependent60==dependent60}">selected</c:if> >${dependent60}</option>	
						</c:forEach>				
					</select>		
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<input name="base" id="base" value="${salary.base}" class="form-control" type="number" size="20" placeholder="기본급"
					 data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validateName']" />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<input name="extrapay1" value="${salary.extrapay1}" id="extrapay1" class="form-control" type="number" size="20" placeholder="수당1"
					 data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validateName']" />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<input name="extrapay2" value="${salary.extrapay2}" id="extrapay2" class="form-control" type="number" size="20" placeholder="수당2"
					 data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validateName']" />
				</div>
				<br>
				<div align="center">
					<button id="save" name="save" type="button" class="btn btn-default">Save</button>
					<span>&nbsp;&nbsp;</span>
					<span>&nbsp;&nbsp;</span>
					<button type="button" name="cancel" class="btn btn-default">Cancel</button>
				</div>
					
					
					
			</div>
				
				
		</div>
	  	
	  	
	 </div>
	  	
		
		

</form>








	

</body>
</html>















