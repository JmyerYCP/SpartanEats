<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #f2f2f2;
	height: 100%;
	width: 100%;
	font-size: 40px;
	letter-spacing: 2px;
}

h1 {
	text-align: center;
	color: white;
	font-size: 80px;
	text-shadow: 6px 6px 10px #377A3A;
	padding-bottom: 15px;
}

.Continue {
	display: inline-block;
	background-color: #4CAF50;
	border-radius: 80px;
	color: white;
	text-align: center;
	letter-spacing: 6px;
	padding: 10px;
	width: 70%;
	height: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin-left: 150px;
	margin-bottom: 20px;
	font-size: 50px;
}

.removeButton {
	position: absolute;
	right: 0;
	background-color: #f2f2f2;
	border: none;
	color: red;
	text-align: center;
	font-size: 30px;
	padding: 10 10 10 10;
	width: 10%;
	height: 60px; `
	transition: all 0.5s;
	cursor: pointer;
	margin-left: 10px;
	margin-bottom: 20px;
}

.h2 {
	font-size: 200px;
	color: #4CAF50;
}

#condiments {
	padding-left: 50px;
	font-size: 35px;
	color: black;
}

@
keyframes click-wave { 0% {
	height: 40px;
	width: 40px;
	opacity: 0.35;
	position: relative;
}

100%
{
height:200px;
width:200px;
margin-left:-80px;
margin-top:-80px;
opacity:0;}
}
.option-input {
	-webkit-appearance: none;
	-moz-appearance: none;
	-ms-appearance: none;
	-o-appearance: none;
	appearance: none;
	position: relative;
	top: 20px;
	right: 0;
	bottom: 0;
	left: 0;
	height: 100px;
	width: 100px;
	transition: all 0.15s ease-out 0s;
	background: #ebebe4;
	border-style: solid;
	border-width: 1px;
	border-color: #9faab7;
	box-shadow: 2px 2px 2px grey;
	color: #202020;
	cursor: pointer;
	display: inline-block;
	margin-right: 0.5rem;
	outline: none;
	position: relative;
	z-index: 1000;
}

.option-input:hover {
	background: #9faab7;
}

.option-input:checked {
	background: #4CAF50;
}

.option-input:checked::before {
	height: 100px;
	width: 100px;
	position: absolute;
	content: '\2714';
	color: white;
	display: inline-block;
	font-size: 100px;
	text-align: center;
	line-height: 100px;
}

.option-input:checked::after {
	-webkit-animation: click-wave 0.65s;
	-moz-animation: click-wave 0.65s;
	animation: click-wave 0.65s;
	background: #4CAF50;
	content: '';
	display: block;
	position: relative;
	z-index: 100;
}

#textBox {
	display: inline-block;
	height: 70px;
	width: 850px;
	padding-top: 25px;
	font-size: 45px;
	color: #202020;
	border-style: solid;
	border-width: 1px;
	border-color: #9faab7;
}

.Submit button {
	width: 50%;
	height: 150px;
	position: fixed;
	bottom: 0;
	right: 0;
	margin-left: -1px;
	margin-right: -1px;
	margin-bottom: -5px;
	text-align: center;
	font-size: 50px;
	color: white;
	background-color: #4CAF50;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-shadow: 6px 6px 10px Black;
}

.total {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 50%;
	margin-left: -1px;
	margin-right: -1px;
	margin-bottom: -5px;
	font-size: 53px;
	color: black;
	letter-spacing: 2px;
	border-top: 2px solid #9faab7;
	padding-top: 37px;
	padding-bottom: 40px;
	padding-left: 50px;
	padding-right: 50px;
}

.container {
	display: block;
	position: relative;
	padding-left: 20px;
	margin-bottom: 30px;
	font-size: 55px;
	width: 100%;
	border-bottom: 6px dashed #808080;
	padding-right: 10px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.itemPrice {
	float: right;
	padding-right: 100px;
	padding-top: 10px;
	font-size: 40px;
}
.hideDropdown {
  display: none;
}

.DormDrop {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 30px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.DormDrop input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
	background-color: #9faab7;
    border-radius: 50%;
}
.DormDrop:hover input ~ .checkmark {
    background-color: #9faab7;
}
.DormDrop input:checked ~ .checkmark {
    background-color: #4FAC50;
}
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}
.DormDrop input:checked ~ .checkmark:after {
    display: block;
}
.DormDrop .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
#f{
float: left;
}
#s{
float: right;
}
</style>
<title>View Order</title>
<h1>
	<b>Finalize Order</b>
</h1>
<body>
	<form action="${pageContext.servletContext.contextPath}/vieworder" method="post">
	<hr> 
			<label>
			<input type="checkbox" class="option-input checkbox"
			name="example" id="custom" value="one-time" onclick="setOrderName()" />
			
			<input type="text" name="orderName" id="textBox"
			placeholder="Click to Save Order" onfocus="this.placeholder = ''"
			disabled />
		</label>
		<hr style="opacity: 0;">
		<hr style="opacity: 0;">
		<hr>
		Select a Delivery Type &nbsp; &nbsp;
		<input type="radio" name="tab" value="false" onclick="pickup();"/> Pickup &nbsp; &nbsp;
		<input type="radio" name="tab" value="true" onclick="delivery();" /> Delivery
		<div id="div1" class="hideDropdown">
  			<hr>
  			<p>Select a Dorm...</p>
  			<label class="DormDrop" id="f"><input type="radio" name="DORM" value="Beard Hall"> Beard Hall &nbsp; <span class="checkmark"></span></label>
			<label class="DormDrop" id="s"><input type="radio" name="DORM" value="Codorous Hall"> Codorous Hall  &nbsp; <span class="checkmark"></span></label>
			<br>
			<label class="DormDrop" id="f"><input type="radio" name="DORM" value="Penn Hall"> Penn Hall  &nbsp; <span class="checkmark"></span></label>
			<label class="DormDrop" id="s"><input type="radio" name="DORM" value="Susquehana Hall"> Susquehana Hall  &nbsp; <span class="checkmark"></span></label>
			<br>
			<label class="DormDrop" id="f"><input type="radio" name="DORM" value="Manor Hall"> Manor Hall  &nbsp; <span class="checkmark"></span></label>
			<label class="DormDrop" id="s"><input type="radio" name="DORM" value="Tyler Run Appt"> Tyler Run Appt  &nbsp; <span class="checkmark"></span></label>
			<br>
			<label class="DormDrop" id="f"><input type="radio" name="DORM" value="Northside Commons"> Northside Commons  &nbsp; <span class="checkmark"></span></label>
			<label class="DormDrop" id="s"><input type="radio" name="DORM" value="Little Run Lodge"> Little Run Lodge  &nbsp; <span class="checkmark"></span></label>
			<br>
			<label class="DormDrop" id="f"><input type="radio" name="DORM" value="Richland Hal"> Richland Hall  &nbsp; <span class="checkmark"></span></label>
			<label class="DormDrop" id="s"><input type="radio" name="DORM" value="Brockie Commons"> Brockie Commons  &nbsp; <span class="checkmark"></span></label>
			<br>
			<label class="DormDrop" id="f"><input type="radio" name="DORM" value="Spring Garden Appt"> Spring Garden Appt  &nbsp; <span class="checkmark"></span></label>
			<label class="DormDrop" id="s"><input type="radio" name="DORM" value="Country Club Manor"> Country Club Manor  &nbsp; <span class="checkmark"></span></label>
					<hr style="opacity: 0;">
			</div>
			<hr>
		<button class="Continue" type="Submit" value="true"
			name="continueOrder" style="vertical-align: middle">&#43;
			Add Items</button>

		<table>
			<c:forEach items="${order.condArray}" var="condarray"
				varStatus="iter">
				<div>
					<label class="container"><span class="itemName">${order.itemList[iter.index].itemName}:
					</span><span class="itemPrice">&#36;${order.itemList[iter.index].price}</span>
						<button class="removeButton" type="Submit" value="${iter.index}"
							name="removeItem" title="Remove Item From Cart">&#215;</button></label>
				</div>
				<c:forEach items="${condarray}" var="condiments">
					<div id="condiments">${condiments.condName}
						<input type="hidden" value="${iter.index}" name="fromItem">
						<button class="removeButton" type="Submit" name="removeCondiment"
							value="${condiments.condID}" title="Remove Condiment From Item">&#215;</button>
					</div>
				</c:forEach>
			</c:forEach>
			</table>
			<hr>
		Select the Payment Type <br>
		&nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="payment" value="Flex"/> Flex [&#36;${flexBalance}]
		&nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="payment" value="Dining"/> Dining [&#36;${diningBalance}]
		
			<div class="Submit">
				<span class="total"><b>Total:</b> &#36;${order.totalPrice}</span>
				<button type="Submit" value="true" name="orderComplete">Submit
					Order&#187;</button>
			</div>
		
	</form>
<script>
window.setOrderName = function() {
	if (document.getElementById("custom").checked) {
		document.getElementById("textBox").disabled = false;
		document.getElementsByName('orderName')[0].placeholder = 'Enter Order Name';
	} else {
		document.getElementById("textBox").disabled = true;
	}
}
function pickup(){
	  document.getElementById('div1').style.display ='none';
	}
	function delivery(){
	  document.getElementById('div1').style.display = 'block';
}
</script>
</body>
</html>