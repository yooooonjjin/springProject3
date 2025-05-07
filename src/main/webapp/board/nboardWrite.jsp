<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 등록 화면</title>
		<link rel="stylesheet" href="../css/style.css">
		<link rel="stylesheet" href="../css/jquery-ui.css">
  		<script src="../js/jquery-3.7.1.js"></script>
  		<script src="../js/jquery-ui.js"></script>

  		<script>
			$( function() {
				$( "#rdate" ).datepicker();
				
				$( "#btn_list" ).click(function(){
					location = "/nboardList";
				});
				
				$( "#btn_submit" ).click( function(){
					if( $("#title").val()=="") {
						alert("제목을 입력하세요.");
						$("#title").focus();
						return false;
					}
					if( $("#pass").val()=="") {
						alert("암호를 입력하세요.");
						$("#pass").focus();
						return false;
					}
					
					<!-- ajax : (비동기)전송 -->
					let form = $("#frm").serialize();	// serialize() : 폼을 인식하는 함수
					$.ajax({
						type:"post",					// 전송 타입
						url:"/nboardInsert",			// 전송 장소
						data:form,						// 전송 데이터
						
						dataType:"text",				// 받는 데이터 타입
						// success : 전송에 성공한 경우
						success:function(data) {		// data 변수 : 실제 받는 데이터 값
							if( data == "ok" ) {		// data 변수 값이 "ok" 라면 저장 성공으로 판단함ㄴ
								alert("저장 완료!");	
								location="/nboardList";
							} else {
								alert("저장 실패!");
							}
						},
						// error : 전송에 실패한 경우
						error:function() {			
							alert("전송 실패!");
						}			
					});
					
				});
				
				
				
		 	});
		 </script>
	</head>


	<body>
		<div class="div_title">
			게시판 등록 화면
		</div>
		<form id="frm">
			<table class="table1">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr class="table_title">
					<th><label for="title">제목</label></th>
					<td><input type="text" id="title" name="title" class="input1" placeholder="제목입력" autofocus></td>
				</tr>
				<tr>
					<th><label for="pass">암호</label></th>
					<td><input type="password" id="pass" name="pass" class="input1" maxlength="30"  placeholder="암호입력"></td>
				</tr>
				<tr>
					<th><label for="writer">글쓴이</label></th>
					<td><input type="text" id="writer" name="writer" class="input1"></td>
				</tr>
				<tr>
					<th><label for="rdate">날짜</label></th>
					<td><input type="text" id="rdate" name="rdate" class="input1"></td>
				</tr>
				<tr>
					<th><label for="emsis">강조</label></th>
					<td>&nbsp;<input type="checkbox" id="emsis" name="emsis" value="Y"></td>
				</tr>
				<tr>
					<th><label for="content">내용</label></th>
					<td><textarea id="content" name = "content" class="textarea1"></textarea></td>
				</tr>
			</table>
			
			<div class="div_button_area">
		    	<button type="submit" id="btn_submit">저장</button>
		    	<button type="reset">취소</button>
		    	<button type="button" id="btn_list" >목록</button>
			</div>
		</form>
	
	</body>
</html>