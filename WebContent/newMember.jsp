<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>	
<style>
body {
	min-height: 100vh;
	/* background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>
	<!-- navbar -->
	<%@ include file="mypagemainnav2.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">

			<!-- 사이드 내비 -->
			<%-- <%@ include file="../jspf/newsSidenav.jspf"%> --%>

			<!-- 내용 -->
			<div class="col-10">
				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom">
					<h3>회원가입</h3>
				</div>
				<!-- 진짜 내용 -->


				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<div id="wrap">
								<hr>
								<div id="header">
									<span class="title">회원가입</span>
								</div>
								<hr>
								<form action="controller?type=insertMember" class="validation-form" method="post">
									<!-- 아이디 -->
									<div class="mb-3">
										<label for="user_id">아이디</label> <input type="text"
											class="form-control" id="user_id" name="id" placeholder="ID"
											required>
										<div class="check_font" id="id_check"></div>
									</div>
									<!-- 비밀번호 -->
									<div class="mb-3">
										<label for="user_pw">비밀번호</label> <input type="password"
											class="form-control" id="user_pw" name="pwd"
											placeholder="PASSWORD" required>
										<div id="pw_check"></div>
									</div>
									<!-- 비밀번호 재확인 -->
									<div class="mb-3">
										<label for="user_pw2">비밀번호 확인</label> <input type="password"
											class="form-control" id="user_pw2" name="pwdCh"
											placeholder="Confirm Password" required>
										<div id="pw2_check"></div>
									</div>
									<!-- 이름 -->
									<div class="mb-3">
										<label for="user_name">이름</label> <input type="text"
											class="form-control" id="user_name" name="name"
											placeholder="Name" required>
										<div class="check_font" id="name_check"></div>
									</div>
									<!-- 생년월일 -->
									<div class="mb-3">
										<label for="user_birth">생년월일</label> <input type="text"
											class="form-control" id="user_birth" name="birth"
											placeholder="ex) 19990415" required>
										<div class="check_font" id="birth_check"></div>
									</div>
									<!-- 주소 -->
									<div class="mb-3">
										<label for="user_address">주소</label> <input type="text"
											class="form-control" id="user_address" name="address"
											placeholder="xx시xx구" required>
										<div class="check_font" id="address_check"></div>
									</div>
									<!-- 휴대전화 -->
									<div class="mb-3">
										<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label> <input
											type="text" class="form-control" id="user_phone"
											name="phone" placeholder="Phone Number" required>
										<div class="check_font" id="phone_check"></div>
									</div>
									<!-- 본인확인 이메일 -->
									<div class="mb-3">
										<label for="user_email">이메일</label> <input type="text"
											class="form-control" name="email" id="user_email"
											placeholder="itwill@itwill.com" required>
										<div class="check_font" id="email_check"></div>
									</div>
									<div class="reg_button text-center">
										<a class="btn btn-danger px-3" href="login.jsp?check=0">
										<i class="fa fa-rotate-right pr-2"></i>취소하기
										</a>&emsp;&emsp;
										<button class="btn btn-primary px-3" id="reg_submit">
											<i class="fa fa-heart pr-2"></i>가입하기
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p><br></p>
	<p><br></p>
	<script>
	var inval_Arr = new Array(5).fill(false);
	let go = document.forms[0];
	$('#reg_submit').click(function(){
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#user_pw').val() == ($('#user_pw2').val()))
				&& pwJ.test($('#user_pw').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		// 이름 정규식
		if (nameJ.test($('#user_name').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}
		// 이메일 정규식
		if (mailJ.test($('#user_email').val())){
			console.log(phoneJ.test($('#user_email').val()));
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
		}
		// 휴대폰번호 정규식
		if (phoneJ.test($('#user_phone').val())) {
			console.log(phoneJ.test($('#user_phone').val()));
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
		}
		// 생년월일 정규식
		if (birthJ) {
			console.log(birthJ);
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
		}
		
		for(var i = 0; i < inval_Arr.length; i++){	
			if(inval_Arr[i] == false){
				alert('입력한 정보들을 다시 한번 확인해주세요 :)');
				return false;
			} else if (inval_Arr[i] == true){
				go.submit();
				return true;
			}
		}
		
		
	});

	</script>
	<script>
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/;
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/;
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/;
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		
		$('#user_id').keyup(function() {
			var user_id = $('#user_id').val();
			var typeVl = {type: "insertIdCheck", id: user_id};
			$.ajax({
				url : "controller",
				data : typeVl,
				type : "post",
				
				success : function(data){
					console.log("1 = 중복o / 0 = 중복x : "+ data);
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if (idJ.test($('#user_id').val())) {
							console.log('true');
							$('#id_check').text('사용가능한 아이디 입니다.');
							$('#id_check').css('color', 'blue');
							$("#reg_submit").attr("disabled", false);
						} else if($('#user_id').val() == ""){
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						} else {
							console.log('false');
							$('#id_check').text('숫자 or 문자로만 4~12자리 입력');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}		
						
					}
				}, error : function () {
							console.log("실패");
				}
			
			});
		});
		
		$('#user_pw').keyup(function() {
			if (pwJ.test($('#user_pw').val())) {
				console.log('true');
				$('#pw_check').text('비밀번호 통과');
				$('#pw_check').css('color', 'blue');
			} else {
				console.log('false');
				$('#pw_check').text('숫자 or 문자로만 4~12자리 입력');
				$('#pw_check').css('color', 'red');
			}

		});
		
		$('#user_pw2').keyup(function() {
			if ($('#user_pw').val() != $(this).val()) {
				console.log('false');
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else {
				console.log('true');
				$('#pw2_check').text('비밀번호 통과');
				$('#pw2_check').css('color', 'blue');
			}

		});
		//이름에 특수문자 불가
		$("#user_name").keyup(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
			} else {
				$('#name_check').text('이름을 확인해주세요');
				$('#name_check').css('color', 'red');
			}
		});
		
		
		// 휴대전화
		$('#user_phone').keyup(function(){
			if(phoneJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
				$('#phone_check').css('color', 'red');
			}
		});
		
		// 이메일
		$('#user_email').keyup(function(){
			if(mailJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$("#email_check").text('');
			} else {
				$('#email_check').text('이메일을 확인해주세요 :)');
				$('#email_check').css('color', 'red');
			}
		});
		
		// 생일 유효성 검사
		var birthJ = false;
		
		// 생년월일	birthJ 유효성 검사
		$('#user_birth').keyup(function(){
			var dateStr = $(this).val();		
		    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 연도 가져옴
			
		    if (dateStr.length <=8) {
				// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			    if (1900 > year || year > yearNow){
			    	
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red');
			    	
			    }else if (month < 1 || month > 12) {
			    		
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    
			    }else if (day < 1 || day > 31) {
			    	
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			    	 
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	 
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
			     		
			     		$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red'); 
			    	
					}else{
						$('#birth_check').text('');
						birthJ = true;
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{
			    	
			    	$('#birth_check').text(''); 
					birthJ = true;
				}//end of if
				
				}else{
					//1.입력된 생년월일이 8자 초과할때 :  auth:false
					$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red');  
				}
			}); //End of method /*
	</script>
	<%@include file="../jspf/footer.jspf"%>

</body>
</html>