<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<script>
	function sendData() {
		let firstForm = document.forms[0];
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

	function list_go() {
		location.href = "hiddenSpot.jsp";
	}
</script>
</head>
<body>

<div>
	<form action="controller2?type=hiddenDelete" method="post">
	<table>
		<caption>삭제</caption>
		<tbody>
			<tr>
				<th>삭제할 글번호</th>
				<td>
					<input type="text" name="boardNum" title="글번호">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="삭제" onclick="sendData()">
					<input type="reset" value="초기화">
					<input type="button" value="목록보기" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>	
	</form>
</div>

</body>
</html>