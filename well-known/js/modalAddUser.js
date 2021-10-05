$(document).ready(function(){
	$("#btnModal").click(function(e){
	    let rexp = new RegExp(/^([0-9])+\-([kK0-9])+$/);
        //let rexptel = new RegExp(/([2-9])(\d{4})(\d{4})/);
        let repxemail = new RegExp(/^(([^<>()\[\]\\.,;:\s@”]+(\.[^<>()\[\]\\.,;:\s@”]+)*)|(“.+”))@((\[[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}])|(([a-zA-Z\-0–9]+\.)+[a-zA-Z]{2,}))$/);
        
		e.preventDefault()
		if(name.value === '' || lastname.value === '' || rut.value === '' || genere.value === '0' || email.value === '' || direction.value === '' || phone.value === '' || country.value === '0' || city.value === '' || cargo_postular.value === ''){
			print();
				$("#alerts").html("<div class='alert alert-danger alert-dismissible fade show'  role='alert'><strong>Por favor ingrese los datos faltantes.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
		}
		else if(!rut.value.match(rexp)){
		    $("#alerts").html("<div class='alert alert-danger alert-dismissible fade show'  role='alert'><strong>Por favor ingrese un rut valido.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
		}
		else if(phone.value.length > 9 || phone.value.length < 9){
		    $("#alerts").html("<div class='alert alert-danger alert-dismissible fade show'  role='alert'><strong>Por favor ingrese un numero telefonico valido.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
		}
		else if(!email.value.match(repxemail)){
		    $("#alerts").html("<div class='alert alert-danger alert-dismissible fade show'  role='alert'><strong>Por favor ingrese un email valido.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
		}
		else{
			print();
			$("#modal1").modal("show");

		}
		

	});

});