<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-7">
					<h2 style="font-weight: bold" class="mb-3">Desvinculacion Personal(Finiquito con firma notariada)</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form method="post" action="app/Controllers/desvincular.php" enctype="multipart/form-data">
						<div class="form-gruop">
							<label>Finiquito con firma notariada</label>
							<input type="file" name="archivo" class="form-control">
							<input type="hidden" name="id" value="<?php echo $_GET['id'];?>">
							<input type="hidden" name="f">
						</div>
					<button class="mt-3 btn btn-block btn-primary" name="btn" type="submit">Guardar</button>
				</form>
			</div>
		</div>

	</div>
</div>
</div>