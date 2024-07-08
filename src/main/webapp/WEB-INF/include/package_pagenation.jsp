<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="pagination">
    <!-- 이전 페이지 버튼 -->
    <c:if test="${pagination.existPrevPage}">
        <a href="<c:url value='/Home/Sub?nowpage=${pagination.startPage - 1}'/>
                <c:if test='${not empty param.category_idx}'>${param.category_idx}</c:if>
                <c:if test='${not empty param.keyword}'>${param.keyword}</c:if>'/>" aria-label="Previous">«</a>
    </c:if>
    
    <!-- 페이지 번호 링크 -->
    <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
        <c:choose>
            <c:when test="${pageNum == nowpage}">
                <span class="current">${pageNum}</span>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='/Home/Sub?nowpage=${pageNum}'/>
                        <c:if test='${not empty param.category_idx}'>${param.category_idx}</c:if>
                        <c:if test='${not empty param.keyword}'>${param.keyword}</c:if>'/>">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <!-- 다음 페이지 버튼 -->
    <c:if test="${pagination.existNextPage}">
        <a href="<c:url value='/Home/Sub?nowpage=${pagination.endPage + 1}'/>
                <c:if test='${not empty param.category_idx}'>${param.category_idx}</c:if>
                <c:if test='${not empty param.keyword}'>${param.keyword}</c:if>'/>" aria-label="Next">»</a>
    </c:if>
</div>