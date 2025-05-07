<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원상세 화면</title>
		<link rel="stylesheet" href="../css/style.css"></link>
	</head>
	
	<style>
		td {
			text-align : left;
			padding : 5px;
		}
	</style>

	<script>
		function fn_delete() {
			if( confirm("정말 삭제하시겠습니까?")) {
				location="/mbrDelete/${dto.userid}";	
			}
		}
		
	</script>

	<body>
		<div>
			<form name="frm" method="post" action="/mbrInsert">
				<colgroup>
					<col width="15%">
					<col width="*">
				</colgroup>	
				<table class="table1">
					<tr>
						<th>아이디</th>
						<td>${dto.userid }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${dto.name }</td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td>${dto.phone }</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${dto.gender }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${dto.addr }</td>
					</tr>
				</table>
			
				<div class="div_button_area">
					<button type="button" onClick="location='/mbrList'">목록</button>
					<button type="button" onClick="location='/mbrModify/${dto.userid}'">수정</button>
					<button type="button" onClick="fn_delete()">삭제</button>
				</div>
			</form>
		</div>
	</body>
</html>