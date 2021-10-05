<?php 
include('../../vendor/autoload.php');
include('../../app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$tblcita_presencial = DB::table('tblcita_telefonica')->where('status', '=',$_POST['status'])->get();
$array = json_decode(json_encode($tblcita_presencial), True);
?>


  <?php
  $i = 1;
	foreach($array as $row) {
	?>
	<?php
	
	 $pe = json_decode(json_encode(DB::table('postulante')->where('id', '=', $row['id_postulante'])->select('name', 'rut', 'lastname')->get()), True);
      foreach($pe as $p){
          $namep = $p['name'];
          $lastnamep = $p['lastname'];
          $rutp = $p['rut'];
      }
	?>
    <tr>
      <th scope="row"><?php echo $i;?></th>
      <td><?php echo $row['fecha'];?></td>
      <td><?php echo $row['time'];?></td>

      <td><?php echo strtoupper($row['link']);?></td>
       <td> <?php echo $rutp;?></td>
      <td> <?php echo strtoupper($namep.' '.$lastnamep);?></td>
      <td><?php echo strtoupper($row['email']);?></td>
      <td><?php echo strtoupper($row['status']);?></td>
      
      <td><?php 

		$status = json_decode(json_encode(DB::table('status_entrevista_telefonica')->where('id_entrevista', '=', $row['id'])->get()), True);
	      foreach($status as $s){
	          $id_status = $s['id'];
	      }
	      
	      
	      if($status){
	            echo "<a href='comentariosTelefonica.php?id=$id_status'>Ver Comentarios</a>";
	      }else{
	          echo "No hay comentarios para esta entrevista";
	      }
	    
          
       

	?></td>
      <td>
      	<a href="calificarEntrevistaTelefonica.php?id=<?php echo $row['Id'];?>&id_postulante=<?php echo $row['id_postulante'];?>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
		</svg></a>
      </td>
      <td>
      	<button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
		  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
		</svg></button>
      </td>
    </tr>
  <?php  $i = $i + 1;  } ?>

