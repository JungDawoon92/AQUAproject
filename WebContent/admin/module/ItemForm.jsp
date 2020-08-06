<%@ page import="java.time.LocalDate"%>
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
	  <h2 id="h2-form">form</h2>
		<form id="item-form" class="itemform" action="./ItemAddAction.adx" enctype="multipart/form-data" name="item_form" method="post" >
			<div class="form-group row" id="no-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="no">번호 :</label>
		      <div class="col-xs-6">
		        <input type="text" class="form-control" id="no" placeholder="Only Read" name="no" readonly="readonly">
		      </div>
		    </div>
		    <div class="form-group row" id="categ-div">
		    	<label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="categ">카테고리 :</label>
		    	<div class="col-xs-6">
		    	<select class="form-control" id="categ" name="categ" required="required">
		    		<option value="spring">spring</option>
		    		<option value="summer">summer</option>
		    		<option value="autumn">autumn</option>
		    		<option value="winter">winter</option>
		    	</select>
		    	</div>
		    </div>
			<div class="form-group row" id="i_name-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="i_name">제목 :</label>
		      <div class="col-xs-6">
		        <input type="text" class="form-control" id="i_name" placeholder="Enter name" name="i_name" required="required">
		      </div>
		    </div>
		    <div class="form-group row" id="content-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="content">내용 :</label>
		      <div class="col-xs-6">      
		      	<textarea rows="10" class="form-control" id="content" placeholder="Enter content" name="content" required="required" ></textarea>
		      </div>
		    </div>
		    <div class="form-group row" id="cnt-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="cnt" >현재수량 :</label>
		      <div class="col-xs-6">
		        <input type="number" class="form-control num" id="cnt" placeholder="Enter current count" min="0" name="cnt" >
		      </div>
		    </div>
		    <div class="form-group row" id="tot-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="tot" >전체수량 :</label>
		      <div class="col-xs-6">
		        <input type="number" class="form-control num" id="tot" placeholder="Enter total" name="tot" min="0" max="100" required="required">
		      </div>
		    </div>
		    <div class="form-group row" id="price-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="price">가격 :</label>
		      <div class="col-xs-6">          
		        <input type="number" class="form-control num" id="price" placeholder="Enter price" name="price" step="100" min="0" required="required">
		      </div>
		    </div>
		    <div class="form-group row" id="st-date-div">
		      <label class="control-label col-xs- col-sm-1 col-sm-offset-2" for="st-date">출발날짜 :</label>
		      <div class="col-xs-6"> 
		        <input type="date" class="form-control datepicker" id="st-date" placeholder="Enter start_date" name="st_date" min='<%=LocalDate.now() %>' max="9999-12-21" required="required" >
		      </div>
		    </div>
		    <div class="form-group row" id="ed-date-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="ed-date">도착날짜 :</label>
		      <div class="col-xs-6">          
		        <input type="date" class="form-control datepicker" id="ed-date" placeholder="Enter end_date" name="ed_date"  min='<%=LocalDate.now() %>' max="9999-12-21" required="required" disabled="disabled">
		      </div>
		    </div>
		    <div class="form-group row" id="img-div">
		      <label class="control-label col-xs-4 col-sm-1 col-sm-offset-2" for="img">썸네일 :</label>
		      <div class="col-xs-6">          
		        <input type="file" class="form-control" id="img" placeholder="Enter thumbnail" name="img" accept="image/*" required="required">
		      </div>
		    </div>
		    <div class="form-group row" id="update-div">
		      <label class="control-label col-xs-1 col-sm-offset-2" for="up_date">업로드날짜 :</label>
		      <div class="col-xs-6">
		      </div>
		    </div>
	    <fmt:parseDate var="strPlanDate" value="${i.getSt_date() }" pattern="yyyy-MM-dd" />
		<fmt:parseNumber var="strDate" value="${strPlanDate.time / (1000*60*60*24) }" integerOnly="true" />
		<fmt:parseDate var="endPlanDate" value="${i.getEd_date() }" pattern="yyyy-MM-dd" />
		<fmt:parseNumber var="endDate" value="${endPlanDate.time / (1000*60*60*24) }" integerOnly="true" />
	
		<div class="row"> 
	       <div class="col-xs-7 col-sm-offset-2">
	          <button type="submit" class="btn btn-default" id="add-btn" >확인</button>
	          <button type="button" class="btn btn-default" id="list-btn">목록</button>
	          <button type="reset" class="btn btn-default" id="reset-btn" >리셋</button>
	       </div>
	    </div>
	    </form>
	</div>
<script type="text/javascript">

document.getElementById("img").onchange = function () {
	var reader = new FileReader();
    if(this.files[0].size>528385){
        alert("Image Size should not be greater than 500Kb");
        $("#img").attr("src","blank");     
        $('#img').wrap('<form>').closest('form').get(0).reset();
        $('#img').unwrap();     
        return false;
    }
    if(this.files[0].type.indexOf("image")==-1){
        alert("Invalid Type");
        $("#img").attr("src","blank");
        $('#img').wrap('<form>').closest('form').get(0).reset();
        $('#img').unwrap();         
        return false;
    }   
    reader.onload = function (e) {
        document.getElementById("img").src = e.target.result;
        $("#img").show(); 
    };

    reader.readAsDataURL(this.files[0]);
}


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

$("#st-date").change(function () { 
	$("#ed-date").prop("disabled", false);
	var form = document.item_form;
	var startDate = new Date(form.st_date.value);
	var endDate = new Date(form.ed_date.value);
	
	if( startDate > endDate) {
		$("#st-date").val('');
		$("#modal-div").css("display", "block");	
	}
})

$("#ed-date").change(function () {
	var form = document.item_form;
	var startDate = new Date(form.st_date.value);
	var endDate = new Date(form.ed_date.value);
	
	if( startDate > endDate) {
		$("#ed-date").val('');
		$("#msg").text("날짜 등록 에러(출발 날짜가 도착날짜보다 큽니다.)");
		$("#modal-div").css("display", "block");	
	}
})

$(window).ready(function () {
	<c:if test="${notAdminError eq 'trueError' }" >
		$("#msg").text("관리자 권한이 없습니다.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dateInputError eq 'trueError' }" >
		$("#msg").text("날짜 등록 에러(출발 날짜가 도착날짜보다 큽니다.)");
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
