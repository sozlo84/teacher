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
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	


</head>
<body>



<form class="form-horizontal" action="#" method="post" role="form" data-parsley-validate="true">
	
	<div class="container-fluid">
		
			
			<div class="row">
				<div class="background-color-green">
				gggg
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2 background-color-pink">
					<div class="row ">
					ggg
					ggg
					</div>	
					<div class="row ">
					ggg
					ggg
					</div>	
				</div>
				<div class="col-md-10 ">
					
					<div class="row">
						<div class="col-md-8">
							
							<div class="row con-new" >
								<div class="col-sm-3" >
									<div class="input-group" >
										<span class="input-group-addon"><i class="fa fa-user"></i></span>
										<input name="id" class="form-control" type="text" size="30" placeholder="id"
										required="" data-parsley-error-message="Please insert your ID"
										data-parsley-errors-container="div[id='validateId']"/>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-1" >
											<button class="btn btn-primary">중복검사</button>
									</div>
								</div>
							</div>
							<div id="validateId" style="color:#ff0000"></div>
							
							<div class="row con-new">
								<div class="col-sm-6">
									<div class="input-group" >
										<span class="input-group-addon"><i class="fa fa-key" ></i></span>
										<input class="form-control" id="password" name="password" type="password" id="password"size="10" placeholder="password"
										required="true" data-parsley-error-message="please insert your password" 
										data-parsley-errors-container="div[id='validatePassword']"
										/> 
									</div>
								</div>
							</div>	
							
							<div class="row con-new">
								<div class="col-sm-6">
									<div class="input-group" >
										<span class="input-group-addon"><i class="fa fa-key" aria-hidden="true"></i></span>
										<input class="form-control" name="repassword" type="password" id="repassword"size="10" placeholder="password"
										required="true" data-parsley-error-message="please check your repassword" 
										data-parsley-equalto="#password"
										data-parsley-errors-container="div[id='validatePassword']" 
										/>
									</div>
								</div>
							</div>	
							<div id="validatePassword" style="color:#ff0000"></div>
							<div class="row con-new">
								<div class="col-sm-12">
									<div class="row col-sm-2">	
										<div class="dropdown">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-mobile" aria-hidden="true"></i></span> 
											    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">010
											    <span class="caret"></span></button>
											    <ul class="dropdown-menu">
											      <li><a href="#">010</a></li>
											      <li><a href="#">메롱</a></li>
											      <li><a href="#">히히</a></li>
									   		 	</ul>
										    </div>
						  				</div>
					  				</div>
											
									<div class="row col-sm-3">
										<input class="form-control" type="text" size="10" placeholder="phone2"/>
									</div>
										
									<div class="col-sm-3">
										<input class="form-control" type="text" size="10" placeholder="phone3"/>
									</div>
								</div>	
									
							</div>
							
							<div class="row con-new" >
								<div class="col-sm-4">
									<div class="input-group" >
										<span class="input-group-addon"><i class="fa fa-user"></i></span>
										<input class="form-control" type="text" size="10" placeholder="zipcode"/>
									</div>
								</div>
							</div>
							
						</div>
						<div class="col-md-4 ">
							<div class="row " >
								<div class="background-color-black">
									<div class="input-group" >
										<span class="input-group-addon"><i class="fa fa-user"></i></span>
							 			<img src="resources/photo/soso.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
						 			</div>
						 		</div>
							</div>		
						</div>
				</div>
					
				<div class="row con-new" >
						<div class="col-sm-9">
							<div class="row col-sm-4">
								<div class="input-group" >
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input class="form-control" type="text" size="10" placeholder="addr1"/>
								</div>
							</div>
							
							<div class="col-sm-4">		
								<input class="form-control" type="text" size="10" placeholder="addr2"/>
							</div>
							
						</div>
				</div>
						
				<div class="row con-new" >
						<div class="col-sm-4">
							<div class="input-group" >
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input class="form-control" type="text" size="10" placeholder="email"/>
							</div>
						</div>
				</div>	
					
				<div class="row con-new" >
					<div class="col-sm-4">
						<div class="input-group" >
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input class="form-control" type="text" size="10" placeholder="cardno"/>
						</div>
					</div>
				</div>
					
				<div class="row con-new" >
					<div class="col-sm-4">
						<div class="input-group" >
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input class="form-control" type="text" size="10" placeholder="inputdate"/>
						</div>
					</div>
				</div>	
					
				<div class="row con-new" >
					<div class="col-sm-4">
						<div class="input-group" >
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input class="form-control" type="text" size="10" placeholder="job"/>
						</div>
					</div>
				</div>
				
				<div class="row con-new" >
					<div class="col-sm-4">
						<div class="input-group" >
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input class="form-control" type="text" size="10" placeholder="memberlevel"/>
						</div>
					</div>
				</div>	
				
				<div class="row con-new">
					<div class="col-sm-3"  >
							<button type="button" class="btn btn-primary" style="width:100%;">가입</button>
					</div>
					<div class="col-sm-3"  >
							<button type="button" class="btn btn-primary" style="width:100%;">취소</button>
					</div>
				</div>
				
			</div>
		</div>
			
			<div class="row">
				<div class="background-color-yellow">
				gggg
				</div>
			</div>
		
	
	
	</div>
	
	

</form>

</body>
</html>









