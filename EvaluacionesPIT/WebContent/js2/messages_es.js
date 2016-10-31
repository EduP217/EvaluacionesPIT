(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ES (Spanish; Español)
 */
$.extend($.validator.messages, {
	required: "Este campo es obligatorio.",
	remote: "Por favor, rellena este campo.",
	email: "Por favor, escribe una direcci�n de correo v�lida.",
	url: "Por favor, escribe una URL v�lida.",
	date: "Por favor, escribe una fecha v�lida.",
	dateISO: "Por favor, escribe una fecha (ISO) v�lida.",
	number: "Por favor, escribe un n�mero v�lido.",
	digits: "Por favor, escribe s�lo d�gitos.",
	creditcard: "Por favor, escribe un n�mero de tarjeta v�lido.",
	equalTo: "Por favor, escribe el mismo valor de nuevo.",
	extension: "Por favor, escribe un valor con una extensi�n aceptada.",
	maxlength: $.validator.format("Por favor, no escribas m�s de {0} caracteres."),
	minlength: $.validator.format("Por favor, no escribas menos de {0} caracteres."),
	rangelength: $.validator.format("Por favor, escribe un valor entre {0} y {1} caracteres."),
	range: $.validator.format("Por favor, escribe un valor entre {0} y {1}."),
	max: $.validator.format("Por favor, escribe un valor menor o igual a {0}."),
	min: $.validator.format("Por favor, escribe un valor mayor o igual a {0}."),
	nifES: "Por favor, escribe un NIF v�lido.",
	nieES: "Por favor, escribe un NIE v�lido.",
	cifES: "Por favor, escribe un CIF v�lido."
});

}));