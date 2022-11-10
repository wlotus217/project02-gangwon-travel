<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>찜 보기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script>
	function delete_go(frm){
		if($("input[name='zzim']:checked").val() != null){
			if(confirm("정말 삭제하시겠습니까?")) {
				frm.submit(); 
			}
		} else {
			alert("선택된 게시물이 없습니다.");
			return;
		}
	}

	function selectAll(selectAll)  {
		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
</head>
<body>
	<!-- 상단 nav -->
	<%@ include file="../mypagemainnav.jspf"%>

	<div class="container">

		<div class="row">

			<!-- 사이드 nav -->
			<%@ include file="../mypagesidenav.jspf"%>

			<!-- content -->
			<div class="col-10">

				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom">
					<h3>내가 찜한 목록</h3>
				</div>
				<!-- 내용 -->
				<div class="">
					<form action="${pageContext.request.contextPath }/controller3?type=zzimDelete&id=${id}" method="post">
						<input type="button" value="선택삭제" onclick="delete_go(this.form)"
							class="btn btn-outline-secondary m-2 float-right">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox" value='selectall' onclick='selectAll(this)' /></th>
									<th scope="col">게시판명</th>
									<th scope="col">미리보기</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5">
												<h4>등록된 찜이 없습니다.</h4>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="vo" items="${list }">
										<!-- 게시판 별 글 상세보기로 이동 -->
											<c:choose>
												<c:when test="${vo.boardName eq '테마여행'}">
													<tr onClick="location.href='${pageContext.request.contextPath }/controller3?type=themeView&idx=${vo.boardIdx}&cPage=1'"
														style="height: 70px;">
												</c:when>
												<c:when test="${vo.boardName eq '추천여행코스'}">
													<tr onClick="location.href='${pageContext.request.contextPath }/controller3?type=courseView&idx=${vo.boardIdx}&cPage=1'"
														style="height: 70px;">
												</c:when>
												<c:when test="${vo.boardName eq '여행후기'}">
													<tr onClick="location.href='${pageContext.request.contextPath }/controller3?type=reviewView&idx=${vo.boardIdx}&cPage=1'"
														style="height: 70px;">
												</c:when>
											</c:choose>
	
												<td onclick="event.cancelBubble=true">
													<div class="form-check">
														<input class="form-check-input position-static"
															type="checkbox" id="blankCheckbox" name="zzim"
															value="${vo.idx }">
													</div>
												</td>
												<td>${vo.boardName }</td>
												<td><img
													src="${pageContext.request.contextPath }/imgs/${vo.image }"
													style="width: 100px; height: 60px;'"></td>
												<td>${vo.title }</td>
												<td>${vo.regdate }</td>
											</tr>

										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</form>
				</div>
				
				<!-- 페이징 처리	 -->
				<div class="p-5">
					<nav aria-label="...">
						<ul class="pagination justify-content-center">
							<%--[이전으로]에 대한 사용여부 처리 --%>
							<c:if test="${pvo.beginPage == 1 }">
								<li class="page-item disabled"><span class="page-link">이전으로</span>
								</li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/controller3?type=zzimView&id=${id}&cPage=${pvo.beginPage - 1 }">이전으로</a>
								</li>
							</c:if>
							<%-- 블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="page-item active" aria-current="page"><span
										class="page-link">${pageNo }</span></li>
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath }/controller3?type=zzimView&id=${id}&cPage=${pageNo }">${pageNo }</a></li>
								</c:if>
							</c:forEach>

							<%-- [다음으로]에 대한 사용여부 처리 --%>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a class="page-link"
									href="${pageContext.request.contextPath }/controller3?type=zzimView&id=${id}&cPage=${pvo.endPage + 1 }">다음으로</a>
								</li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="page-item disabled"><span class="page-link">다음으로</span>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- 페이징 처리 끝 -->

			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>