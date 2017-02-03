<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	
<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath() %>/resources/css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
</head>
<body>

<div class="container container-fluid">


		<form class="form-horizontal" action=" " method="post" id="reg_form">


				<!-- Form Name -->
				<legend> 회원가입이 완료되었습니다. </legend>

				<!-- Email -->
				<div class="form-group">
					<label class="col-md-4 control-label">이제 여기로 나갑니다</label>
				</div>
				</form>
				</div>
				
				



<script>
function indexBtn(this.form){
	
	location.href="/index";
	
}

</script>

</body>
</html>