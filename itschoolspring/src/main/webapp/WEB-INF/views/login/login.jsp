<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	$('#cancel').click(function(){
// 		var url = "memberSelectedDelete?saveids="+saveids;
// 		$(location).attr('href',url);
		$(location).attr('href','index');	
	});
  });
  
  </script>
</content>  
</head>
<body>

<div class="container text-center">
  <h2>Login</h2>
  <br><br>
  <form class="form-horizontal" id="insert_from" action="loginup" name="insert_form"  method="post" role="form" data-parsley-validate="ture">
    <div class="form-group">
      <label class="col-md-offset-2 control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-4">
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" autofocus
        required="" data-parsley-error-message="please insert your email" data-parsley-errors-container="div[id='validateEmail']">
    	<div id="validateEmail" style="color:#ff0000"></div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-offset-2 control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-4">
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password"
         required="" data-parsley-error-message="please insert your Password" data-parsley-errors-container="div[id='validatePassword']">
         <div id="validatePassword" style="color:#ff0000"></div>
      </div>
    </div>
  
    <div class="form-group" align="center">

        <button type="submit" class="btn btn-default">login</button>
        <span>&nbsp;&nbsp;</span>
        <button type="button" id="cancel" class="btn btn-default">cancel</button>

     
    </div>
  </form>
</div>

</body>
</html>

