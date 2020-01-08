<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>사진수정</title>

</head>
<body>
 
<div class="container">
<h1 class = "col-sm-offset-2 col-sm-10">사진수정</h1>
  <form class="form-horizontal" action="updateFile" method = "post" enctype = "multipart/form-data">
  
   <input type = "hidden" name = "oldfile" value = "${param.oldfile }">
   <input type = "hidden" name = "room_num" value = "${param.room_num }">
   <input type = "hidden" name = "board_num" value = "${param.board_num }">
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="oldfile">원본파일</label>
      <div class="col-sm-6">
       <img src = "${pageContext.request.contextPath }/images/${param.oldfile}" class = "img-rounded" width = "400px" height = "400px">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="board_filenameMF">변경파일:</label>
      <div class="col-sm-6">          
        <input type="file" class="form-control" id="board_filenameMF" name="board_filenameMF" accept = ".jpg,.png,.gif" required="required">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn">수정</button>
        <button type="button" class="btn" onclick = "history.back()">취소</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>