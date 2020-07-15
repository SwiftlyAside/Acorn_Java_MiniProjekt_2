$(function () {
	function toggleOpen(e) {
		$(e.target)
			.prev('.card-header')
			.find(".expand-icon")
			.text("remove_circle");
	}
	function toggleClose(e) {
		$(e.target)
			.prev('.card-header')
			.find(".expand-icon")
			.text("add_circle");
	}
	$('.panel-group').on('hidden.bs.collapse', toggleClose);
	$('.panel-group').on('shown.bs.collapse', toggleOpen);
	
	navigator.geolocation.getCurrentPosition((position) => {
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;
		var weatherUrl = 'http://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon + '&appid=dd584ccaea0405b403b4ade0ef7e5e9c';
		
		/* data.weather[0]
		 * .main -> 날씨
		 * .icon -> 아이콘
		 * */
		$.ajax({
			type : 'POST',
			url : weatherUrl,
			dataType : 'json',
			success : function(data, status){
				$('.Dlist_weather').append(data.weather[0].main + "<img class='img_weather' src='http://openweathermap.org/img/wn/" 
						+ data.weather[0].icon + "@2x.png'>");
			}
		})
	});
});