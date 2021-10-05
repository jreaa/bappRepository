	$(document).ready(function(){
		$('#todos').click(function(){
			$('#postulante').attr('readonly','readonly');
			let mensaje = `
				<div class="alert alert-warning">El mensaje se enviara a todos los usuarios en la base de datos.</div>
			`;
			let arrayPostulantes = document.getElementById('postulanteArray');

			arrayPostulantes.value = 'todos';
			$('#contenido').html(mensaje);
		});

		let postulantes  = [];
		$('#postulante').on('change', function(){
			
			let p = $('#postulante').val();
			postulantes.push(p);

			let templates = `
				<div class="alert alert-success">El mensaje se esta enviando a: ${postulantes} </div>
			`;

			let arrayPostulantes = document.getElementById('postulanteArray');

			arrayPostulantes.value = postulantes;
			$('#contenido').html(templates);
		})
	});
