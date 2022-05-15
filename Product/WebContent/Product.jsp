<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
    
<%@page import="model.Product"%>

<%
//Save---------------------------------
if (request.getParameter("productCode") != null)
{
Product productObj = new Product();
String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidIDSave") == "")
{
stsMsg = productObj.insertProduct(request.getParameter("productCode"),
request.getParameter("productName"),
request.getParameter("productPrice"),
request.getParameter("productDesc"));
}
else//Update----------------------
{
stsMsg = productObj.updateProduct(request.getParameter("hidIDSave"),
request.getParameter("productCode"),
request.getParameter("productName"),
request.getParameter("productPrice"),
request.getParameter("productDesc"));
}
session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidIDDelete") != null)
{
Product productObj = new Product();
String stsMsg =
productObj.deleteProduct(request.getParameter("hidIDDelete"));
session.setAttribute("statusMsg", stsMsg);
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/User.js"></script>

<title>Product Management</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-3">
        <div class="nauk-info-connections">
        </div>
     </div>
</div>
<h1>User Management</h1>

<form id="formProduct" name="formProduct" method="post" action="Product.jsp">
Product code:
<input id="productCode" name="productCode" type="text"
 class="form-control form-control-sm">
<br> Product Name:
<input id="ProductName" name="productName" type="text"
 class="form-control form-control-sm">
<br> Product Price:
<input id="productPrice" name="productPrice" type="text"
 class="form-control form-control-sm">
<br> Product Desc:
<input id="productdesc" name="productdesc" type="text"
 class="form-control form-control-sm">
<br>
<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
<input type="hidden" id="hidIDSave" name="hidIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<%
 out.print(session.getAttribute("statusMsg"));
%>
<br>
<div id="divUserGrid">
<%

Product productObj = new Product();
out.print(productObj.readProduct());
%>
</div>
</body>
</html>

