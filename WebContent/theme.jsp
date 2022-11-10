<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강원도이야기 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<script>
	function search_go(frm){
		if(frm.searchKeyword.value.trim() == "") {
			alert("검색어를 입력해주세요.");
			frm.searchKeyword.focus();
			return false;
		}
		frm.submit();

	}

</script>
<body>


<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
<div class="container">
  <a class="navbar-brand" href="#">
  	<img src="../imgs/logo.png" height="60">
  </a>
  
  
	<!-- 창 사이즈 작아졌을때 네비 -->
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>



  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          강원도 여행지
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          강원도 이야기
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          관광 안내
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          관광 소식
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <div>
	    <button type="button" class="btn btn-primary">로그인</button>
	    <button type="button" class="btn btn-primary">회원가입</button>
	</div>
  </div>
</div>
</nav>

<!-- 상단 이미지& 제목 -->
<div>
<img src="https://www.gangwon.to/_images/sub/go_to_kangwondo.jpg">
</div>


<!-- content -->
<div class="container">

<div class="row">

<!-- 사이드 내비 -->
<div class="col-2">
<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active" href="#">테마여행</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">추천여행코스</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">여행후기</a>
  </li>
</ul>
</div>


<!-- 내용 -->
<div class="col-10">

	<div class="row p-3 border-bottom">
		<h3>테마여행</h3>
	</div>
	
	<div class="row p-1 my-3 border">
		<div class="col-4"><p>총게시물 15건 페이지 1/2</p></div>
		<div class="col-8">
			<form class="form-inline float-right" action="controller?type=themeSearch" method="post">
				<select class="custom-select" name="search">
					<option value="title" selected>제목</option>
					<option value="content">내용</option>
				</select>
				<input class="form-control mr-sm-2" type="search" name="searchKeyword" placeholder="여기에 검색어를 입력해주세요.">
				<input class="btn btn-outline-success my-2 my-sm-0" type="button" value="검색" onclick="search_go(this.form)">
			</form>
		</div>
	</div>
		
	<div class="row border-bottom ">
		<form class="form-inline" action="theme_write.jsp">
			<input class="btn btn-secondary" type="submit" value="새글 등록" >
		</form>		
	</div>	
	
	<div class="row py-5 ">
	  		<div class="row row-cols-3 text-center">
	    		<div class="col">
	    			<div class="card" style="width: 18rem;">
	  				<img src="https://www.gangwon.to/servlet/Thumbnail?i=/upload/board/thumbimage/BDCCCC14/e03db02e-94a8-4e40-aa0b-720aba34a3bc.jpg&w=257&h=168" class="card-img-top" alt="...">
	  				<div class="card-body">
	   		 			<h5 class="card-title">양양 서퍼비치</h5>
	   				 	<p class="card-text">내용</p>
	  		  			<a href="#" class="btn btn-primary">찜하기</a>
	 		 		</div>
					</div>
				</div>
	    		<div class="col">
	    			<div class="card" style="width: 18rem;">
	  				<img src="..." class="card-img-top" alt="...">
	  				<div class="card-body">
	   		 			<h5 class="card-title">Card title</h5>
	   				 	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  		  			<a href="#" class="btn btn-primary">Go somewhere</a>
	 		 		</div>
					</div>
				</div>
	    		<div class="col">
	    			<div class="card" style="width: 18rem;">
	  				<img src="..." class="card-img-top" alt="...">
	  				<div class="card-body">
	   		 			<h5 class="card-title">Card title</h5>
	   				 	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  		  			<a href="#" class="btn btn-primary">Go somewhere</a>
	 		 		</div>
					</div>
				</div>
	    		<div class="col">
	    			<div class="card" style="width: 18rem;">
	  				<img src="..." class="card-img-top" alt="...">
	  				<div class="card-body">
	   		 			<h5 class="card-title">Card title</h5>
	   				 	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  		  			<a href="#" class="btn btn-primary">Go somewhere</a>
	 		 		</div>
					</div>
				</div>
	    		<div class="col">
	    			<div class="card" style="width: 18rem;">
	  				<img src="..." class="card-img-top" alt="...">
	  				<div class="card-body">
	   		 			<h5 class="card-title">Card title</h5>
	   				 	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  		  			<a href="#" class="btn btn-primary">Go somewhere</a>
	 		 		</div>
					</div>
				</div>
	    		<div class="col">
	    			<div class="card" style="width: 18rem;">
	  				<img src="..." class="card-img-top" alt="...">
	  				<div class="card-body">
	   		 			<h5 class="card-title">Card title</h5>
	   				 	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  		  			<a href="#" class="btn btn-primary">Go somewhere</a>
	 		 		</div>
					</div>
				</div>
	    		
	  		</div>
		
	</div>
	
<!-- 페이징 처리 -->	
	<div class="p-5">
		<nav aria-label="Page navigation example">
	  		<ul class="pagination justify-content-center">
	    		<li class="page-item disabled">
	     			<a class="page-link">Previous</a>
	    		</li>
	   			<li class="page-item"><a class="page-link" href="#">1</a></li>
	    		<li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
	      			<a class="page-link" href="#">Next</a>
	    		</li>
	  		</ul>
		</nav>
	</div>
	



</div>
</div>
</div>


<!-- 푸터 -->
<footer class="bg-light">
	<div class="container">
		
	<br>
	<div class="row" >
		<a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">개인정보처리방침</a>
		<a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">영상정보처리기기관리방침</a>
		<a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">저작권보호</a>
	</div>
	<div class="row">
		<div style="text-align: left;"><h5>(우 24266) 강원도 춘천시 중앙로 1 (봉의동)</h5><h5>Copyright &copy; Gangwon-do. All Rights reserved.</h5></div>
	
	</div>
	<div class="row">
		<div class="col-6">
			<img src="../imgs/logo.png" height="60">
		</div>
		<div class="col-6" style="text-align: right;">
			<div class="link_box">
                   <select name="jump" onchange="location.href=this.value">
                       	<option>유관기관</option>
                           <option value="http://www.provin.gangwon.kr/" title="새창열림">· 강원도청</option>
                       
                           <option value="http://www.gwto.or.kr/www/index.do" title="새창열림">· 강원도관광재단</option>
                       
                           <option value="https://dangdangmap.net/pet" title="새창열림">· 강원 댕댕여지도</option>
                       
                           <option value="http://tour.chuncheon.go.kr/" title="새창열림">· 춘천시</option>
                       
                           <option value="https://www.wonju.go.kr/tour/index.do" title="새창열림">· 원주시</option>
                       
                           <option value="https://www.gn.go.kr/tour/index.do" title="새창열림">· 강릉시</option>
                       
                           <option value="https://www.dh.go.kr/tour/" title="새창열림">· 동해시</option>
                       
                           <option value="http://tour.taebaek.go.kr" title="새창열림">· 태백시</option>
                       
                           <option value="http://www.sokchotour.com" title="새창열림">· 속초시</option>
                       
                           <option value="http://tour.samcheok.go.kr" title="새창열림">· 삼척시</option>
                       
                           <option value="https://www.hongcheon.go.kr/tour/index.do" title="새창열림">· 홍천군</option>
                      		
                           <option value="https://www.hsg.go.kr/tour.web" title="새창열림">· 횡성군</option>
                       
                           <option value="https://www.yw.go.kr/tour/index.do" title="새창열림">· 영월군</option>
                       
                           <option value="http://tour.pc.go.kr/" title="새창열림">· 평창군</option>
                       
                           <option value="https://www.jeongseon.go.kr/tour" title="새창열림">· 정선군</option>
                       
                           <option value="https://www.cwg.go.kr/tour/index.do" title="새창열림">· 철원군</option>
                       
                           <option value="http://tour.ihc.go.kr" title="새창열림">· 화천군</option>
                       
                           <option value="http://www.ygtour.kr" title="새창열림">· 양구군</option>
                       
                           <option value="http://tour.inje.go.kr" title="새창열림">· 인제군</option>
                       
                           <option value="https://www.gwgs.go.kr/tour/" title="새창열림">· 고성군</option>
                       
                           <option value="http://tour.yangyang.go.kr" title="새창열림">· 양양군</option>
                       
                           <option value="http://www.visitjeju.net" title="새창열림">· 제주도</option>
                       
                           <option value="http://www.namdokorea.com" title="새창열림">· 전라남도</option>
                       
                           <option value="http://tour.jb.go.kr" title="새창열림">· 전라북도</option>
                       
                           <option value="https://tour.chungnam.go.kr/html/kr/" title="새창열림">· 충청남도</option>
                       
                           <option value="http://tour.chungbuk.go.kr" title="새창열림">· 충청북도</option>
                       
                           <option value="http://tour.gyeongnam.go.kr" title="새창열림">· 경상남도</option>
                       
                           <option value="http://tour.gb.go.kr" title="새창열림">· 경상북도</a></option>
                       
                           <option value="http://ggtour.or.kr/" title="새창열림">· 경기도</option>
                       
                           <option value="http://tour.ulsan.go.kr" title="새창열림">· 울산시</option>
                       
                           <option value="http://tour.gwangju.go.kr" title="새창열림">· 광주시</option>
                       
                           <option value="http://tour.daegu.go.kr/" title="새창열림">· 대구시</option>
                       
                           <option value="https://itour.incheon.go.kr/" title="새창열림">· 인천시</option>
                       
                           <option value="http://www.daejeon.go.kr/tou/index.do" title="새창열림">· 대전시</option>
                       
                           <option value="https://bto.or.kr/kor/Main.do" title="새창열림">· 부산시</option>
                       
                           <option value="http://www.visitseoul.net/index" title="새창열림">· 서울시</option>
                       
                           <option value="http://www.visitkorea.or.kr/intro.html" title="새창열림">· 한국관광공사</option>
                       
                           <option value="http://www.mcst.go.kr/main.jsp" title="새창열림">· 문화체육관광부</option>
                       
                   </select>
                   

               </div>
               
		</div>
	</div>
	
	</div>

</footer> 

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>