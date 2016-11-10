<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<content tag="local_script">	
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery-3.1.1.min.js"></script>
  <script src="resources/js/jquery-3.1.1.js"></script>
  <script src="resources/js/parsley.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	
	$('#create').click(function(){
		
		var returnValue = confirm("확인이면 데이터가 소멸됩니다! \n\n 생성 하시겠습니까?");
		
		if(returnValue) {
    		$('#salarycreate_form').submit();
		}else{
			return;
		}
		
		
	});
  });
  
  </script>
</content>  
</head>
<body>

<div class="container text-center">

  <form class="form-horizontal" id="salarycreate_form" action="salaryRollup" name="insert_form"  method="post" role="form" data-parsley-validate="ture">
    
    	<div class="contatiner">
	 		 <span class="text-success text-center"><h1>Salary Page</h1></span>
    		 <br><br>		
  			<div class="row">
	  		
				<div class="col-md-offset-4 col-md-5">
    

	      			<div class="input-group">
<!-- 						<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span> -->
						<span class="input-group-addon"style="width:80px" >처리 연도</span>
						<input  id="yyyy" name="yyyy" value="${yyyy}" style="width:180px; text-align:center;">
					</div>  
				 <br>	
				<div class="input-group">
<!-- 					<span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span> -->
					<span class="input-group-addon" style="width:80px">처리 월 </span>
					<select  id="mm" name="mm" class="selectpicker form-control" style="width:180px; text-align:center;"   >
						
							<option >01</option>
							<option >02</option>
							<option >03</option>
							<option >04</option>
							<option >05</option>
							<option >06</option>
							<option >07</option>
							<option >08</option>
							<option >09</option>
							<option >10</option>
							<option >11</option>
							<option >12</option>
						
						
					</select>
				</div>  
				
				<br><br>	
 	    
				<div class="col-md-offset-2 input-group" align="center">
			        <button id="create" type="submit" class="btn btn-default">검색</button>
			        <span>&nbsp;&nbsp;</span>
			        <button type="button" id="cancel" onclick="location.href='home'" class="btn btn-default">취소</button>
			
			     
				</div>
	    	</div>
	    </div>
    </div>
  </form>
</div>

</body>
</html>

