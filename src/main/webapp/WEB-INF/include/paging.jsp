<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
  
  <c:set  var="board_idx"            value="${ posting.board_idx           }" /> 
  <c:set  var="startnum"           value="${ searchVo.pagination.startPage         }" /> 
  <c:set  var="endnum"             value="${ searchVo.pagination.endPage           }" /> 
  <c:set  var="totalpagecount"     value="${ searchVo.pagination.totalPageCount  }" /> 
<!--  
  <div id="paging" style="margin: 20px 0px; border:0px solid black;">
    <table style="width:40%;height:25px;text-align:center"  >
     <tr>
       <td style="width:60%;height:25px;text-align:center;display:flex; justify-content:space-between;margin-left:94.7%;" >
     <!-- 처음/ 이전 -->     
     <!-- 
    <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=1">⏮</a>
     <c:if test="${ startnum gt 1 }">
     <div>
       <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=1"> </a>
       <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ startnum - 1 }"> </a>
       </div>
     </c:if>
     <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ startnum - 1 }">⏪ </a>
     <!-- 1 2 3 4 5 6 [7] 8 9 10  -->
     <!-- 
     <c:forEach  var="pagenum"  begin="${startnum}"  end="${endnum}"  step="1">
        <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ pagenum }">
        ${ pagenum }
        </a>    
     </c:forEach>    
     
     <!-- 다음 / 마지막 -->
     <!-- 
      <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ endnum + 1 }">⏩</a>
     <c:if test="${ totalpagecount ne endnum }">
       <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ endnum + 1 }">
       </a>
       <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ totalpagecount }"></a>
     </c:if> 
     <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ totalpagecount }">⏭</a>   
      </td>
     </tr>    
    </table>   
  </div>
  
  -->
<nav aria-label="Page navigation example" style="margin: 20px 0px;">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ nowpage - 1 }" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
<c:forEach  var="pagenum"  begin="${startnum}"  end="${endnum}"  step="1">
    <li class="page-item"><a class="page-link" href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ pagenum }">${ pagenum }</a></li></c:forEach> 

    <li class="page-item">
      <a class="page-link" href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${ endnum + 1 }">Next</a>
    </li>
  </ul>
</nav>
  
  
  
  
  
  
  