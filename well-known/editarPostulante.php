<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include('templates/header.php');
include('vendor/autoload.php'); 
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$postulante = DB::table('postulante')
->where('id', '=', $_GET['id'])
->get();
$array = json_decode(json_encode($postulante), True);

//llamado a los cargos
$cargo_postular = json_decode(json_encode(DB::table('cargo_postular')->get()),True);

?>

<style type="text/css">
	.sideA{
		font-size: 15px;
		color: #007bff;
	}
</style>
<section class="mt-5">
	<div class="container">
		<div class="content">
			<form action="app/Controllers/updatePostul.php" method="post" enctype="multipart/form-data">
			<?php
			foreach ($array as $row) {
				?>
				<div class="row">
					<div class="col-md-4">
					    
					    
					        <?php 
					        
					        $nperson = $row['name'];
					        ?>
							<h3 style="font-size:25px" ><?php echo ucwords($nperson);?></h3>
							
							
							<img src="archivos/<?php echo $row['img'];?>" class="float-left img_profile_bapp" alt="..." width="250">
						<div class="form-group">
							<label class="mt-2" for="photo">Cambiar la foto</label>
							<input type="file" name="photo" placeholder="Cambiar la foto" class="form-control">
						</div>
						<div id="status" class="mt-1" style="font-size: 15px">
							<label>Satus:</label>
							<span><?php echo strtoupper($row['disponible']); ?></span>
						</div>
						<div class="form-group">
							<a class="sideA" href="agendarCita.php?id=<?php echo $row['id'];?>&name=<?php echo $row['name'];?>&lastname=<?php echo $row['lastname'];?>">Agendar Entrevista</a>
						</div>
						<div class="form-group">
							<a class="sideA" href="documentaria.php?id=<?php echo $row['id']; ?>">Documentaria</a>
						</div>
						<div class="form-group">
							<a class="sideA" href="Examenes.php?id=<?php echo $row['id']; ?>">Examenes</a>
						</div>
					</div>

					<div class="col-md-8">
					    <a class="btn btn-bapp mt-3" style="float:right;margin:10px" href="index.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                        </svg></a>
						<div class="title" style="font-size: 20px;margin:10px">
							Detalle del postulante/usuario
						</div>
							        <?php 
                if(isset($_SESSION['u'])){ ?>
                    <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['u'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                <span aria-hidden='true'>&times;</span>
              </button></div><?php unset($_SESSION['u']);
                 }?>
						
							<div class="row mt-3">
								<div class="col-md-6">
									<div class="form-group">
										<input type="hidden" name="id" value="<?php echo $_GET['id'];?>">
										<label for="name">Nombre</label>
										<input type="text" name="name" class="form-control" value="<?php echo ucwords($row['name']);?>">
									</div>
								
									<div class="form-group">
										<label for="inlineFormCustomSelect">Genero</label>
										<select name="genere" class="form-control" id="genere">
											<option value = "0" selected>Seleccionado: <?php echo ucwords($row['genere']);?></option>
											<option value="masculino">Masculino</option>
											<option value="femenino">Femenino</option>
										</select>
									</div>
									<div class="form-group">
										<label for="address">Direccion</label>
										<input type="text" name="address"class="form-control" value="<?php echo ucwords($row['address']);?>">
									</div>
									
									<div class="form-group">
										<label for="pais">Nacionalidad</label>
                                        <select name="pais" class="form-control" id="country">
<option value="0" id="AF">Seleccionado: <?php echo strtoupper($row['country']);?></option>
<option value="Afganist??n" id="AF">Afganist??n</option>
<option value="Albania" id="AL">Albania</option>
<option value="Alemania" id="DE">Alemania</option>
<option value="Andorra" id="AD">Andorra</option>
<option value="Angola" id="AO">Angola</option>
<option value="Anguila" id="AI">Anguila</option>
<option value="Ant??rtida" id="AQ">Ant??rtida</option>
<option value="Antigua y Barbuda" id="AG">Antigua y Barbuda</option>
<option value="Antillas holandesas" id="AN">Antillas holandesas</option>
<option value="Arabia Saud??" id="SA">Arabia Saud??</option>
<option value="Argelia" id="DZ">Argelia</option>
<option value="Argentina" id="AR">Argentina</option>
<option value="Armenia" id="AM">Armenia</option>
<option value="Aruba" id="AW">Aruba</option>
<option value="Australia" id="AU">Australia</option>
<option value="Austria" id="AT">Austria</option>
<option value="Azerbaiy??n" id="AZ">Azerbaiy??n</option>
<option value="Bahamas" id="BS">Bahamas</option>
<option value="Bahrein" id="BH">Bahrein</option>
<option value="Bangladesh" id="BD">Bangladesh</option>
<option value="Barbados" id="BB">Barbados</option>
<option value="B??lgica" id="BE">B??lgica</option>
<option value="Belice" id="BZ">Belice</option>
<option value="Ben??n" id="BJ">Ben??n</option>
<option value="Bermudas" id="BM">Bermudas</option>
<option value="Bhut??n" id="BT">Bhut??n</option>
<option value="Bielorrusia" id="BY">Bielorrusia</option>
<option value="Birmania" id="MM">Birmania</option>
<option value="Bolivia" id="BO">Bolivia</option>
<option value="Bosnia y Herzegovina" id="BA">Bosnia y Herzegovina</option>
<option value="Botsuana" id="BW">Botsuana</option>
<option value="Brasil" id="BR">Brasil</option>
<option value="Brunei" id="BN">Brunei</option>
<option value="Bulgaria" id="BG">Bulgaria</option>
<option value="Burkina Faso" id="BF">Burkina Faso</option>
<option value="Burundi" id="BI">Burundi</option>
<option value="Cabo Verde" id="CV">Cabo Verde</option>
<option value="Camboya" id="KH">Camboya</option>
<option value="Camer??n" id="CM">Camer??n</option>
<option value="Canad??" id="CA">Canad??</option>
<option value="Chad" id="TD">Chad</option>
<option value="Chile" id="CL">Chile</option>
<option value="China" id="CN">China</option>
<option value="Chipre" id="CY">Chipre</option>
<option value="Ciudad estado del Vaticano" id="VA">Ciudad estado del Vaticano</option>
<option value="Colombia" id="CO">Colombia</option>
<option value="Comores" id="KM">Comores</option>
<option value="Congo" id="CG">Congo</option>
<option value="Corea" id="KR">Corea</option>
<option value="Corea del Norte" id="KP">Corea del Norte</option>
<option value="Costa del Marf??l" id="CI">Costa del Marf??l</option>
<option value="Costa Rica" id="CR">Costa Rica</option>
<option value="Croacia" id="HR">Croacia</option>
<option value="Cuba" id="CU">Cuba</option>
<option value="Dinamarca" id="DK">Dinamarca</option>
<option value="Djibouri" id="DJ">Djibouri</option>
<option value="Dominica" id="DM">Dominica</option>
<option value="Ecuador" id="EC">Ecuador</option>
<option value="Egipto" id="EG">Egipto</option>
<option value="El Salvador" id="SV">El Salvador</option>
<option value="Emiratos Arabes Unidos" id="AE">Emiratos Arabes Unidos</option>
<option value="Eritrea" id="ER">Eritrea</option>
<option value="Eslovaquia" id="SK">Eslovaquia</option>
<option value="Eslovenia" id="SI">Eslovenia</option>
<option value="Espa??a" id="ES">Espa??a</option>
<option value="Estados Unidos" id="US">Estados Unidos</option>
<option value="Estonia" id="EE">Estonia</option>
<option value="c" id="ET">Etiop??a</option>
<option value="Ex-Rep??blica Yugoslava de Macedonia" id="MK">Ex-Rep??blica Yugoslava de Macedonia</option>
<option value="Filipinas" id="PH">Filipinas</option>
<option value="Finlandia" id="FI">Finlandia</option>
<option value="Francia" id="FR">Francia</option>
<option value="Gab??n" id="GA">Gab??n</option>
<option value="Gambia" id="GM">Gambia</option>
<option value="Georgia" id="GE">Georgia</option>
<option value="Georgia del Sur y las islas Sandwich del Sur" id="GS">Georgia del Sur y las islas Sandwich del Sur</option>
<option value="Ghana" id="GH">Ghana</option>
<option value="Gibraltar" id="GI">Gibraltar</option>
<option value="Granada" id="GD">Granada</option>
<option value="Grecia" id="GR">Grecia</option>
<option value="Groenlandia" id="GL">Groenlandia</option>
<option value="Guadalupe" id="GP">Guadalupe</option>
<option value="Guam" id="GU">Guam</option>
<option value="Guatemala" id="GT">Guatemala</option>
<option value="Guayana" id="GY">Guayana</option>
<option value="Guayana francesa" id="GF">Guayana francesa</option>
<option value="Guinea" id="GN">Guinea</option>
<option value="Guinea Ecuatorial" id="GQ">Guinea Ecuatorial</option>
<option value="Guinea-Bissau" id="GW">Guinea-Bissau</option>
<option value="Hait??" id="HT">Hait??</option>
<option value="Holanda" id="NL">Holanda</option>
<option value="Honduras" id="HN">Honduras</option>
<option value="Hong Kong R. A. E" id="HK">Hong Kong R. A. E</option>
<option value="Hungr??a" id="HU">Hungr??a</option>
<option value="India" id="IN">India</option>
<option value="Indonesia" id="ID">Indonesia</option>
<option value="Irak" id="IQ">Irak</option>
<option value="Ir??n" id="IR">Ir??n</option>
<option value="Irlanda" id="IE">Irlanda</option>
<option value="Isla Bouvet" id="BV">Isla Bouvet</option>
<option value="Isla Christmas" id="CX">Isla Christmas</option>
<option value="Isla Heard e Islas McDonald" id="HM">Isla Heard e Islas McDonald</option>
<option value="Islandia" id="IS">Islandia</option>
<option value="Islas Caim??n" id="KY">Islas Caim??n</option>
<option value="Islas Cook" id="CK">Islas Cook</option>
<option value="Islas de Cocos o Keeling" id="CC">Islas de Cocos o Keeling</option>
<option value="Islas Faroe" id="FO">Islas Faroe</option>
<option value="Islas Fiyi" id="FJ">Islas Fiyi</option>
<option value="Islas Malvinas Islas Falkland" id="FK">Islas Malvinas Islas Falkland</option>
<option value="Islas Marianas del norte" id="MP">Islas Marianas del norte</option>
<option value="Islas Marshall" id="MH">Islas Marshall</option>
<option value="Islas menores de Estados Unidos" id="UM">Islas menores de Estados Unidos</option>
<option value="Islas Palau" id="PW">Islas Palau</option>
<option value="Islas Salom??n" d="SB">Islas Salom??n</option>
<option value="Islas Tokelau" id="TK">Islas Tokelau</option>
<option value="Islas Turks y Caicos" id="TC">Islas Turks y Caicos</option>
<option value="Islas V??rgenes EE.UU." id="VI">Islas V??rgenes EE.UU.</option>
<option value="Islas V??rgenes Reino Unido" id="VG">Islas V??rgenes Reino Unido</option>
<option value="Israel" id="IL">Israel</option>
<option value="Italia" id="IT">Italia</option>
<option value="Jamaica" id="JM">Jamaica</option>
<option value="Jap??n" id="JP">Jap??n</option>
<option value="Jordania" id="JO">Jordania</option>
<option value="Kazajist??n" id="KZ">Kazajist??n</option>
<option value="Kenia" id="KE">Kenia</option>
<option value="Kirguizist??n" id="KG">Kirguizist??n</option>
<option value="Kiribati" id="KI">Kiribati</option>
<option value="Kuwait" id="KW">Kuwait</option>
<option value="Laos" id="LA">Laos</option>
<option value="Lesoto" id="LS">Lesoto</option>
<option value="Letonia" id="LV">Letonia</option>
<option value="L??bano" id="LB">L??bano</option>
<option value="Liberia" id="LR">Liberia</option>
<option value="Libia" id="LY">Libia</option>
<option value="Liechtenstein" id="LI">Liechtenstein</option>
<option value="Lituania" id="LT">Lituania</option>
<option value="Luxemburgo" id="LU">Luxemburgo</option>
<option value="Macao R. A. E" id="MO">Macao R. A. E</option>
<option value="Madagascar" id="MG">Madagascar</option>
<option value="Malasia" id="MY">Malasia</option>
<option value="Malawi" id="MW">Malawi</option>
<option value="Maldivas" id="MV">Maldivas</option>
<option value="Mal??" id="ML">Mal??</option>
<option value="Malta" id="MT">Malta</option>
<option value="Marruecos" id="MA">Marruecos</option>
<option value="Martinica" id="MQ">Martinica</option>
<option value="Mauricio" id="MU">Mauricio</option>
<option value="Mauritania" id="MR">Mauritania</option>
<option value="Mayotte" id="YT">Mayotte</option>
<option value="M??xico" id="MX">M??xico</option>
<option value="Micronesia" id="FM">Micronesia</option>
<option value="Moldavia" id="MD">Moldavia</option>
<option value="M??naco" id="MC">M??naco</option>
<option value="Mongolia" id="MN">Mongolia</option>
<option value="Montserrat" id="MS">Montserrat</option>
<option value="Mozambique" id="MZ">Mozambique</option>
<option value="Namibia" id="NA">Namibia</option>
<option value="Nauru" id="NR">Nauru</option>
<option value="Nepal" id="NP">Nepal</option>
<option value="Nicaragua" id="NI">Nicaragua</option>
<option value="N??ger" id="NE">N??ger</option>
<option value="Nigeria" id="NG">Nigeria</option>
<option value="Niue" id="NU">Niue</option>
<option value="Norfolk" id="NF">Norfolk</option>
<option value="Noruega" id="NO">Noruega</option>
<option value="Nueva Caledonia" id="NC">Nueva Caledonia</option>
<option value="Nueva Zelanda" id="NZ">Nueva Zelanda</option>
<option value="Om??n" id="OM">Om??n</option>
<option value="Panam??" id="PA">Panam??</option>
<option value="Papua Nueva Guinea" id="PG">Papua Nueva Guinea</option>
<option value="Paquist??n" id="PK">Paquist??n</option>
<option value="Paraguay" id="PY">Paraguay</option>
<option value="Per??" id="PE">Per??</option>
<option value="Pitcairn" id="PN">Pitcairn</option>
<option value="Polinesia francesa" id="PF">Polinesia francesa</option>
<option value="Polonia" id="PL">Polonia</option>
<option value="Portugal" id="PT">Portugal</option>
<option value="Puerto Rico" id="PR">Puerto Rico</option>
<option value="Qatar" id="QA">Qatar</option>
<option value="Reino Unido" id="UK">Reino Unido</option>
<option value="Rep??blica Centroafricana" id="CF">Rep??blica Centroafricana</option>
<option value="Rep??blica Checa" id="CZ">Rep??blica Checa</option>
<option value="Rep??blica de Sud??frica" id="ZA">Rep??blica de Sud??frica</option>
<option value="Rep??blica Democr??tica del Congo Zaire" id="CD">Rep??blica Democr??tica del Congo Zaire</option>
<option value="Rep??blica Dominicana" id="DO">Rep??blica Dominicana</option>
<option value="Reuni??n" id="RE">Reuni??n</option>
<option value="Ruanda" id="RW">Ruanda</option>
<option value="Rumania" id="RO">Rumania</option>
<option value="Rusia" id="RU">Rusia</option>
<option value="Samoa" id="WS">Samoa</option>
<option value="Samoa occidental" id="AS">Samoa occidental</option>
<option value="San Kitts y Nevis" id="KN">San Kitts y Nevis</option>
<option value="San Marino" id="SM">San Marino</option>
<option value="San Pierre y Miquelon" id="PM">San Pierre y Miquelon</option>
<option value="San Vicente e Islas Granadinas" id="VC">San Vicente e Islas Granadinas</option>
<option value="Santa Helena" id="SH">Santa Helena</option>
<option value="Santa Luc??a" id="LC">Santa Luc??a</option>
<option value="Santo Tom?? y Pr??ncipe" id="ST">Santo Tom?? y Pr??ncipe</option>
<option value="Senegal" id="SN">Senegal</option>
<option value="Serbia y Montenegro" id="YU">Serbia y Montenegro</option>
<option value="Sychelles" id="SC">Seychelles</option>
<option value="Sierra Leona" id="SL">Sierra Leona</option>
<option value="Singapur" id="SG">Singapur</option>
<option value="Siria" id="SY">Siria</option>
<option value="Somalia" id="SO">Somalia</option>
<option value="Sri Lanka" id="LK">Sri Lanka</option>
<option value="Suazilandia" id="SZ">Suazilandia</option>
<option value="Sud??n" id="SD">Sud??n</option>
<option value="Suecia" id="SE">Suecia</option>
<option value="Suiza" id="CH">Suiza</option>
<option value="Surinam" id="SR">Surinam</option>
<option value="Svalbard" id="SJ">Svalbard</option>
<option value="Tailandia" id="TH">Tailandia</option>
<option value="Taiw??n" id="TW">Taiw??n</option>
<option value="Tanzania" id="TZ">Tanzania</option>
<option value="Tayikist??n" id="TJ">Tayikist??n</option>
<option value="Territorios brit??nicos del oc??ano Indico" id="IO">Territorios brit??nicos del oc??ano Indico</option>
<option value="Territorios franceses del sur" id="TF">Territorios franceses del sur</option>
<option value="Timor Oriental" id="TP">Timor Oriental</option>
<option value="Togo" id="TG">Togo</option>
<option value="Tonga" id="TO">Tonga</option>
<option value="Trinidad y Tobago" id="TT">Trinidad y Tobago</option>
<option value="T??nez" id="TN">T??nez</option>
<option value="Turkmenist??n" id="TM">Turkmenist??n</option>
<option value="Turqu??a" id="TR">Turqu??a</option>
<option value="Tuvalu" id="TV">Tuvalu</option>
<option value="Ucrania" id="UA">Ucrania</option>
<option value="Uganda" id="UG">Uganda</option>
<option value="Uruguay" id="UY">Uruguay</option>
<option value="Uzbekist??n" id="UZ">Uzbekist??n</option>
<option value="Vanuatu" id="VU">Vanuatu</option>
<option value="Venezuela" id="VE">Venezuela</option>
<option value="Vietnam" id="VN">Vietnam</option>
<option value="Wallis y Futuna" id="WF">Wallis y Futuna</option>
<option value="Yemen" id="YE">Yemen</option>
<option value="Zambia" id="ZM">Zambia</option>
<option value="Zimbabue" id="ZW">Zimbabue</option>
</select>
									</div>
									
									<div class="form-group">
										<label>Cargo a postular</label>
            						  	<select name="cargo_postular" id="cargo_postular" class="form-control" required>
            						  	    <option value="<?php echo $row['cargo_postular'];?>">Seleccionado: <?php echo ucwords($row['cargo_postular']);?></option>
            						  	    <?php foreach($cargo_postular as $r){?>
            						  	        <option value="<?php echo $r['name'];?>"><?php echo ucwords($r['name']);?></option>
            						  	    <?php } ?>
            						  	</select>
									</div>
									
									<div class="form-group">
										<label for="nivel_educacion">Nivel de Estudio</label>
										<input type="text" name="nivel_educacion"class="form-control" value="<?php echo ucwords($row['nivel_educacion']);?>">
									</div>
									
								
								</div>
								<div class="col-md-6">
								    <div class="form-group">
										<label for="rut">Rut</label>
										<input type="text" name="rut" class="form-control" value="<?php echo $row['rut'];?>">
									</div>
									
									
									<input name="lastname" type="hidden" id="lastname" type="text" class="form-control" placeholder="Doe" value="<?php echo ucwords($row['lastname']);?>" required>
								
									
									<div class="form-group">
										<label for="date">Fecha de nacimiento</label>
										<input type="date" name="date"class="form-control" id="date" value="<?php echo $row['date_born'];?>">
									</div>
									<div class="form-group">
										<label for="email">Email</label>
										<input type="text" name="email" class="form-control" id="email" value="<?php echo ucwords($row['email']);?>"  placeholder="example@mail.com" require>
									</div>
									<div class="form-group">
										<label for="phone">Telefono</label>
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">+56</div>
											</div>
											<input type="tel" name="phone" class="form-control" placeholder="9999999" id="tel" value="<?php echo $row['phone'];?>">
										</div>
									</div>
									<div class="form-group">
										<label for="city">Comuna</label>
										<input type="text" name="city" id="city" class="form-control" value="<?php echo ucwords($row['city']);?>" required>
									</div>
									<div class="form-group">
										<label for="fpostulacion">Fecha de postulacion</label>
										<input type="text" name="fpostulacion" id="fpostulacion" class="form-control" value="<?php echo $row['date'];?>" readonly>
									</div>
								</div>
							</div>
    						
							<button type="submit" name="btn" class="btn btn-bapp btn-block mt-5" data-toggle="modal" data-target="#staticBackdrop">
								Enviar
							</button>
						</form>
					</div>
				</div>
			<?php }?>
		</div>
	</div>
</section>




<?php include 'templates/footer.php'?>