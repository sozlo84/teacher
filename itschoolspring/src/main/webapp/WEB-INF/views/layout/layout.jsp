<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> 
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>   
   
<html>
<head>
<content tag="local_script">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<decorator:getProperty property="page.local_script"/>
	<!-- 위에 태그를 써야지만 사용하면 jsp들의 자바스크립트 링크 태그들을 사용할수 있게 해주는 태그이다. -->
	<!-- 그 jsp 자바스크립트단을 <content tag="local_script">태그로 또 감싸줘야지 사용이 가능하다. -->


  
  
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
  </style>
</content> 
</head>

<body>
	<div class="contatiner" style="border:1px solid red;">
		<div class="row" style="border:1px solid red;">
			<page:applyDecorator name="header"/>
		</div> 
		
		<div class="row text-center" style="border:1px solid red;">
			
			<div class="col-md-2 con-new" style="border:1px solid yellow;">
				 <page:applyDecorator name="leftmenu"/>
			</div>
			<div class="col-md-10" style="border:1px solid blue;">
				  <decorator:body />
			</div>
			
		</div>
		
		<div class="row footer navbar-fixed-bottom" style="text-align:center !important;width:100%" style="border:1px solid yellow;">
<%-- 			<page:applyDecorator name="footter"/> --%>
				ⓑCopyright 2016 . 10. 10 .Itschool
		</div>
	  	
	  	
  	</div>


</body>




</html>

    