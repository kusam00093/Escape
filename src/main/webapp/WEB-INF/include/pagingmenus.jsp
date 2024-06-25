<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

   <table id="posting">
	  <c:forEach var="posting" items="${ postingList }">
	    <td>
	      <a href="/Board/Boardhome?id=${ sessionScope.login.id }&nowpage=${nowpage}">
	      <!--  ${ posting.board_idx }  -->
	      </a> 
	     </td>
	  </c:forEach>
   </table>	  
   
   
   
   
   
   
   
     