<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<content tag="local_script">


<link rel="stylesheet"
   href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
   
<script src="resources/js/jquery-3.1.1.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
	$('#allchk').click(function(){
		if($(this).is(':checked')) {
			$("input[name=unitchk]").prop('checked',true);
		}else{
			$("input[name=unitchk]").prop("checked" ,false);
		}
		
	});
	
    $('#example_filter').append("<button id='selectdel' type='button' style='margin-left: 350px;'>선택삭제</button>");
    $('#selectdel').click(function(){
    	var checked = $("input[name=unitchk]:checked").length;
    	var saveids = new Array();
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
					saveids[index] = $(this).val();
	    		});
    		
	    		var url = "memberSelectedDelete?saveids="+saveids;
	    		$(location).attr('href',url);
	    		
    		}else{
    			return;
    		}
    		
    	}
    	alert("초아");
    });
} );
</script>
</content>
</head>
<body class="container" style="margin-top: 20px">

<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>id</th>
                <th>password</th>
                <th>name</th>
                <th>phone</th>
                <th>addr</th>
                <th>job</th>
                <th style="text-align:center !important;"><input type="checkbox" id="allchk"> </th>
            </tr>
        </thead>
      
        <tbody>
        	<c:forEach var="member" items="${members}" >
	            <tr>
	                <td><a href="memberUpdateForm?id=${member.id}"> ${member.id}</a></td>
	                <td>${member.password}</td>
	                <td>${member.name}</td>
	                <td>${member.phone1}-${member.phone2}-${member.phone3 }</td>
	                <td>${member.addr1}-${member.addr2}</td>
	                <td>${member.job}</td>
	                <td style="text-align:center !important;"><input type="checkbox" id="unitchk" name="unitchk" value="${member.id}"></td>
	            </tr>
	        </c:forEach>	    
            
           
        </tbody>
    </table>

</body>
</html>