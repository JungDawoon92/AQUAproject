<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="center flex-container">
	<ul class="pager pagination">
    <li class="previous"><a href="javascript:goPage('${servletPath}', ${param.firstPageNo})" class="prev previous">FIRST</a></li>
	
    <c:if test="${param.currentPageNo ne param.firstPageNo}">
        <li><a href="javascript:goPage('${servletPath}', ${param.prevPageNo})" class="prev">Prev</a></li>
    </c:if>
    
    
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.currentPageNo}">
                           <li class="active"> <a href="javascript:goPage('${servletPath}', ${i})" class="choice link">${i}</a></li>
                </c:when>
                <c:otherwise>
                   <li><a href="javascript:goPage('${servletPath}', ${i})" class="btn-primary text-wrap">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    
    
    <c:if test="${param.endPageNo ne param.finalPageNo}">
        <li><a href="javascript:goPage('${servletPath}', ${param.nextPageNo})" class="next btn-primary text-wrap">Next</a></li>
    </c:if>
    
    <li class="next"><a href="javascript:goPage('${servletPath}', ${param.finalPageNo})" class="next">END</a></li>
	</ul>
</div>

