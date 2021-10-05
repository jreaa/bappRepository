$(document).ready(function(){
date = document.getElementById('date')
time = document.getElementById('time')
place = document.getElementById('place')
message = document.getElementById('message')
postulante = document.getElementById('postulante')
link = document.getElementById('link');

function printer(){
	if(link.value === '0' || link.value === ''){
		link.className += " is-invalid"
	}else{
		enlace = document.getElementById('enlace')
		enlace.value = link.value
		l = document.getElementById('e')
		l.innerHTML = link.value
	}

	m = document.getElementById("m")
	m.innerHTML = message.value

	mensaje = document.getElementById("mensaje")
	mensaje.value = message.value
	

	if(postulante.value === '0' || postulante.value === ''){
	    postulante.className += " is-invalid"
	}else{
	    person = document.getElementById("person")
		person.value = postulante.value
	}
	
	

	if(date.value === null || date.value === ''){
	date.className += " is-invalid"
	}else{
		d = document.getElementById("d")
		d.innerHTML = date.value

		fecha = document.getElementById("fecha")
		fecha.value = date.value
	}
	if(time.value === null || time.value === ''){
	time.className += " is-invalid"
	}else{
		t = document.getElementById("t")
		t.innerHTML = time.value

		fecha = document.getElementById("hora")
		fecha.value = time.value
	}
	if(place.value === null || place.value === ''){
	place.className += " is-invalid"
	}else{
		p = document.getElementById("p")
		p.innerHTML = place.value

		lugar = document.getElementById("lugar")
		lugar.value = place.value
	}
}

	$("#btnModal").click(function(e){
	e.preventDefault()
	if(postulante.value === '0' || date.value === '' || time.value === '' || place.value === ''){
		printer();
			$("#alerts").html("<div class='alert alert-danger alert-dismissible fade show'  role='alert'><strong>Por favor ingrese los datos faltantes.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
	}else{
		printer();
		$("#modal1").modal("show");

	}
	

});
});