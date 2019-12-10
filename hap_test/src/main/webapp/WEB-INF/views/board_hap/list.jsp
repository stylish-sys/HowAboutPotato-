<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>업소목록</title>
  
  <style type="text/css">
  
  table,.td{
  	border : 1px solid black;
  }
  table{
  	width : 100%;
  	heigth : 100px;
  	margin : auto;
  	text-align : center;
  	text-valign : middle;
  }
  
  </style>
  
  <script type="text/javascript">
  function read(board_num){
	  var url = "${pageContext.request.contextPath}/board_hap/read";
	  url += "?board_num=" + board_num;
	  url += "&col=${col}";
 	  url += "&word=${word}";
	  url += "&nowPage=${nowPage}";
	  location.href = url;
  }
  
  
  </script>

</head>
<body>
<div class="container">
 <h2 class = "col-sm-offset-2 col-sm-10">업소목록</h2>
 <br>
  <form class = "form" method = "post" action ="list">
  
  
   <div class = "form-group">
   	<select name = "col" class = "form-control">
   	 <option value = "board_name"
   	 <c:if test="${col==board_name}">selected</c:if>
   	 >업소명</option>
   	 
   	</select>
   </div>
   
   <div class = "form-inline">
   <input type = "text" class = "form-control" name = "word" required = "required" value = "${word }">
   </div>
   
   <button class = "btn">검색</button>
   
<%-- 	<c:if test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">  --%>
   		<button class = "btn" type ="button" onclick = "location.href='${pageContext.request.contextPath}/board_hap/create'">업소등록</button>
<%--    </c:if> --%>
   
   
  
  </form>
  

<c:forEach var="dto" items="${list }">

	<table>
			<th>사진</th><!-- 여러장 넣기-->
			<th>업소명</th>
			<th>업소번호</th>
			<th>조회수</th>
			<th>주소</th>
	 <tr>
	 	<td rowspan = "2" class = col-sm-2>
	   <img src = "${pageContext.request.contextPath}/storage/${dto.board_filename}" class = "img-rounded "width = "100px" height = "100px"
	   onclick = "javascript:read('${dto.board_num}')">
	 </td>
	 	 <!-- 세로 가운데정렬 -->
	  	 <td class = "col-sm-4">${dto.board_name}</td>
	  	 <td class = "col-sm-4">${dto.board_num}</td>
	  	 <td class = "col-sm-4">${dto.board_cnt}</td>
	  	 <td class = "col-sm-4">${dto.board_address1 }   ${dto.board_address2 }</td>
	 </tr>
	 
	 
	 
	 <!-- admin만 -->
<%-- 	 <c:if test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }"> --%>
	 <button class = "btn" onclick = "location.href='${pageContext.request.contextPath}/board_hap/delete?board_num=${dto.board_num }'">업소 삭제</button>
	 <button class = "btn" onclick = "location.href='${pageContext.request.contextPath}/board_hap/update?board_num=${dto.board_num }'">업소 정보수정</button>
	 <button class = "btn" onclick = "location.href='${pageContext.request.contextPath}/board_hap/updateFile?board_num=${dto.board_num }&oldfile=${dto.board_filename }'">업소 사진수정</button>
	 <br>
<%-- 	 </c:if> --%>
	  <!-- admin만 -->
 

	   </table>
	   
	   </c:forEach>

${paging }



</div>

</body>
</html>