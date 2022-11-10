<%@page import="com.mystudy.story.vo.ThemeVO"%>
<%@page import="com.mystudy.story.dao.ThemeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마여행 상세</title>
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
	//삭제 확인
	function delete_go() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath }/controller3?type=themeDelete&idx=${tvo.idx }";
		}
	}
	//찜하기 클릭시 id 값 체크하여 alert창 띄우기
	function zzim_go() {
		if ('${ch.id}' == "") {
			alert("로그인 후 이용해주세요.");
			return;
		}
		if ('${ch.id}' == 'admin') {
			alert("찜하기는 회원만 가능합니다.");
			return;
		}
	location.href = "${pageContext.request.contextPath }/controller3?type=zzimAdd&id=${ch.id }&boardName=테마여행&boardIdx=${tvo.idx}&image=${tvo.image1}&title=${tvo.title}";
	}
</script>
</head>
<body>
	<!-- 상단 nav -->
	<%@ include file="../jspf/storynav.jspf"%>

	<div class="container">

		<div class="row">

			<!-- 사이드 nav -->
			<%@ include file="../jspf/storySidenav.jspf"%>

			<!-- content -->
			<div class="col-10">
			
				<!-- 수정,삭제,찜하기 버튼 -->
				<!-- 수정, 삭제 버튼 (로그인 한 id가 admin 일때만 보이게 하기) -->
				<div class="row justify-content-end py-1">
					<c:if test="${ch.id eq 'admin' }">
						<input class="btn btn-outline-secondary m-1" type="button" value="수정"
							onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=themeModifyForm&idx=${tvo.idx}'">
						<input class="btn btn-outline-secondary m-1" type="button"
							value="삭제" onclick="delete_go()">
					</c:if>
					<input class="btn btn-outline-secondary m-1" type="button"
						value="찜하기" onclick="zzim_go()">
				</div>

				<!-- 내용 -->
				<div class="row py-3">
					<table class="table table-borderless ">
						<thead>
							<tr class="border-bottom ">
								<td colspan="2">
									<h4><em>${tvo.title }</em></h4>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2"><p>${tvo.intro }</p></td>
							</tr>
							<tr>
								<td colspan="2">
									<mark><strong>
									<svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-balloon-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.244-.487ZM4.352 3.356a4.004 4.004 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5c0 .276-.226.496-.498.542-.95.162-1.749.78-2.173 1.617a.595.595 0 0 1-.52.341c-.346 0-.599-.329-.457-.644Z" />
									</svg> 
									${tvo.placeName1 }
									</strong></mark>
								</td>
							</tr>
							<tr>
								<td><img
									src="${pageContext.request.contextPath }/imgs/${tvo.image1 }"
									style="width: 400px;"></td>
								<td><p>${tvo.detail1 }</p></td>
							</tr>
							<tr>
								<td colspan="2">
									<mark><strong> 
									<svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-balloon-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.244-.487ZM4.352 3.356a4.004 4.004 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5c0 .276-.226.496-.498.542-.95.162-1.749.78-2.173 1.617a.595.595 0 0 1-.52.341c-.346 0-.599-.329-.457-.644Z" />
									</svg> 
									${tvo.placeName2 }
									</strong></mark>
								</td>
							</tr>
							<tr>
								<td><img
									src="${pageContext.request.contextPath }/imgs/${tvo.image2 }"
									style="width: 400px;"></td>
								<td><p>${tvo.detail2 }</p></td>
							</tr>
							<tr>
								<td colspan="2">
									<mark><strong> 
									<svg xmlns="http://www.w3.org/2000/svg"
											width="16" height="16" fill="currentColor"
											class="bi bi-balloon-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.244-.487ZM4.352 3.356a4.004 4.004 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5c0 .276-.226.496-.498.542-.95.162-1.749.78-2.173 1.617a.595.595 0 0 1-.52.341c-.346 0-.599-.329-.457-.644Z" />
									</svg> 
									${tvo.placeName3 }
									</strong></mark>
								</td>
							</tr>
							<tr>
								<td><img
									src="${pageContext.request.contextPath }/imgs/${tvo.image3 }"
									style="width: 400px;"></td>
								<td><p>${tvo.detail3 }</p></td>
							</tr>
							<tr>
								<td colspan="2">
									<mark><strong> 
									<svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-balloon-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.244-.487ZM4.352 3.356a4.004 4.004 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5c0 .276-.226.496-.498.542-.95.162-1.749.78-2.173 1.617a.595.595 0 0 1-.52.341c-.346 0-.599-.329-.457-.644Z" />
									</svg> 
									${tvo.placeName4 }
									</strong></mark>
								</td>
							</tr>
							<tr>
								<td><img
									src="${pageContext.request.contextPath }/imgs/${tvo.image4 }"
									style="width: 400px;"></td>
								<td><p>${tvo.detail4 }</p></td>
							</tr>
							<tr>
								<td colspan="2">
									<mark><strong> 
									<svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-balloon-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.244-.487ZM4.352 3.356a4.004 4.004 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5c0 .276-.226.496-.498.542-.95.162-1.749.78-2.173 1.617a.595.595 0 0 1-.52.341c-.346 0-.599-.329-.457-.644Z" />
									</svg> 
									${tvo.placeName5 }
									</strong></mark>
								</td>
							</tr>
							<tr>
								<td><img
									src="${pageContext.request.contextPath }/imgs/${tvo.image5 }"
									style="width: 400px;"></td>
								<td><p>${tvo.detail5 }</p></td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 목록보기 버튼 -->
				<div class="row py-3 border-top">
					<c:choose>
						<c:when test="${search eq null}"> 
							<!-- 전체 리스트로 가기 -->
							<input class="btn btn-secondary btn-lg" type="button"
								value="목록보기"
								onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=themeTravel&cPage=${cPage}'">
						</c:when>
						<c:otherwise>
							<!-- search값이 있다면 검색 리스트로 가기 -->
							<input class="btn btn-secondary btn-lg" type="button"
								value="목록보기"
								onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=themeSearch&search=${search }&searchKeyword=${searchKeyword }&cPage=${cPage}'">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>