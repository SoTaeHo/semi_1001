	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Dancing+Script:wght@600&family=Dongle&family=Edu+VIC+WA+NT+Beginner:wght@500&family=Gamja+Flower&family=Indie+Flower&family=Jua&family=Merriweather:ital@1&family=Nabla&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Palanquin:wght@200&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
	.title{
		width: 1900px;
		text-align: center;
		display: flex;
		/*position: fixed;*/
		background-color: white;
		margin: 0 auto;
		vertical-align: middle;
		/*background-color: #38B6FF;*/
	}

	.logo {
		width: 150px;
		height: 150px;
		margin-left: 50px;
	}

	.logo img{
		width: 150px;
		height: 150px;
	}

	.menu{
		width: 40%;
		margin: 0 auto;
		text-align: center;
		font-weight: bold;
	}

	.menu1{

	}
	.menu a{
		margin-left: 20px;
		margin-right: 20px;
		text-decoration: none;
		color: black;
		cursor: pointer;
	}

	.menu a:hover{
		text-shadow: 10px 10px 10px black;
		color: black;
		cursor: pointer;
	}

	.search_bar{
		width: 450px;
	}

	.search1{
		width: 20%;
		height: 15px;
		margin-top: 40px;
	}

	div.search1 .sel1{
		width: 90px;
		font-size: 13px;
		color: gray;
	}

	div.search1 .op1{
		width: 90px;
		font-size: 15px;
		color: black;
	}

	div.search1 .in1{
		width: 250px;
		font-size: 12px;
	}
	div.search1 .btn1{
		width: 40px;
	}

	.myinfo{
		margin-left: 20px;
		font-weight: bold;
	}

	.myinfo a{
		text-decoration: none;
		margin-left: 20px;
		margin-right: 20px;
		color: black;
		font-size: 12px;
	}

	.myinfo a:hover{
		color: black;
		cursor: pointer;
		text-shadow: 10px 10px 10px black;
	}

	.my1{
		float: right;
		width: 300px;
		text-align: center;
	}
	/* ????????? ?????? */
	/*#loginstate{
		position: absolute;
		right: 100px;
		width: 100px;
		height: 150px;
	}*/

	#btnlogin {
		right: 50px;
		top: auto;
		font-size: 12px;
	}

	#loginstate>b{
		height: 20px;
		right: 50px;
	}

	#btnlogout {
		right: 50px;
		font-size: 12px;
	}

</style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>" />
<div class="title">
		<div class="logo">
			<a href="${root}/"><img src="${root}/image/logo1.jpg"></a>
		</div>
		<div class="menu">
			<div class="input-group menu1">
				<a href="${root}/qna/list">????????????</a>
				<a href="${root}/courseboard/list">?????? ??????</a>
				<a href="${root}/findboard/list">?????? ??????</a>
				<a href="${root}/board/list">?????????</a>
				<a href="${root}/board/form">?????? ??????</a>
				<a href="${root}/help/map?user_num=${sessionScope.user_num}">?????? ??????</a>
			</div>
		</div>
		<div class="search_bar">
			<div class="input-group search1">
				<select class="form-control sel1">
					<option selected disabled hidden class="op1">????????? ??????</option>
					<option class="op1">?????? ??????</option>
					<option class="op1">?????? ??????</option>
				</select>
				<input type="text" class="form-control in1" placeholder="????????? ????????? ??????????????? ?????????">
				<button class="form-control btn1"><i class='fas fa-search'></i></button>
			</div>
		</div>
		<div class="myinfo">
			<div class="input-group my1">
				<a href="#">???????????????</a>
				<a href="${root}/user/userlist">????????????</a>
				<a href="${root}/user/userform">????????????</a>
				<a href="${root}/user/userlogin">?????????</a>
			</div>
		</div>

<%--	<span id="loginstate">
		<c:if test="${sessionScope.loginok==null}">
			<a href="${root}/user/userlogin">?????????</a>
		</c:if>
		<c:if test="${sessionScope.loginok!=null}">
			<b>${sessionScope.loginname}???</b>
			<a href="${root}/user/userlogin">????????????</a>
		</c:if>
	</span>--%>
	<!-- ???????????? -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">?????? ?????????</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">?????????</span>
						<input type="text" class="form-control" id="loginid">
					</div>

					<div class="input-group mb-3 input-group-sm" style="font-family: Jua;">
						<span class="input-group-text">????????????</span>
						<input type="password" class="form-control" id="loginpass">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnloginok">?????????</button>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- ???????????? ????????? -->
	<script type="text/javascript">
		//???????????? ?????? ????????? ??????
		$("#btnloginok").click(function(){
			//???????????? ?????? ??????
			var id=$("#loginid").val();
			// console.log(id);
			var pass=$("#loginpass").val();
			// console.log(pass);
			var root='${root}';

				console.log("root"+root);
				$.ajax({
					type:"get",
					url:root+"/user/login",
					dataType:"json",
					data:{"loginid":id,"password":pass},
					success:function(res){			
						if(res.result=='fail'){
							alert("???????????? ????????? ?????? ????????????");
						}else{
							alert("????????? ???????????????.");
							location.reload();
						}
					}//success
					
				}); //ajax
		});
		
		//????????????
		$("#btnlogout").click(function(){
			var root='${root}';
			$.ajax({
				type:"get",
				url:root+"/user/logout",
				dataType:"text",
				success:function(res){
					alert("???????????? ???????????????.")
					location.reload();
					
				}//success
				
			});//ajax
		});

	</script>

</body>
</html>