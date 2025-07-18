$(document).ready( function() {
	const defaultContent = document.getElementById("avatarDeUsuarioFilename").value;

	$("#usuarioAvatar").fileinput({
	    browseClass: "btn btn-primary",
	    allowedFileExtensions: ["jpg", "png"],
		maxFileSize: 1500,
		overwriteInitial: true,
		showCaption: false,
	    showClose: false,
	    showDelete: false,
		showUpload: false,
	    browseLabel: 'Cargar Avatar',
	    removeLabel: '',
	    browseIcon: '<i class="fa fa-folder-open"></i>',
	    removeIcon: '<i class="fa fa-trash"></i>',
		fileActionSettings: {
			showUpload: false,
	        showRemove: false,
	        showZoom: false,
	        showDrag: false,
	        showDownload: false,
	        indicatorNew: '',
	        indicatorSuccess: '',
	        indicatorError: '',
	        indicatorLoading: ''
	    },
		elErrorContainer: '#avatarDeUsuario-errors',
		msgErrorClass: 'alert alert-block alert-danger',
		initialPreviewAsData: false,
	    defaultPreviewContent: '<img src="'+defaultContent+'" class="defaultPreviewImage" />'
	});
	
	$('#personaFechaNacimiento').datepicker({
		format: "yyyy-mm-dd",
		maxViewMode: 3,
		language: "es",
		autoclose: true,
		todayHighlight: true,
		orientation: "bottom auto"
    });
});