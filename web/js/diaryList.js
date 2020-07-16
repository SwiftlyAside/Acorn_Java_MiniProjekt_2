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
	
	$.ajax({
		type : 'POST',
		url : '/diary/diaryListProc.jsp',
		dataType : 'json',
		success : function(data){
			console.log(data);
			for(var i=0;i<data.length;i++){
			
				console.log('data[i].weather : ' + data[i].weather);
				$('.Dlist_title'+i).append(data[i].recordDate + '&nbsp&nbsp&nbsp<b>' + data[i].title + '</b>');
				$('.Dlist_content'+i).append(data[i].content);
				$('.Dlist_weather'+i).append(data[i].weather);
				$('.Dlist_condition'+i).append(data[i].condition);
				$('.Dlist_geoInfo'+i).append(data[i].geoInfo);
				$('.Dlist_delbtn'+i).attr('id', data[i].recordNo);
			}
			
			for(var i=0;i<data.length;i++){
				$('.Dlist_delbtn'+i).on('click', function(e){
					var durl = '/diary/diaryDeleteProc.jsp?recordNo=' + $(e.target).attr('id');
					$.ajax({
						type : 'POST',
						url : durl,
						success : function(){
							
							$(location).attr('href', '/index.jsp?open=diary');
						}
					})
				})
			}
		},
		error : function(xhr, status, error){
			console.log(status);
		}
	})
	
	
});