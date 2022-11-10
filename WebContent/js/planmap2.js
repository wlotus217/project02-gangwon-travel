	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.73663555196746, 128.28616213998367), // 지도의 중심좌표
	    level: 11 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	{
	    content: '<div>춘천시</div>', 
	    latlng: new kakao.maps.LatLng(37.88134489944006, 127.72992271410125)
	},
	{
	    content: '<div>원주시</div>', 
	    latlng: new kakao.maps.LatLng(37.34211373561749, 127.92109099750448)
	},
	{
	    content: '<div>강릉시</div>', 
	    latlng: new kakao.maps.LatLng(37.75185088362452, 128.8763307838529)
	},
	{
	    content: '<div>동해시</div>',
	    latlng: new kakao.maps.LatLng(37.52383753489379, 129.1143733036614)
	},
	{
	    content: '<div>태백시</div>',
	    latlng: new kakao.maps.LatLng(37.163926505383095, 128.98507024189496)
	},
	{
	    content: '<div>속초시</div>',
	    latlng: new kakao.maps.LatLng(38.207030181419086, 128.5924164724746)
	},
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	