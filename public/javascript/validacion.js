function test() {
  
  var valora = document.getElementById("textinput_nombre").value;
  var valorb = document.getElementById("passwordinput_password").value;
  var valorc = document.getElementById("passwordinput_rss").value;
  var valord = document.getElementById("passwordinput_titulo").value;
  var valore = document.getElementById("passwordinput_foto").value;
  var valorf = document.getElementById("checkboxes-0");
  var regexp = new RegExp(/(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/);
  
  if (valora == null || valora.length <= 5 || /^\s+$/.test(valora)) {
    alert('[ERROR] Es obligatorio un nombre de usuario  de como mínimo 6 caracteres.');
    return false;
  }
  
  if (valorb == null || valorb.length <= 5 || /^\s+$/.test(valorb)) {
    alert('[ERROR] La contraseña debe tener como mínimo 6 caracteres.');
    return false;
  }
  
  if (valorc.search(/.xml/) < 0 || valorc.search(/http/) < 0) {
    alert('[ERROR] Introduzca una URL a un archivo XML válido.');
    return false;
  }
  
  if (valord == null || valord.length == 0  || /^\s+$/.test(valord)) {
    alert('[ERROR] Introduzca un título asociado a la RSS.');
    return false;
  }

  if (!regexp.test(valore)) {
    alert('[ERROR] Introduzca una url válida para la fotografía.');
    return false;
  }
  
  if( !valorf.checked ) {
    alert('[ERROR] Debe aceptar las condiciones de uso.');
    return false;
  }

  return true;
}