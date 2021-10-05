$(document).ready(function(){
		$('#button').on('click',function(e){
			let button = $('#button').val();
			$.ajax({
				url: button,
				type:'GET',
				success: function(response){
					let template = 
					`<div>
						${response}
					</div>`;

					$('#contenido').html(template);
				}
			})
		})
		$('#button2').on('click',function(e){
			let button = $('#button2').val();
			$.ajax({
				url: button,
				type:'GET',
				success: function(response){
					let template = 
					`<div>
						${response}
					</div>`;

					$('#contenido').html(template);
				}
			})
		})
	})