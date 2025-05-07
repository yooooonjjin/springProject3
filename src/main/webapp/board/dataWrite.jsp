<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>업로드 게시판 등록 화면</title>
		<link rel="stylesheet" href="../css/style.css">
		<link rel="stylesheet" href="../css/jquery-ui.css">
  		<script src="../js/jquery-3.7.1.js"></script>
  		<script src="../js/jquery-ui.js"></script>

		<script>
			$(function() {
				
				$("#btn_list").click(function(){
					location="/dataList";
				});
				
				$("#btn_submit").click(function() {
					
					let title = $("#title").val();
					title = $.trim(title);
					$("#title").val(title);
					
					let pass = $("#pass").val();
					pass = $.trim(pass);
					$("#pass").val(pass);
					
					if( title == "" ) {
						alert("제목을 입력해주세요.")
						$("#title").focus();
						return false;
					}
					if( pass == "" ) {
						alert("암호를 입력해주세요.")
						$("#pass").focus();
						return false;
					}
					
					// let form = $("#frm").serialize();
					// (파일) 전송을 위한 폼 설정
					let form = new FormData(document.getElementById('frm'));
					
					$.ajax({
						type : "post",
						url  : "/dataBoardInsert",
						data : form,
						
						processData: false,	// 전송데이터의 인식을 위한 세팅
						contentType: false,	// 전송데이터의 인식을 위한 세팅
						
						dataType : "text",
						success  : function(data){
							if( data == "ok" ) {
								alert("저장 완료!");
								location ="/dataList";
							} else {
								alert("저장 실패!");
							}
						},
						error : function() {
							alert("전송 실패!")
						}
						
					});

				});
				
			});
  		
  		
		</script>

	</head>


	<body>
		<div class="div_title">
			업로드 게시판 등록
		</div>
		<form id="frm" enctype="multipart/form-data">
			<table class="table1">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr class="table_title">
					<th><label for="title">제목</label></th>
					<td><input type="text" id="title" name="title" class="input1 input_border" placeholder="제목입력" autofocus></td>
				</tr>
				<tr>
					<th><label for="pass">암호</label></th>
					<td><input type="password" id="pass" name="pass" class="input1 input_border" maxlength="30"  placeholder="암호입력"></td>
				</tr>
				<tr>
					<th><label for="writer">글쓴이</label></th>
					<td><input type="text" id="writer" name="writer" class="input1 input_border"></td>
				</tr>
				<tr>
					<th><label for="content">내용</label></th>
					<td><textarea id="content" name = "content" class="textarea1 textarea_border"></textarea></td>
				</tr>
				<tr>
					<th><label for="file">파일</label></th>
					<td style="display: flex; flex-wrap: wrap; gap: 7px;">
						<input type="file" id="myfile1" name="myfile1">
						<input type="file" id="myfile2" name="myfile2">
						<input type="file" id="myfile3" name="myfile3">
					</td>
				</tr>
			</table>
			
			
			<div class="div_button_area">
		    	<button type="submit" id="btn_submit" onClick="return false;">저장</button>
		    	<button type="reset">취소</button>
		    	<button type="button" id="btn_list" >목록</button>
			</div>
			
		</form>
	
	</body>
</html>