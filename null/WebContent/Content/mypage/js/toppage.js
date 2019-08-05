$(document).ready(function(){
	$("#gomyinfo").on("click",function(){
		$(location).attr("href","/null/Content/mypage/modifyaccountcheck.jsp");
	});
	$("#goaddrinfo").on("click",function(){
		$(location).attr("href","/null/AddrListServlet");
	});
});


