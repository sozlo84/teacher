<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			if($('#confirm_chk').val()=='no'){
				alert("아이디 중복 체크를 하세요~");
				return;
			}
			$('#insert_form').submit();
			
		});	
		
		$('#photo').change(function(event){
			var tmppath = URL.createObjectURL(event.target.files[0]);
			alert($(this).val());
			$('#image').attr('src',tmppath);
// 			alert(tmppath);
		});
		
		$('#confirm').click(function(){
			
			var id = $('#id').val();
			if( id == "") {
				alert("ID를 입력하세요!");
				return;
			}
			$.ajax({
				type : 'POST',
				data : "id="+id,
				dataType : 'json',
				url : 'idconfirm',
				
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

<body class="div-bgcolor-gray" onload="doReset();">
				<!-- enctype="multipart/form-data" 이미지 저장을 위해서는 이거를 넣어줘야한다. -->
<form id ="insert_form" action="memberInsert" enctype="multipart/form-data" class="form-horizontal" name="insert_form"  method="post" role="form" data-parsley-validate="ture">
	<div class="contatiner">
	  <span class="text-success text-center"><h1>My First ITSCHOOL Page</h1></span>
	  <p class="text-success text-center">이것은 연습을 하기위한 페이지 입니다.</p>
	  <br><br>
		<div class="row">
			<div class="col-md-4"><span></span></div>
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
					<input id="id" name="id" class="form-control" text="text" size="16" placeholder="id"
					required="" data-parsley-error-message="please insert your ID" data-parsley-errors-container="div[id='validateId']" />
					<span class="input-group-btn">
<!-- 						<button class="btn btn-default" onclick="javascript:location.href='idconfirm'">Confirm</button> -->
						<button type="button" id="confirm" class="btn btn-default" >Confirm</button>
						<input id="confirm_chk" type="hidden" name="confirm_chk" value="no"/>
					</span>
				</div>
				<div id="validateId" style="color:#ff0000"></div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
					<input id="password" name="password" class="form-control" id="password" type="password" size="16" placeholder="PASSWORD"
					required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
				</div>
				
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
					<input name="repassword" class="form-control" id="repassword" type="password" size="16" placeholder="PASSWORD"
					required="true" data-parsley-error-message="please check password your rePASSWORD" 
					data-parsley-equalto="#password"
					data-parsley-errors-container="div[id='validatePassword']" />
				</div>
				<div id="validatePassword" style="color:#ff0000"></div>
				<br>
				
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
					<input name="name" class="form-control" text="text" size="20" placeholder="NAME"
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
				<input type="file" id="photo" name="imgfile">
				
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
					<div class="input-group-btn dropdown">
						<input id="phone1" name="phone1" type="hidden">
						<button  type="button" name="phone1" class="btn btn-default dropdown-toggle btn-md" type="button" data-toggle="dropdown">&nbsp; 010 &nbsp;
				   	 	<span class="caret"></span></button>
				    	<ul class="dropdown-menu" id="ulphone1">
							<li><a href="#">010</a></li>
						    <li><a href="#">011</a></li>
						    <li><a href="#">016</a></li>
						    <li><a href="#">017</a></li>
						    <li><a href="#">018</a></li>
						    <li><a href="#">019</a></li>
			    		</ul>
					</div>
					<span class="input-group-addon">-</span>
					<input name="phone2" class="form-control" text="text" size="4" placeholder="Phone" 
					required="" data-parsley-error-message="please insert your PHONE" data-parsley-errors-container="div[id='validatePhone']"/>
					<span class="input-group-addon">-</span>
					<input name="phone3" class="form-control" text="text" size="4" placeholder="Number" />
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
					<input name="addr1" class="form-control" text="text" size="50" placeholder="ADDRESS" />
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
					<input name="addr2" class="form-control" text="text" size="30" placeholder="DETAIL ADDRESS" />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
					<input name="email" class="form-control" text="text" size="30" placeholder="E-MAIL"
					required="" data-parsley-error-message="please insert your email" data-parsley-errors-container="div[id='validateEmail']" />
					<div id="validateEmail" style="color:#ff0000"></div>
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
					<input name="cardno" class="form-control" text="text" size="30" placeholder="Card No." />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-briefcase" aria-hidden="true"></i></span>
					<input name="job" class="form-control" text="text" size="30" placeholder="JOB" />
				</div>
				<br>
				<div align="center">
					<button id="save" name="save" type="button" class="btn btn-default">Save</button>
					<span>&nbsp;&nbsp;</span>
					<span>&nbsp;&nbsp;</span>
					<button type="button" name="cancel" class="btn btn-default">Cancel</button>
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









