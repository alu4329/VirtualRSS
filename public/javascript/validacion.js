function test() {
  
  var valora = document.getElementById("textinput_nombre").value;
  var valorb = document.getElementById("passwordinput_password").value;
  var valorc = document.getElementById("passwordinput_rss").value;
  var valord = document.getElementById("passwordinput_titulo").value;
  var valore = document.getElementById("passwordinput_foto").value;
  var valorf = document.getElementById("checkboxes-0");
  var regexp = new RegExp(/(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/);
  var fail = 1;
  
  for (var a=0; a < 6; a++) {
    if (document.getElementById(a)) {
      removeElement(a);
    }
  }
  
  if (valora == null || valora.length <= 5 || /^\s+$/.test(valora)) {
    var parrafo0 = document.createElement("p");
    var contenido = document.createTextNode("El nombre es obligatorio, y debe contener al menos 6 dígitos");
    parrafo0.appendChild(contenido);
    document.getElementById("error").appendChild(parrafo0);
    parrafo0.setAttribute('id',0);
    fail = 0;
  }
  
  if (valorb == null || valorb.length <= 5 || /^\s+$/.test(valorb)) {
    var parrafo1 = document.createElement("p");
    var contenido = document.createTextNode("La password es obligatoria y debe contener al menos 6 dígitos");
    parrafo1.appendChild(contenido);
    document.getElementById("error").appendChild(parrafo1);
    parrafo1.setAttribute('id',1);
    fail = 0;
  }
  
  if (valorc.search(/.xml/) < 0 || valorc.search(/http/) < 0) {
    var parrafo2 = document.createElement("p");
    var contenido = document.createTextNode("Debe introducir una link a una RSS válida");
    parrafo2.appendChild(contenido);
    document.getElementById("error").appendChild(parrafo2);
    parrafo2.setAttribute('id',2);
    fail = 0;
  }
  
  if (valord == null || valord.length == 0  || /^\s+$/.test(valord)) {
    var parrafo3 = document.createElement("p");
    var contenido = document.createTextNode("Introduzca un título asociado a la RSS");
    parrafo3.appendChild(contenido);
    document.getElementById("error").appendChild(parrafo3);
    parrafo3.setAttribute('id',3);
    fail = 0;
  }

  if (!regexp.test(valore)) {
    var parrafo4 = document.createElement("p");
    var contenido = document.createTextNode("Inserte una url válida para la fotografía");
    parrafo4.appendChild(contenido);
    document.getElementById("error").appendChild(parrafo4);
    parrafo4.setAttribute('id',4);
    fail = 0;
  }
  
  if( !valorf.checked ) {
    var parrafo5 = document.createElement("p");
    var contenido = document.createTextNode("Debe aceptar las condiciones de uso");
    parrafo5.appendChild(contenido);
    document.getElementById("error").appendChild(parrafo5);
    parrafo5.setAttribute('id',5);
    fail = 0;
  }
  if (fail == 1) {
    return true;
  } else {
    return false;
  }
}



function removeElement(divNum) {
  var d = document.getElementById("error");
  var olddiv = document.getElementById(divNum);
  d.removeChild(olddiv);
}