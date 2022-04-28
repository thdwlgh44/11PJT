<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
	// �˻� | page �ΰ��� ��� ��� Form ���� ���� JavaScript �̿�
	function fncGetUserList(currentPage) {//pagenavigation������ GetUserList�� ���
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${menu}").submit();
	}

	//==============================================================================
	 $(function() {
		 
		 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			fncGetUserList(1);
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			var prodNo = $(this).data("param");
			if(${param.menu == 'manage'}) {	
				self.location ="/product/updateProductView?prodNo="+prodNo+"&menu=manage";
			} else {
				$.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo ,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								var displayValue = "<h3>"
															+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
															+"��ǰ�� : "+JSONData.prodName+"<br/>"															
															+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"															
															+"��ǰ������ : "+JSONData.prodDetail+"<br/>"															
															+"��ǰ������ : "+JSONData.manuDate+"<br/>"															
															+"��  �� : "+JSONData.price+"<br/>"
															+"����� : "+JSONData.regDate+"<br/>"
															+"</h3>";
								$("h3").remove();
								$( "#"+prodNo+"" ).html(displayValue);
				}
			});
		}
	});
		
		//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		
		//==> �Ʒ��� ���� ������ ������ ??
		//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
	});
	 
	
	 
</script>
</head> 

<body bgcolor="#ffffff" text="#000000">
<div style="width:98%; margin-left:10px;">
<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
				
				<c:set var="name" value="${param.menu}"/>
				<c:if test="${name == 'manage'}">
					��ǰ ����
				</c:if>					
				<c:if test="${name != 'manage'}">
					��ǰ �����ȸ
				</c:if>					
					
				<%-- if(menu.equals("manage")) {%>
					��ǰ ����
				<% } else if(menu.equals("search")) { %>
					��ǰ �����ȸ
				<% } --%>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
							<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<%-- <input type="text" name="searchKeyword" value="<%= searchKeyword %>" --%>  
			<input type="text" name="searchKeyword" 
				value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
				class="ct_input_g" style="width:200px; height:19px">
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetProductList('1');">�˻�</a> -->
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<%-- <td colspan="11" >
		��ü <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%= resultPage.getCurrentPage() %> ������</td>
	 --%>
	 <td colspan="11" >
	 	��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- 	
	<%
		int no = list.size();
		for(int i=0; i<list.size(); i++) {
			Product product = list.get(i);
	%> 
	

	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
		<td align="left">
				<% if(menu.equals("manage")) {%>
					<a href="/updateProductView.do?prodNo=<%=product.getProdNo() %>"><%=product.getProdName() %></a>
				<% } else { %>
					<a href="/getProduct.do?prodNo=<%=product.getProdNo() %>"><%=product.getProdName() %></a>
				<% } %>
		</td>
		<td></td>
		<td align="left"><%=product.getPrice() %></td>
		<td></td>
		<td align="left"><%=product.getRegDate() %></td>
		<td></td>
		<td align="left">
		
			�Ǹ���
			
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %> --%>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left" data-param="${product.prodNo}">
					<!-- <a href="/product/updateProductView?prodNo=${product.prodNo}">${product.prodName}</a> -->
					${product.prodName}
					<!-- <a href="/product/readProduct?prodNo=${product.prodNo}">${product.prodName}</a> -->
			<%-- if(menu.equals("manage")) {%>
				<a href="/updateProductView.do?prodNo=${user.userId}%></a>
			<% } else { %>
				<a href="/getProduct.do?prodNo=${user.userId}%></a>
			<% } --%>
			</td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">�Ǹ���</td>
					
		</tr>
		<tr>
		<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
 			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<%-- 
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage(); i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
			--%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
			
    	</td>
	</tr>
</table>
<!--  PageNavigation End... -->
</form>
</div>

</body>
</html>
    