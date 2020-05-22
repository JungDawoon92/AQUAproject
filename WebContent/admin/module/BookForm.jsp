<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<button type="button" class="modalbtn" id="modal-btn" onclick="document.getElementById('modal-div').style.display='block'"></button>
	<div id="modal-div" class="modal">
	   <div class="container modal-content">
	   <h1 id="msg"></h1>
	   <button type="button" class="btn btn-danger" id="cancel-btn">Cancel</button>
	   </div>
	</div>
	
	
	<div class="container">
	 <div class="row">
	  <h2 id="h2-form">form</h2>
		<form id="book-form" class="bookform" action="./BookAddAction.ady" name="book_form" method="post" >
	
		<div class="form-group row" id="pno-div">
	      <label class="control-label col-xs-4 col-sm-1" for="pno">번호 :</label>
	      <div class="col-xs-6">
	        <input type="text" class="form-control" id="pno" placeholder="Only Read" name="pno" readonly="readonly">
	      </div>
	    </div>
	    <div class="form-group row" id="id-div">
	      <label class="control-label col-xs-4 col-sm-1" for="id">ID :</label>
	      <div class="col-xs-6">
	        <input type="text" class="form-control" id="id" placeholder="Enter Id" name="id" required="required">
	      </div>
	    </div>
	    <div class="form-group row" id="no-div">
		      <label class="control-label col-xs-4 col-sm-1" for="no">상품번호 :</label>
		      <div class="col-xs-6">
		        <input type="number" class="form-control" id="no" placeholder="Enter no" name="no" min="0" required="required">
		      </div>
		</div>
	    <div class="form-group row" id="categ-div">
	    	<label class="control-label col-xs-4 col-sm-1" for="categ">카테고리 :</label>
	    	<div class="col-xs-6">
	    	</div>
		</div>
		<div class="form-group row" id="i_name-div">
	      <label class="control-label col-xs-4 col-sm-1" for="i_name">상품이름 :</label>
	      <div class="col-xs-6">
	      </div>
	    </div>
	    <div class="form-group row" id="cnt-div">
	      <label class="control-label col-xs-4 col-sm-1" for="cnt" >수량 :</label>
	      <div class="col-xs-6">
	        <input type="number" class="form-control num" id="cnt" placeholder="Enter cnt" name="cnt" min="1" max="100" required="required">
	      </div>
	    </div>
	    <div class="form-group row" id="price-div">
	      <label class="control-label col-xs-4 col-sm-1" for="price">가격 :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    <div class="form-group row" id="st-date-div">
	      <label class="control-label col-xs- col-sm-1" for="st-date">출발날짜 :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    <div class="form-group row" id="ed-date-div">
	      <label class="control-label col-xs-4 col-sm-1" for="ed-date">도착날짜 :</label>
	      <div class="col-xs-6">
	      </div>
	    </div>
		<div class="form-group row" id="up-date-div">
	      <label class="control-label col-xs-4 col-sm-1" for="up-date">구매날짜 :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    <div class="form-group row" id="member-name-div">
	      <label class="control-label col-xs-4 col-sm-1" for="member-name">회원이름 :</label>
	      <div class="col-xs-6">
	      </div>
	    </div>
	    <div class="form-group row" id="birthday-div">
	      <label class="control-label col-xs-4 col-sm-1" for="birthday">생년월일 :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    <div class="form-group row" id="gender-div">
	      <label class="control-label col-xs-4 col-sm-1" for="gender">성별 :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    <div class="form-group row" id="email-div">
	      <label class="control-label col-xs-4 col-sm-1" for="email">email :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    <div class="form-group row" id="phone-div">
	      <label class="control-label col-xs-4 col-sm-1" for="phone">휴대폰 :</label>
	      <div class="col-xs-6">          
	      </div>
	    </div>
	    
		<div class="row"> 
	       <div class="col-xs-7">
	          <button type="submit" class="btn btn-default" id="add-btn" >확인</button>
	          <button type="button" class="btn btn-default" id="list-btn">목록</button>
	          <button type="reset" class="btn btn-default" id="reset-btn" >리셋</button>
	       </div>
	    </div>
	    </form>
	    </div>
	</div>
<script type="text/javascript">

window.onclick = function(event) {
	var modal = document.getElementById('modal-div');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

document.getElementById("cancel-btn").onclick = function () {
	var modal = document.getElementById('modal-div');
	modal.style.display='none';
}

$(window).ready(function () {
	<c:if test="${notAdminError eq 'trueError' }" >
		$("#msg").text("관리자 권한이 없습니다.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dateInputError eq 'trueError' }" >
		$("#msg").text("날짜 등록 에러(출발 날짜가 도착날짜가 큽니다.)");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dataInsertError eq 'trueError' }" >
		$("#msg").text("데이터 등록 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dataUpdateError eq 'trueError'}">
		$("#msg").text("데이터 수정 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${deleteError eq 'trueError'}">
		$("#msg").text("삭제 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${selectError eq 'trueError'}">
		$("#msg").text("찾으려는 데이터가 없습니다.");
		$("#modal-btn").trigger("click");
	</c:if>
})
</script>