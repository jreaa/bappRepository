let name, lastname, rut, genere, email, direction, phone, country, city, btn_modal;
	btn_modal = document.getElementById("btn_modal")
	name = document.getElementById("name")
	lastname = document.getElementById("lastname")
	rut = document.getElementById("rut")
	genere = document.getElementById("genere")
	email = document.getElementById("email")
	direction = document.getElementById("address")
	phone = document.getElementById("tel")
	country = document.getElementById("country")
	city = document.getElementById("city")
	date = document.getElementById("date")
	cargo_postular = document.getElementById('cargo_postular')
	nivel_estudio = document.getElementById('nivele')

//var re = /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}\1\d{4}/;

function print(){
    let rexp = new RegExp(/^([0-9])+\-([kK0-9])+$/);

    if(!rut.value.match(rexp)){
        rut.className += " is-invalid"
    }
    
	if(name.value === null || name.value === ''){
		name.className += " is-invalid"
	}else{
		n = document.getElementById("n")
		n.innerHTML = name.value

		nombre = document.getElementById("nombre")
		nombre.value = name.value
	}
	
	if(nivel_estudio.value === null || nivel_estudio.value === ''){
		nivel_estudio.className += " is-invalid"
	}else{
		ne = document.getElementById("ne")
		ne.innerHTML = nivel_estudio.value

		nivele = document.getElementById("nivel_estudio")
		nivele.value = nivel_estudio.value
	}
	
	
	if(lastname.value === null || lastname.value === ''){
		lastname.className += " is-invalid"
	}else{
		l = document.getElementById("l")
		l.innerHTML = lastname.value

		apellido = document.getElementById("apellido")
		apellido.value = lastname.value
	}
	if(rut.value === null || rut.value === ''){
		rut.className += " is-invalid"
	}else{
		r = document.getElementById("r")
		r.innerHTML = rut.value

		rut_id = document.getElementById("rut_id")
		rut_id.value = rut.value
	}
	if(genere.value === "0" || genere.value === ''){
		genere.className += " is-invalid"
	}else{
		g = document.getElementById("g")
		g.innerHTML = genere.value

		genero = document.getElementById("genero")
		genero.value = genere.value
	}
	if(direction.value === null || direction.value === ''){
		direction.className += " is-invalid"
	}else{
		d = document.getElementById("d")
		d.innerHTML = genere.value

		direccion = document.getElementById("direccion")
		direccion.value = direction.value
	}
	if(email.value === null || email.value === ''){
		email.className += " is-invalid"
	}else{
		e = document.getElementById("e")
		e.innerHTML = email.value

		correo = document.getElementById("correo")
		correo.value = email.value
	}
	if(phone.value === null || phone.value === ''){
		phone.className += " is-invalid"
	}else{
		t = document.getElementById("t")
		t.innerHTML = phone.value

		telefono = document.getElementById("telefono")
		telefono.value = phone.value
	}
	if(city.value ===null || city.value === ''){
		city.className += " is-invalid"
	}else{
		c = document.getElementById("c")
		c.innerHTML = city.value

		ciudad = document.getElementById("ciudad")
		ciudad.value = city.value
	}
	if(country.value === "0" || country.value === ''){
		country.className += " is-invalid"
	}else{
		na = document.getElementById("na")
		na.innerHTML = country.value

		pais = document.getElementById("pais")
		pais.value = country.value
	}
	if(cargo_postular.value === "0" || cargo_postular.value === ''){
		cargo_postular.className += " is-invalid"
	}else{
		cp = document.getElementById("cp")
		cp.innerHTML = cargo_postular.value

		cargo = document.getElementById("cargo")
		cargo.value = cargo_postular.value
	}

	if(date.value ===null || date.value === ''){
		date.className += " is-invalid"
	}else{
		da = document.getElementById("da")
		da.innerHTML = date.value

		fecha = document.getElementById("fecha")
		fecha.value = date.value
	}

}