<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 	
<style type="text/css">
	
	.demo-content{
		background: #ff0000;
	}
	.demo-content.bg-alt{
		background: #00ff00;
	}
</style>

</head>
<script type="text/javascript">
// 	$(document).ready(function(){
		
// 		$('#test').click(function(){
// 			alert();
// 			$('#test').remove();		
// 			$('<div id="newtest">This is new</div>').appendTo('body');
			
			
// 		});
		
// 	});
	
</script>
	
<body>
	
	
	
	<div class="container">
		<div class="row">
			<div class="col-sm-6" style="border-style:solid; border-color:#7FFF00;">
				<div class="div-bgcolor-red il"  >.col-sm-6
				<i class="fa fa-blind" aria-hidden="true"></i>
				<i class="fa fa-camera" aria-hidden="true"></i>
				
				</div>
			</div>
			<div class="col-sm-6">
				<div class="div-bgcolor-green" style="border-style:solid;
				border-color:#00FFFF " >.col-sm-6</div>
			</div>
			<div class="col-sm-4">
				<div class="div-bgcolor-blue" >.col-sm-6</div>
			</div>
			<div class="col-sm-8">
				<div class="div-bgcolor-black" >.col-sm-6</div>
			</div>
			
		</div>
		
		<div class="row col-sm-6 con-new" >
			<div class="input-group col-sm-offset-6" >
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input class="form-control" type="text" size="10" placeholder="id"/>
			</div>
			<span class="input-group col-sm-offset-2"></span>
		</div>
		
		
		
		
		
<!-- 		<div class="row col-sm-offset-6" > -->
		
<!-- 		</div> -->
		
		<div class="row">
			<button type="button" class="btn btn-default">Default</button>
			<button type="button" class="btn btn-primary">Primary</button>
			<button type="button" class="btn btn-success">Success</button>
			<button type="button" class="btn btn-info">Info</button>
			<button type="button" class="btn btn-warning">Warning</button>
			<button type="button" class="btn btn-danger">Danger</button>
			<button type="button" class="btn btn-link">Link</button>
		
		</div>
		<div class="row-fluid">
			<div class="radio">
				<label><input type="radio" name="optradio">Option1</label>
			</div>
			<div class="radio">
				<label><input type="radio" name="optradio">Option 2</label>
			</div>
			<div class="radio disabled">
				<label><input type="radio" name="optradio"
				disabled>Option 3</label>
			</div>
		
		</div>
		<div class="row-fluid">
			<div class="checkbox">
				<label><input type="checkbox" value="">Option 1</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" value="">Option 2</label>
			</div>
			<div class="checkbox disabled">
				<label><input type="checkbox" value="" disabled>Option 3</label>
			</div>
		</div>
		
		
		<div class="form-group">

			<label for="comment">Comment:</label>
		
			<textarea class="form-control" rows="5" id="comment"></textarea>
		
		</div>
		
		
		<div class="dropdown">
		    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu">
		      <li><a href="#">HTML</a></li>
		      <li><a href="#">CSS</a></li>
		      <li><a href="#">JavaScript</a></li>
   		 	</ul>
  		</div>
		
		<div class="row">
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-1</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-2</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-3</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-4</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-5</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-7</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-8</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-9</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-10</div>
		</div>
	
		
		<div class="row">
			
			<div class="col-sm-offset-6" style="border-style:solid; border-color:#000000;">.col-sm-5</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			<div class="col-sm-1" style="border-style:solid; border-color:#000000;">.col-sm-6</div>
			
		</div>
		
		
		
	</div>
	
	
	
	
</body>
</html>






