<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>



<script type="text/javascript">

	function fncGetUserList(currentPage) {//pagenavigation때문에 GetUserList로 명명
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	};

	 	//============= "검색"  Event  처리 =============
		$(function() {
		 
		 $( "button.btn.btn-default" ).on("click" , function() {
			fncGetUserList(1);
		 	});
		});
		
		//============= prodName 에 상품정보보기  Event  처리(Click) =============
		$(function() {
			
		$( "td:nth-child(2)" ).on("click" , function() {
			if(${param.menu == 'manage'}) {
				self.location ="/product/getProduct?prodNo="+$(this).attr("prodNo");
			} else {
				self.location ="/product/readProduct?prodNo="+$(this).attr("prodNo");
			}
		});
			
		//==> prodName LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(2)" ).css("color" , "red");	
			
	});		
			
			
		//============= prodName 에 회원정보보기  Event  처리 (double Click)=============
				
			
		$(function() {
			
		$( "td:nth-child(6)> i" ).on("click" , function() {
			
			var prodNo = $(this).next().val();
			
				$.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								var displayValue = "<h6>"
															+"상품번호 : "+JSONData.prodNo+"<br/>"
															+"상품명 : "+JSONData.prodName+"<br/>"															
															+"상품이미지 : "+JSONData.fileName+"<br/>"															
															+"상품상세정보 : "+JSONData.prodDetail+"<br/>"															
															+"제조일자 : "+JSONData.manuDate+"<br/>"															
															+"가  격 : "+JSONData.price+"<br/>"
															+"등록일 : "+JSONData.regDateString+"<br/>"
															+"</h6>";
								$("h6").remove();
								$( "#"+JSONData.prodNo+"" ).append(displayValue);
						}
					});
				
			});
		
		//==> prodNo LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});
		
		$(function() {
			
		$( "td:nth-child(6)> i" ).on("click" , function() {
			
			var prodNo = $(this).next.val();
			
				$.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								var displayValue = "<h3>"
															+"상품번호 : "+JSONData.prodNo+"<br/>"
															+"상품명 : "+JSONData.prodName+"<br/>"															
															+"상품이미지 : "+JSONData.fileName+"<br/>"															
															+"상품상세정보 : "+JSONData.prodDetail+"<br/>"															
															+"제조일자 : "+JSONData.manuDate+"<br/>"															
															+"가  격 : "+JSONData.price+"<br/>"
															+"등록일 : "+JSONData.regDateString+"<br/>"
															+"</h3>";
								$("h3").remove();
								$( "#"+JSONData.prodNo+"" ).append(displayValue);
						}
					});
				
			});
		
		//==> prodNo LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});
	 
		</script>

	</head> 

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header text-info">
		<c:set var="name" value="${param.menu}"/>
			<c:if test="${name == 'manage'}">
					<h3>상품 관리</h3>
				</c:if>
			<c:if test="${name != 'manage'}">
					<h3>상품 목록조회</h3>
				</c:if>
		</div>
	
	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	<div class="row">
	
	 	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		</div>
		
		 <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		<!--  table Start /////////////////////////////////////-->
      	<table class="table table-hover table-striped" >
      	
      	 <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
        
        <tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" prodNo="${product.prodNo}" title="Click : 상품정보 확인">
			  ${product.prodName}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDateString}</td>
			  <td align="left">${product.proTranCode}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id="${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
     </tbody>
     
</table>
	  <!--  table End /////////////////////////////////////-->
        
      </div>
 	<!--  화면구성 div End /////////////////////////////////////-->  
    
    <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!--  PageNavigation End... -->    

</body>

</html>
    