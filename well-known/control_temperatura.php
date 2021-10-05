<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
    header('Location: login.php');
}
 include('templates/header.php');?>

<div class="mt-5">
    <div class="container">
        <div class="content">
            <div style="display:flex;justify-content:space-between">
            <h3>Control y Temperatura</h3>
            <div class="card">
                <div class="card-body">
                    <h5>Colores : </h5>
                    <div style="  float: left;width: 20px;height: 20px;margin: 5px;border: 1px solid rgba(0, 0, 0, .2);background: #ddd;"></div><span> No realizado</span><br><br>
                    <div style="  float: left;width: 20px;height: 20px;margin: 5px;border: 1px solid rgba(0, 0, 0, .2);background: #ff00006b;"></div><span>Temperatura superior a 37</span><br><br>
                    <div style="  float: left;width: 20px;height: 20px;margin: 5px;border: 1px solid rgba(0, 0, 0, .2);background: #00800061;"></div><span>Temperatura inferior a 37</span><br>
                </div>
                
            </div>
            </div>
          
            <form>
                <div class="form-gruop">
                    <?php include 'templates/postulantes_lista.php' ?>
                </div>
                <button id="button" type="button" class="btn btn-bapp mt-4">Buscar</button>
            </form>
        </div>
    </div>
</div>
<div class="mt-5">
    <div class="container">
        <div class="content">
            <div id="contenido">
                
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){
        $('#button').on('click',function(e){
            let postulante = $('#postulante').val();
            let url = 'templates/control_temperatura/control_temperatura.php?postulante='+postulante;
            $.ajax({
                url: url,
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
</script>
<?php include('templates/footer.php');?>