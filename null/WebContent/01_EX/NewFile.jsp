<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#horizentalBar div {
	float: left;
}

.style-mid_menu> div{
	width:150px;	
	line-height: 36px;
	margin: 0px;
	
	text-align: center;
	
	position: relative;
}
.style-mid_menu>.item >div{
	display:none;	
}
.style-mid_menu>.active >div{
	display:block;
	position:absolute;
	top:100%;
	left:-30%;
	
	width:160%;
	height:300%;
	border: 1px red solid;
}
</style>
<div id="horizentalBar">
	<hr style="border: solid 1px red;">
	<div>
		<a href="#" class="btn_menu_all">카테고리</a>
		<div class="view_all_menu"></div>
	</div>
	<div class="style-mid_menu">
		<div class="item">
			<a href="/null/MainServlet">운동화</a><br>
			<div>안녕하신감</div>
		</div>
	</div>
	<hr style="border: solid 1px gray;">
</div>
<script>
	$(".style-mid_menu a").on("mouseover", function() {
							  $(this).parent("div").toggleClass("active");
						  })
						  .on("mouseout",function(){
							  $(this).parent("div").toggleClass("active");
						  })
</script>
