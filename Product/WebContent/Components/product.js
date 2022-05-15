$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});


	// SAVE ============================================
	$(document).on("click", "#btnSave", function(event)
	{
	// Clear alerts---------------------
	 $("#alertSuccess").text("");
	 $("#alertSuccess").hide();
	 $("#alertError").text("");
	 $("#alertError").hide();
	// Form validation-------------------
	var status = validateProductForm();
	if (status != true)
	 {
	 $("#alertError").text(status);
	 $("#alertError").show();
	 return;
	 }
		 
	 
	// If valid------------------------
	 $("#formProduct").submit();
	});
	// UPDATE==========================================
	$(document).on("click", ".btnUpdate", function(event)
	{
	 $("#hidProductIDSave").val($(this).closest("tr").find('#hidProductIDUpdate').val());
	 $("#productCode").val($(this).closest("tr").find('td:eq(0)').text());
	 $("#productName").val($(this).closest("tr").find('td:eq(1)').text());
	 $("#productPrice").val($(this).closest("tr").find('td:eq(2)').text());
	 $("#productDesc").val($(this).closest("tr").find('td:eq(3)').text());
	});
	
	
	// CLIENT-MODEL================================================================
	function validateProductForm()
	{
	// CODE
	if ($("#productCode").val().trim() == "")
	 {
	 return "Insert Product Code.";
	 }
	// NAME
	if ($("#productName").val().trim() == "")
	 {
	 return "Insert Product Name.";
	 } 
 
	 // PRICE-------------------------------
	if ($("#productPrice").val().trim() == "")
	 {
	 return "Insert Product Price.";
	 }
	// is numerical value
	var tmpPrice = $("#productPrice").val().trim();
	if (!$.isNumeric(tmpPrice))
	 {
	 return "Insert a numerical value for Product Price.";
	 }
		 
	// convert to decimal price
	 $("#productPrice").val(parseFloat(tmpPrice).toFixed(2));
	 
	// DESCRIPTION------------------------
	if ($("#productDesc").val().trim() == "")
	 {
	 return "Insert Product Description.";
	 }
	return true;
	}
