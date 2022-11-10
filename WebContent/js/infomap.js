	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.75459707384071, 128.87896153308012), // 지도의 중심좌표
	    level: 12 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	{
	    content: '<div>강원도 종합관광안내센터(강릉터미널)</div>', 
	    latlng: new kakao.maps.LatLng(37.75459707384071, 128.87896153308012)
	},
	{
	    content: '<div>대관령 관광안내소</div>', 
	    latlng: new kakao.maps.LatLng(37.68836668010267, 128.75595332530028)
	},
	{
	    content: '<div>강원도 종합관광안내소(향토공예관)</div>', 
	    latlng: new kakao.maps.LatLng(37.86750002579354, 127.72075404350286)
	},
	{
	    content: '<div>백담관광안내소</div>',
	    latlng: new kakao.maps.LatLng(38.193575470711934, 128.35303270546072)
	},
	{
	    content: '<div>진부역 관광안내소</div>',
	    latlng: new kakao.maps.LatLng(37.64276519471133, 128.5743629691129)
	},
	{
	    content: '<div>평창역 관광안내소</div>',
	    latlng: new kakao.maps.LatLng(37.56213745642209, 128.42945546863646)
	},
	{
	    content: '<div>고씨굴 관광안내소</div>',
	    latlng: new kakao.maps.LatLng(37.13047343172225, 128.53562932028143)
	},
	{
	    content: '<div>화천군 관광안내소(터미널)</div>',
	    latlng: new kakao.maps.LatLng(38.10262932723873, 127.70559438306893)
	}
	];
	
	for (var i = 0; i < positions.length; i ++) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions[i].latlng // 마커의 위치
	});
	
	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions[i].content // 인포윈도우에 표시할 내용
	});
	
	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	return function() {
	    infowindow.open(map, marker);
	};
	}
	
	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	return function() {
	    infowindow.close();
	};
	}
