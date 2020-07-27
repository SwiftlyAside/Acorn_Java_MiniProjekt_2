$(document).ready(function(){
	
	$('.condition_btn').on('click', function(){
		var params = $('.frm_con').serialize();
		$.ajax({
			type : 'POST',
			url : '/joinheader/conditionProc.jsp',
			data : params,
			dataType : 'html',
			success : function(data){
				$(location).attr('href', '/index.jsp');
			}
		})
	})
	
})