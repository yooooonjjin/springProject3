<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>업로드 게시판 등록 화면</title>
		<link rel="stylesheet" href="../css/style.css">
		<script src="../js/jquery-3.7.1.js"></script>
	</head>
	
	<script>
	$(function(){

		$("#btn_list").click(function(){
			location = "/dataList";
		});
		
		$("#btn_submit").click(function() {
			
			let title = $("#title").val();
			title = $.trim(title);
			$("#title").val(title);

			let pass  = $("#pass").val();
			pass = $.trim(pass);
			$("#pass").val(pass);
			
			if( title == "" ) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
			if( pass == "" ) {
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			// let form = $("#frm").serialize();
			// {파일} 전송을 위한 폼설정
			let form = new FormData(document.getElementById('frm'));
			$.ajax({
				type : "post",
				url  : "/dataBoardInsert",
				data : form,
				
				processData: false, // 전송데이터의 인식을 위한 세팅
				contentType: false, // 전송데이터의 인식을 위한 세팅
				
				dataType : "text",
				success  : function(data){
					if(data == "ok") {
						alert("저장완료");
						location = "/dataList";
					} else {
						alert("저장실패");
					}
				},
				error    : function(){
					alert("오류발생!!");
				}
			});

		});
	});
	</script>

	<body>
		<div class="div_title">
			업로드 게시판 등록
		</div>
		<form id="frm">
			<table class="table1">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr class="table_title">
					<th><label for="title">제목</label></th>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<th><label for="writer">글쓴이</label></th>
					<td>${dto.writer }</td>
				</tr>
				<tr>
					<th><label for="content">내용</label></th>
					<td><div class="div_content">${dto.content }</div></td>
				</tr>
				<tr>
					<th><label for="rdate">등록일</label></th>
					<td>${fn:substring(dto.rdate,0,10) }</td>
				</tr>
				<tr>
					<th><label for="udate">변경일</label></th>
					<td>${fn:substring(dto.udate,0,10) }</td>
				</tr>
				<tr>
					<th>자료</th>
					<td>
						<c:set var="filename" value="${fn:trim(dto.filename)}"/>
						
						<c:if test="${filename != ''}">
						
							<c:set var="files" value="${fn:split(filename,'／')}"/>
							
							<c:forEach var="i" begin="0" end="${fn:length(files)-1 }">
								<a href="/data/${files[i]}">
									<img src ="/images/icon/download.PNG" width="20" height="20">
								</a>
							</c:forEach>
						
						</c:if>
					</td>
				</tr>
			</table>
			
			<div class="btn_wrap">
				<div class="btn01">
					<button type="button" id="btn_before">이전</button>
			    	<button type="button" id="btn_next">다음</button>
				</div>
				<div class="div_button_area">
			    	<button type="button" id="btn_list">목록</button>
			    	<button type="button" id="btn_modify">수정</button>
			    	<button type="button" id="btn_delete">삭제</button>
				</div>
			</div>
		</form>
	
	</body>
</html>