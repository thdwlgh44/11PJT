<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- EL / JSTL 적용으로 주석 처리
<%@ page import="com.model2.mvc.service.domain.Product"%>
<%
	Product product = (Product)request.getAttribute("product");
%> --%>
    
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>

<script type="text/javascript">


	//==> 추가된부분 : "수정" Event 연결 및 처리
	$(function() {

		$("button").on("click", function() {
			self.location = "/product/updateProductView?prodNo=${product.prodNo}"
		});
		
	});
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
	       <h5 class="text-muted">상품을 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>상 품 번 호</strong></div>
			<div class="col-xs-7 col-md-5">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>상 품 명</strong></div>
			<div class="col-xs-7 col-md-5">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>상품이미지</strong></div>
			<div class="col-xs-7 col-md-5">${product.fileName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>상품상세정보</strong></div>
			<div class="col-xs-7 col-md-5">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>제조일자</strong></div>
			<div class="col-xs-7 col-md-5">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>가격</strong></div>
			<div class="col-xs-7 col-md-5">${!empty product.price ? product.price : ''}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>등록일자</strong></div>
			<div class="col-xs-7 col-md-5">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">상품정보수정</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	
</body>

</html>