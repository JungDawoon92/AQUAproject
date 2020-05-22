<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="client.member.db.*"%>
<%
	MemberBean member=(MemberBean)request.getAttribute("member");
	String id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./client/css/member.css" />
<title>마이 페이지</title>
	<script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"></script>
      <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
$(function(){
	$('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,''));
        }
    });
	
	$("#pass").keyup(function(event){
		var pass=$("#pass").val();
		var reg=/^.{8,20}$/;
		if(reg.test(pass)){
			$("#passRegErr").hide();
			successState("#pass");
		}else{
			$("#passRegErr").show();
			errorState("#pass");
		}
	});
	
	$("#passTest").keyup(function(event){
        var passTest=$("#passTest").val();
        var pass=$("#pass").val();
        if(passTest==pass){
            $("#testPassErr").hide();
            successState("#passTest");
        }else{
            $("#testPassErr").show();
            errorState("#passTest");
        }
    });
	
    $("#email").keyup(function(event){
        var email=$("#email").val();
        var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(reg.test(email)){
			$("#emailErr").hide();
            successState("#email");
        }else{
            $("#emailErr").show();
			errorState("#email");
        }
    });
    
    $("#name").keyup(function(event){
    	var name=$.trim($("#name").val());
    	if(name!=""){
    		$("#nameErr").hide();
    		successState("#name");
    	}else{
    		$("#nameErr").show();
    		errorState("#name");
    	}
    });
    
    $("#birth").keyup(function(event){
    	var birth=$.trim($("#birth").val());
    	if(birth!=""){
    		$("#birthErr").hide();
    		successState("#birth");
    	}else{
    		$("#birthErr").show();
    		errorState("#birth");
    	}
    });
    
    $("#phone").keyup(function(event){
    	var phone=$.trim($("#phone").val());
    	if(phone!=""){
    		$("#phoneErr").hide();
    		successState("#phone");
    	}else{
    		$("#phoneErr").show();
    		errorState("#phone");
    	}
    });
    
    $("#address").keyup(function(event){
    	var address=$.trim($("#address").val());
    	if(address!=""){
    		$("#addressErr").hide();
    		successState("#address");
    	}else{
    		$("#addressErr").show();
    		errorState("#address");
    	}
    });
    
    function successState(sel){
        $(sel)
        .parent()
        .removeClass("has-error")
        .addClass("has-success")
        .find(".glyphicon")
        .removeClass("glyphicon-remove")
        .addClass("glyphicon-ok")
        .show();
 
        $("#joinform input[type=submit]")
			.removeAttr("disabled");
    };

    function errorState(sel){
        $(sel)
        .parent()
        .removeClass("has-success")
        .addClass("has-error")
        .find(".glyphicon")
        .removeClass("glyphicon-ok")
        .addClass("glyphicon-remove")
        .show();
 
        $("#joinform input[type=submit]")
        	.attr("disabled","disabled");
    };
	
});
</script>

    <script type="text/javascript">
    function captureReturnKey(e) { 
        if(e.keyCode==13 && e.srcElement.type != 'textarea') 
        return false; 
    } 
    
    function check_onclick() {
    	theForm = document.modifyform
    	
    	if(theForm.pass.value==""){
    		alert("비밀번호가 비어있습니다. 확인해주세요.");
    		theForm.pass.focus();
    		return false;
    	}else if(theForm.PASStest.value==""){
    		alert("비밀번호 재확인이 비어있습니다. 확인해주세요.");
    		theForm.PASStest.focus();
    		return false;
    	}else if(theForm.pass.value != theForm.PASStest.value){
    		alert("입력하신 비밀번호와 비밀번호 재입력이 다릅니다.");
    		theForm.PASStest.focus();
    		return false;
    	}else if(theForm.name.value==""){
    		alert("이름이 비어있습니다. 확인해주세요.");
    		theForm.name.focus();
    		return false;
    	}else if(theForm.birthday.value==""){
    		alert("생년월일이 비어있습니다. 확인해주세요.");
    		theForm.birthday.focus();
    		return false;
    	}else if(theForm.email.value==""){
    		alert("이메일이 비어있습니다. 확인해주세요.");
    		theForm.email.focus();
    		return false;
    	}else if(theForm.phone.value==""){
    		alert("전화번호가 비어있습니다. 확인해주세요.");
    		theForm.phone.focus();
    		return false;
    	}else if(theForm.addr.value==""){
    		alert("주소가 비어있습니다. 확인해주세요.");
    		theForm.addr.focus();
    		return false;
    	}else{
    		return true;
    		document.modifyform.submit();
    	}

    }
    </script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<jsp:include page="/client/include/nav.jsp"></jsp:include>
    <div class="container">
    <h2 title="마이페이지" alt="마이페이지 보기" class="maintitle">마이 페이지</h2>
    <h3 title="내 정보 수정" alt="내 정보 수정 페이지">내 정보 수정</h3>
    <div class="container">
 	<form role="form" class="form-horizontal" id="modifyform" name="modifyform" 
 	 action="./MemberModifyAction.me" method="post" onsubmit="return check_onclick()" onkeydown="return captureReturnKey(event)">
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="id" title="아이디" alt="아이디 표시" >아이디:</label>
		<div class="col-sm-9">
			<input class="form-control onlyAlphabetAndNumber"
			 type="text" name="id" value="<%= member.getId() %>" 
			 title="아이디" alt="현재 아이디 <%= member.getId() %> 변경불가 란"  disabled />
		</div>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="pass" title="비밀번호" alt="비밀번호 표시" >비밀번호:</label>
		<div class="col-sm-9">
			<input class="form-control onlyAlphabetAndNumber" type="password" id="pass" name="pass" title="비밀번호" alt="비밀번호 입력란" />
			<span id="passRegErr" class="help-block" style="display:none;" title="사용불가" alt="특수문자와 한글이 아닌 8글자 이상 20자 미만으로 입력하세요" >특수문자('_' 제외)와 한글이 아닌 8글자 이상 20자 미만으로 입력하세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="passtest" title="비밀번호 재확인" alt="비밀번호 재확인 표시" >비밀번호 재확인:</label>
		<div class="col-sm-9">
			<input class="form-control" type="password" id="passTest" name="PASStest" title="비밀번호 재확인" alt="비밀번호 재확인 입력란" />
			<span id="testPassErr" class="help-block" style="display:none;" title="불일치" alt="비밀번호와 일치하지 않습니다" >비밀번호와 일치하지 않습니다.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="name" title="이름" alt="이름 표시" >이름:</label>
		<div class="col-sm-9">
			<input class="form-control" type="text" id="name" name="name" value="<%= member.getName() %>" title="이름" alt="현재 이름 <%= member.getName() %> 이름 입력란" />
			<span id="nameErr" class="help-block" style="display:none;" title="미입력" alt="이름을 입력해주세요" >이름을 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="gender" title="성별" alt="성별 체크 표시" >성별:</label>
		<div class="col-sm-4">
			<input type="radio" id="gen" name="gen" value="남" title="남자" alt="남자에 체크" <% if(member.getGen().equals("남")){ %>checked <% } %>/>남자
		</div>
		<div class="col-sm-4">
			<input type="radio" id="gen" name="gen" value="여" title="여자" alt="여자에 체크" <% if(member.getGen().equals("여")){ %>checked <% } %>/>여자
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="birthday" title="생년월일" alt="생년월일 표시" >생년월일:</label>
		<div class="col-sm-9">
			<input class="form-control" type="date" id="birth" name="birthday" value="<%= member.getBirthday() %>" min="1900-01-01" max="${today}" title="생년월일" alt="현재 생년월일 <%= member.getBirthday() %> 생년월일 입력란" />
			<span id="birthErr" class="help-block" style="display:none;" title="미입력" alt="생년월일을 입력해주세요" >생년월일을 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="email" title="이메일" alt="이메일 표시" >이메일:</label>
		<div class="col-sm-9">
			<input class="form-control" type="email" id="email" name="email" value="<%= member.getEmail() %>" title="이메일" alt="현재 이메일 <%= member.getEmail() %> 이메일 입력란" />
			<span id="emailErr" class="help-block" style="display:none;" title="사용불가" alt="올바른 이메일 형식이 아닙니다" >올바른 이메일 형식이 아닙니다.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="phone" title="전화번호" alt="전화번호 표시" >전화번호:</label>
		<div class="col-sm-9">
			<input class="form-control" type="tel" id="phone" name="phone" placeholder="(-)빼고 입력" value="<%= member.getPhone() %>" title="전화번호" alt=" 현재 전화번호 <%= member.getPhone() %> 전화번호 입력란 (-)빼고 입력" />
			<span id="phoneErr" class="help-block" style="display:none;" title="미입력" alt="전화번호를 입력해주세요" >전화번호를 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="address" title="주소" alt="주소 표시" >주소:</label>
		<div class="col-sm-9">
			<input class="form-control" type="text" id="address" name="addr" value="<%= member.getAddr() %>" title="주소" alt="현재 주소 <%= member.getAddr() %> 주소 입력란" />
			<span id="addressErr" class="help-block" style="display:none;" title="미입력" alt="주소를 입력해주세요" >주소를 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback" style="display:none;"></span>
		</div></div>
		<div class="form-group">
			<div class="col-sm-12">
				<input type="submit" id="submit" class="submit" value="수정완료" title="수정완료" alt="수정완료 버튼" />
		</div></div>
		<div class="form-group">
			<div class="col-sm-12">
				<input type="button" class="retry" onclick="location.href='javascript:modifyform.reset()'" value="다시작성" title="다시작성" alt="다시작성 버튼" />
		</div></div>
	</form>
	</div>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>