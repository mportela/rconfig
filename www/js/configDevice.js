  $(window).load(function() {
  // alert(document.URL);
	var rid = location.search.split('rid=')[1]
	pageLoadFunctions();
  });
  
  
function pageLoadFunctions(){
	$('#loading').hide();
	$('#noticeBoard').hide();
	$('#snippetSelectDiv').show();
	$('#snippetDiv').hide();
	$('#uploadButton').hide();
}  

function startConfigurationScript(rid){
	$('#loading').show();
    var e = document.getElementById("snippetSelect");
    var snippetId = e.options[e.selectedIndex].value;

    $.ajax({
        async: false, // prevent an async call
        url: 'lib/ajaxHandlers/ajaxConfigDevice.php?rid='+rid+'&snipId='+snippetId,
        data: {},
        dataType: "json",
		 complete: function(){
				$('#loading').fadeOut(500);
				$('#loading').remove();
				$('#noticeBoard').show();
            },
        success:function(data){
			$.each(data, function(i, item) {
				$('#noticeBoard').append('<div>'+item+'</>');
			});
        }
    });
}

// get snippet text for display in configDevice.php window
function switchSnippet(id) {
	
    if (id != '') { // if catId is not equal to '' i.e. catId is selected then carry on
        $.ajax({
        async: false, // prevent an async call
        url: 'lib/ajaxHandlers/ajaxGetSnippetText.php?id='+id,
        data: {},
        dataType: "json",
        success:function(data){
			$.each(data, function(i, item) {
				// alert(item.snippet)
				$('#snippetDiv').html(item.snippet);
			});
			$('#snippetDiv').show();
			$('#uploadButton').show();
        }
    });
    } else {
		alert('Please select a snippet!')
	}
}
