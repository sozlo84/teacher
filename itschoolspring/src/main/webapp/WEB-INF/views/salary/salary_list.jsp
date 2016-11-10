<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<link rel="stylesheet"
   href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
   
<script src="resources/js/jquery-3.1.1.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
   
	$('#allchk').click(function(){
		if($(this).is(':checked')) {
			$("input[name=unitchk]").prop('checked',true);
		}else{
			$("input[name=unitchk]").prop("checked" ,false);
		}
		
	});
	$('#selectdel').click(function(){
		var checked = $("input[name=unitchk]:checked").length;
    	var nos = new Array();
    	// 배열 객체 생성.
    	if( checked == 0 ) {
    		alert("삭제할 항목을 체크 하세요!");
    		return;
    	} else {
    		
    		var returnValue = confirm("삭제 하시겠습니까?");
    		
//     		document.write(returnValue);
    		
    		alert(returnValue);
       		if(returnValue) {
	    		$('#unitchk:checked').each(function(index){
	//     			alert($(this).val());
					nos[index] = $(this).val();
	    		});
    		
	    		var url = "SalarySelectedDelete?no="+nos;
	    		$(location).attr('href',url);
	    		
    		}else{
    			return;
    		}
    		
    	}	
	});
	
	
	
} );
</script>	
</content>
</head>
<body>
<form id="boardList_form" name="boardList_form" class="form-horizontal" action="boardPageList" method="POST" role="form" data-parsley-validate="true">	
	<div class="contatiner"  style="height: 650px;backtround-color:#fff">
			<div class="row" style="margin-top:10px"></div>	
			 <span class="text-success text-center" ><h1> Salary List</h1></span>
			 <br><br>
			 <div class="row">
				<div class="col-md-offset-1 col-md-10 text-center" style="margin-top:10px;background-color:#ccc;">
					<span class="col-md-1" > 사번 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 이름 </span>
					<span class="col-md-2" style=" border:1px solid #fff;"> 부서 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 배우자 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 부양자20 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 부양자60 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 기본급 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 수당1 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 수당2 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 합계 </span>
					<span class="col-md-1" ><input type="checkbox" id="allchk"></span>
				</div>
			</div>
			
			<c:forEach var="salarys" items="${salarys}" >
				<div class="row">
					<div class="col-md-offset-1 col-md-10 text-center" style="background-color:#eeeeee">
					
					
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.no}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">
						
						<a href="salaryDetail?no=${salarys.no}">${salarys.name}</a>
					
						</span>
						<span class="col-md-2" style=" border:1px solid #fff;height:40px">${salarys.dept}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.partner}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.dependent20}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.dependent60}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.base}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.extrapay1}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.extrapay2}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px">${salarys.base+salarys.extrapay1+salarys.extrapay2}</span>
						<span class="col-md-1" ><input type="checkbox" id="unitchk" name="unitchk" value="${salarys.no}"></span>
						
					</div>
				</div>
			</c:forEach>
			
			
			<div class="row">
				<div class="col-md-offset-2 col-md-8 resultMessage text-center" style="margin-top:10px">
					[1]
				</div>
			</div>
			
			<div class="row">
			<div class="col-md-offset-5 col-md-6 resultMessage " style="margin-top:10px">
				<span class="col-md-offset-3 col-md-2">
					<select name="selectbox" id="selectbox">
						<option value="b_title"  > 제목</option>
						<option value="b_name"  >글쓴이</option>
						<option value="b_content"> 내용</option>
					</select>
				</span>
				<span class="col-md-2">
					<input type="text" name="find" id="find" value="${boardpaging.getFind()}"/>
				</span>
				<span class="col-md-1">
					<i class="fa fa-search" aria-hidden="true"></i>
					<button  type="submit" class="btn btn-success resultButton"> 검색</button>
					
				</span>
				<span class="col-md-1">
					<i class="fa fa-pencil" aria-hidden="true"></i>
					<button  type="button" onclick="location.href='SalaryInsertForm'" class="btn btn-info resultButton"> 글쓰기</button>
				</span>
				
				<span class="col-md-1">
					<i class="fa fa-pencil" aria-hidden="true"></i>
					<button  id="selectdel" name type="button"  class="btn btn-info resultButton">삭제</button>
				</span>
				
			</div>
		</div>
			
	</div>
	
</form>	
	
</body>
</html>