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
            <h3>Sanitizacion</h3>
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
            let url = 'templates/sanitizacion/sanitizacion.php?postulante='+postulante;
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