<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- memberAddModal -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div><div class="modal-body">
						<p>다시 작성하시겠습니까?</p>
					</div><div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="clear">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>

		<div class="modal fade" id="myreturn" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>작업을 취소하고 리스트로 돌아가시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="listreturn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>
		<script>
			$(document).ready(function() {
				$("#myBtn").click(function() {
					$("#myModal").modal();
				});
				$("#clear").click(function() {
					$("#userInfo").each(function() {
						this.reset();
						document.getElementById('alram').innerHTML = "";
						document.getElementById('passa').innerHTML = "";
					});
				});

				$("#return").click(function() {
					$("#myreturn").modal();
				});
				$("#listreturn").click(function() {
					location.href = './member_list.ad';
				});

			});
		</script>
		
		<!-- modal -->
		<div class="modal fade" id="cansel01" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>작업을 취소하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="check013">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>
		<script>
			$(document).ready(function() {
				$("#cansel").click(function() {
					$("#cansel01").modal();
				});
				$("#check013").click(function() {
					window.history.back();
				});
			});
		</script>

		<!-- membermodify -->
		<div class="modal fade" id="modireturn" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>작업을 취소하고 리스트로 돌아가시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="modiback">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>

		<script>
			$(document).ready(function() {
				$("#moreturn").click(function() {
					$("#modireturn").modal();
				});
				$("#modiback").click(function() {
					window.history.back();
				});
			});
		</script>
		<!-- modal -->
		<div class="modal fade" id="cansel01" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>작업을 취소하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="check01">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>

		<!-- modal -->
		<div class="modal fade" id="check001" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>현재 비밀번호를 입력해주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="check01">확인</button>
					</div></div></div></div>
					
		<!-- modal -->
		<div class="modal fade" id="check002" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>현재와 동일한 비밀번호 설정은 불가 합니다</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="check02">확인</button>
					</div></div></div></div>

		<!-- modal -->
		<div class="modal fade" id="check003" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>비밀번호를 입력하세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="check02">확인</button>
					</div></div></div></div>


		<div class="modal fade" id="check004" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>비밀번호를 변경하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="check03">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							취소</button>
					</div></div></div></div>
					
		<!-- modal -->
		<div class="modal fade" id="sendemail" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>이메일을 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="sendemail">확인</button>
					</div></div></div></div>
		<!-- modal -->
		<div class="modal fade" id="sendoverbirthday" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>생일을 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="sendoverbirthday">확인</button>
					</div></div></div></div>
					
		<!-- modal -->
		<div class="modal fade" id="sendphone" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>휴대폰 번호를 입력해주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="sendphone">확인</button>
					</div></div></div></div>
					
		<!-- modal -->
		<div class="modal fade" id="sendaddr" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>주소를 입력해주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="sendaddr">확인</button>
					</div></div></div></div>
					
		<!-- modal -->
		<div class="modal fade" id="sendmodi2" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>회원정보를 수정 하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="subsend_1">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>

		<!--modal -->
		<div class="modal fade" id="memberid" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>아이디를 입력해주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="memberid">확인</button>
					</div></div></div></div>
					
		<!--modal -->
		<div class="modal fade" id="memberid2" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>아이디 중복체크 해주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="memberid2">확인</button>
					</div></div></div></div>
					
		<!--modal -->
		<div class="modal fade" id="memberpass" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>비밀번호를 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="memberpass">확인</button>
					</div></div></div></div>
					
		<!--modal -->
		<div class="modal fade" id="membername" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>이름을 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="membername">확인</button>
					</div></div></div></div>
					
		<!--modal -->
		<div class="modal fade" id="memberaddr" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>주소를 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="memberaddr">확인</button>
					</div></div></div></div>
					
		<!--modal -->
		<div class="modal fade" id="memberbirth" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>생일을 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="memberbirth">확인</button>
					</div></div></div></div>
					
		<!--modal -->
		<div class="modal fade" id="memberemail" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>이메일을 확인해 주세요</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="memberemail">확인</button>
					</div></div></div></div>	
		<!--modal -->
		<div class="modal fade" id="sendmember" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p>회원을 추가하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="sendmembersub">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="sendcansel">취소</button>
					</div></div></div></div></div>
</body></html>