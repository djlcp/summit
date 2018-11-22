$(document).ready(function()
{	
	console.debug($('a[data-remote]').length);

	$('a[data-remote]').on('ajax:complete ajax:success', function(e, data)
	{
		console.debug(e);
		console.debug(data);
	});

	//$("#modal-window").find(".modal-content").html("<%= j (render 'new') %>");
	//$("#modal-window").modal();
});
