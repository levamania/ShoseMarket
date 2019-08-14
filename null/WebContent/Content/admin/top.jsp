<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#top_body{
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100px;
		border-bottom: 1px solid red;
	}
	#welcome{
		display: inline;
		position: fixed;
		right: 0;
		top:70px;
	}
	
	@media (max-width:650px){
	#top_body{
		top: 100px;
		height: 120px;
	}
	#welcome{
		top:100px;
	}
}
</style>

<div id="top_body">
	<img src="/null/Content/img/account/NULL-Mart(LOGO).PNG"> 
</div>
<div id="welcome">
	<div style="display: inline-block; width: 200px;">~係員のページ.</div>
</div>

