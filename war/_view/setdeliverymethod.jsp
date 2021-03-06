<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<style>
body{
	font-family: Arial, Helvetica, sans-serif;
	background: #F5F5F5;
	height: 100%;
	width: 100%;
	font-size: 26px;
	letter-spacing: 2px;
}
/* Dropdown Button */
.custom-select {
	position: relative;
	font-family: Arial;
	width: 100%;
	height: 200px;
	font-size: 45px;
	background-color: #F5F5F5;
}

.custom-select select {
	display: none; /*hide original SELECT element:*/
}

.select-selected {
	background-color: #F5F5F5;
}

/*style the arrow inside the select element:*/
.select-selected:after {
	position: absolute;
	content: "";
	top: 14px;
	right: 10px;
	width: 0;
	height: 0;
	border: 6px solid transparent;
	border-color: #fff transparent transparent transparent;
	color: black;
}
/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
	border-color: transparent transparent #fff transparent;
	top: 7px;
}
/*style the items (options), including the selected item:*/
.select-items div, .select-selected {
	color: Black;
	text-align: center;
	padding: 8px 16px;
	border: 1px solid transparent;
	border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
	cursor: pointer;
}
/*style items (options):*/
.select-items {
	position: absolute;
	background-color: #F5F5F5;
	color: Black;
	top: 50;
	left: 0;
	right: 0;
	z-index: 99;
}
/*hide the items when the select box is closed:*/
.select-hide {
	display: none;
}

.select-items div:hover, .same-as-selected {
	background-color: rgba(0, 0, 0, 0.1);
}
input[type="image"]{
	width: 60%;
	padding-left: 200px;
	padding-right: 200px;
}

</style>

<body>
	<form action="${pageContext.servletContext.contextPath}/setdeliverymethod" method="post">
		
		<input type="image" src="https://i.imgur.com/dLIBIxO.png" alt="Pickup" name="deliverypref" value="false">
		<input type="image" src="https://i.imgur.com/gVDArzF.png" alt="Delivery" name="deliverypref" value="true">
				
		<div class="custom-select">
			<select name="deliveryDest">
				<option value="DeliveryDestinations">Destinations
				<option value="Beard Hall">Beard Hall
				<option value="Penn Hall">Penn Hall
				<option value="Susquehana Hall">Susquehana Hall
				<option value="Manor Hall">Manor Hall
				<option value="Tyler Run Appt">Tyler Run Appt
				<option value="Northside Commons">Northside Commons
				<option value="Little Run Lodge">Little Run Lodge
				<option value="Richland Hall">Richland Hall
				<option value="Brockie Commons">Brockie Commons
				<option value="Spring Garden Appt">Spring Garden Appt
				<option value="Country Club Manor">Country Club Manor
			</select>
		</div>
		<script> /* script pulled from https://www.w3schools.com/howto/howto_custom_select.asp */
			var x, i, j, selElmnt, a, b, c;
			/*look for any elements with the class "custom-select":*/
			x = document.getElementsByClassName("custom-select");
			for (i = 0; i < x.length; i++) {
				selElmnt = x[i].getElementsByTagName("select")[0];
				/*for each element, create a new DIV that will act as the selected item:*/
				a = document.createElement("DIV");
				a.setAttribute("class", "select-selected");
				a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
				x[i].appendChild(a);
				/*for each element, create a new DIV that will contain the option list:*/
				b = document.createElement("DIV");
				b.setAttribute("class", "select-items select-hide");
				for (j = 1; j < selElmnt.length; j++) {
					/*for each option in the original select element,
					create a new DIV that will act as an option item:*/
					c = document.createElement("DIV");
					c.innerHTML = selElmnt.options[j].innerHTML;
					c
							.addEventListener(
									"click",
									function(e) {
										/*when an item is clicked, update the original select box,
										and the selected item:*/
										var y, i, k, s, h;
										s = this.parentNode.parentNode
												.getElementsByTagName("select")[0];
										h = this.parentNode.previousSibling;
										for (i = 0; i < s.length; i++) {
											if (s.options[i].innerHTML == this.innerHTML) {
												s.selectedIndex = i;
												h.innerHTML = this.innerHTML;
												y = this.parentNode
														.getElementsByClassName("same-as-selected");
												for (k = 0; k < y.length; k++) {
													y[k]
															.removeAttribute("class");
												}
												this.setAttribute("class",
														"same-as-selected");
												break;
											}
										}
										h.click();
									});
					b.appendChild(c);
				}
				x[i].appendChild(b);
				a.addEventListener("click", function(e) {
					/*when the select box is clicked, close any other select boxes,
					and open/close the current select box:*/
					e.stopPropagation();
					closeAllSelect(this);
					this.nextSibling.classList.toggle("select-hide");
					this.classList.toggle("select-arrow-active");
				});
			}
			function closeAllSelect(elmnt) {
				/*a function that will close all select boxes in the document,
				except the current select box:*/
				var x, y, i, arrNo = [];
				x = document.getElementsByClassName("select-items");
				y = document.getElementsByClassName("select-selected");
				for (i = 0; i < y.length; i++) {
					if (elmnt == y[i]) {
						arrNo.push(i)
					} else {
						y[i].classList.remove("select-arrow-active");
					}
				}
				for (i = 0; i < x.length; i++) {
					if (arrNo.indexOf(i)) {
						x[i].classList.add("select-hide");
					}
				}
			}
			/*if the user clicks anywhere outside the select box,
			 then close all select boxes:*/
			document.addEventListener("click", closeAllSelect);
		</script>
	
		
	</form>
</body>
</html>
