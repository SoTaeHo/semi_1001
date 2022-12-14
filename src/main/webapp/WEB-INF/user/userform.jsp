<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet"
    >
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style type="text/css">
        div.usermain{
            position: absolute;
            margin: -100px 0px 0px -200px;
            top: 50%;
            left: 50%;
            padding: 5px;


        }
    </style>
    <script type="text/javascript">
        $(function(){
            //아이디 입력 시, .idsuccess 값 지움
            $("#loginid2").keyup(function() {
                var id = $("#loginid2").val();
                if(!id.match(/^[a-zA-Z0-9]{1,10}$/)) {
                    $("#idSuccess").text("조건에 맞게 입력해주세요");
                }
            });//아이디 지움 event

            //ajax함수는 url에서 안보임(back에서만 처리한느 함수라서)
            //중복체크 버튼 시 아이디 체크
            $("#btnidcheck").click(function() {
                $("#idSuccess").text("");
                $.ajax({
                    type:"GET",
                    dataType:"text",
                    url:"loginidcheck?loginid="+$("#loginid2").val(),
                    success:function(res){
                        console.log(res);
                        let json = JSON.parse(res);
                        console.log(json);
                        if(json.count==0){
                            $("#idSuccess").text("사용가능한 아이디입니다");
                        }else{
                            $("#idSuccess").text("이미 사용중인 아이디입니다");
                            alert("중복 아이디");
                        }
                    }//success
                });//ajax
            });//idcheck

            //아이디 유효성 체크


            //1번째 비밀번호 입력 시 체크
            $("#pass").keyup(function(){
                var p1=$("#pass").val();
                var p2=$("#pass2").val();
                if(p1==p2){
                    if(!p1.match(/^[a-zA-Z0-9]{8,20}$/)) {
                        $("#passwordSuccess").text("조건에 맞게 입력해주세요");
                    } else{
                        $("#passwordSuccess").text("사용가능한 비밀번호입니다");
                    }
                }else{
                    $("#passwordSuccess").text("비밀번호가 일치하지 않습니다");
                }
            });//pass2

            //2번째 비밀번호 입력 시 체크
            $("#pass2").keyup(function(){
                var p1=$("#pass").val();
                var p2=$(this).val();
                if(p1==p2){
                    if(!p2.match(/^[a-zA-Z0-9]{8,20}$/)) {
                        $("#passwordSuccess").text("조건에 맞게 입력해주세요");
                    } else{
                        $("#passwordSuccess").text("사용가능한 비밀번호입니다");
                    }
                }else{
                    $("#passwordSuccess").text("비밀번호가 일치하지 않습니다");
                }
            });//pass2

            $('#emailSelect').change(function (){
                let emailSelect = $('#emailSelect option:selected').val();
                $('#emailDomain').val(emailSelect);
            });

            //2번째 비밀번호 입력 시 체크
            $("#nickname").keyup(function(){
                const regex = /^[ㄱ-ㅎ|가-힣]{1,8}$/;
                var nickname = $('#nickname').val();
                if(regex.test(nickname)){
                    $('#nicknameSuccess').text("사용가능한 닉네임입니다");
                }else{
                    $('#nicknameSuccess').text("조건에 맞지 않습니다.");
                }


            });
        });//$function

        //submit 전에 호출
        function check() {
            //
            if($("#idSuccess").text()!='사용가능한 아이디입니다'){
                alert("아이디 오류");
                return false;
            }

            //비밀번호 체크 여부
            if($("#passwordSuccess").text()!='사용가능한 비밀번호입니다'){
                alert("비밀번호가 서로 다릅니다");
                return false;
            }

            if($("#nicknameSuccess").text()!='사용가능한 닉네임입니다'){
                alert("닉네임 오류");
                return false;
            }

            let email = $('#email').val();
            let emailDomain = $('#emailDomain').val();
            $('#email').val(email + emailDomain);
        }//check()

    </script>

</head>
<body>
<div class="usermain">
    <form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <table class="table table-bordered" style="width: 600px">
            <caption align="top">
                <h1 style="text-align: center;"><b>회원가입</b></h1>
            </caption>
            <tr>
                <td>
                    <div>아이디</div>
                    <div class="input-group">
                        <input placeholder="영문소문자, 숫자 10자 이내" id="loginid2" name="loginid"
                               class="form-control" style="width: 120px;" required="required">
                        <button type="button" class="btn btn-danger btn-sm"
                                id="btnidcheck">중복체크</button>
                    </div>
                    <div id="idSuccess"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>비밀번호</div>
                    <div class="input-group">
                        <input type="password" style="width: 80px; font-family: 'Jua';" class="form-control"
                               name="password" id="pass" placeholder="비밀번호 영문, 숫자 8-20자" maxlength="20"
                               required="required">

                        <input type="password" style="width: 80px; font-family: 'Jua';" class="form-control"
                               id="pass2" placeholder="비밀번호 확인" maxlength="20"
                               required="required">
                    </div>
                    <div id="passwordSuccess"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>이름</div>
                    <input type="text" name="name" class="form-control"
                           style="width: 180px;" placeholder="이름" required="required">
                </td>
            </tr>

            <tr>
                <td>
                    <div>이메일</div>
                    <div class="input-group">
                        <input  id="email" name="email" class="form-control"
                                style="width: 150px;" placeholder="이메일" required="required">
                        <input  id="emailDomain" name="emailDomain" class="form-control"
                                style="width: 150px;" required="required">
                        <select id="emailSelect">
                            <option value="">직접입력</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@daum.net">@daum.net</option>
                            <option value="@google.com">@google.com</option>
                            <option value="@nate.com">@nate.com</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>휴대폰 번호</div>
                    <div class="input-group">
                        <input type="text" name="hp" placeholder="(-) 포함해서 입력"
                               class="form-control" style="width: 200px;" required="required">

                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>닉네임</div>
                    <div class="input-group">
                        <input type="text" id="nickname" name="nickname" placeholder="닉네임"
                               class="form-control" style="width: 200px;" required="required">
                    </div>
                    <div id="nicknameSuccess"></div>
                </td>
            </tr>
            <tr>
                <td>
                    성별
                    <select type="">
                        <option>여자</option>
                        <option>남자</option>
                    </select>

                    연령대
                    <select>
                        <option>10대</option>
                        <option>20대</option>
                        <option>30대</option>
                        <option>40대</option>
                    </select>
                </td>

            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-info" style="width: 180px;">회원가입</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>