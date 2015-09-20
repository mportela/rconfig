$(function () {
    var ajax_load = "<img src='images/throbber.gif' alt='loading...' />";
	
	$('#installMsgs').hide();
	$('#installNotice').hide();
	
	var test = localStorage.input === 'true'? true: false;
	$('input').prop('checked', test || false);
});

$('input').on('change', function() {
    localStorage.input = $(this).is(':checked');
    console.log($(this).is(':checked'));
});

function updateFn(){
	
	$('#pleaseWait').show();

	$.getJSON("lib/ajaxHandlers/ajaxInstallUpdate.php", function (data) {
		
		if(data.noUpdateFile){
			alert(data.noUpdateFile)
			window.location.reload()
		} else {
			
			$('#pleaseWait').hide();
			
			jQuery.each(data, function(i, val) {
				$("#installMsgs").append('<span>&nbsp;'+val+'&nbsp;<span><br />');
			});			
			$('#installMsgs').show();
			$('#installNotice').show();
		}
	});
}