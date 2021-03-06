<?php
date_default_timezone_set("America/Lima");
$user = UserData::getById(Session::getUID());
$spents=null;
$category = null;
if(!isset($_GET["cat_id"])){
$spents = SpentData::getAllByDate(date("Y-m-d",time()));
}else{
$spents = SpentData::getAllByDateAndCategoryId(date("Y-m-d",time()),$_GET["cat_id"]);
$category = CategoryData::getById($_GET["cat_id"]);
}
$money = 0;
 foreach($spents as $career){ $money += $career->price; }?>
<section class="content-header">
  <h1>Gastos de dia</h1>
<ol class="breadcrumb">
                        <li> Categoria</li>
                        <li class="active"><?php if($category==null){ echo "Todas"; }else { echo $category->name; }?></li>
                    </ol>
</section>
<section class="content">
<div class="row">
<div class="col-md-3">
<div class="panel panel-default">
    <div class="panel-heading">
        Categorias
    </div>
	<div class="list-group">
  <a class='list-group-item' href="index.php?view=spents"><?php if($category==null): ?><i class="glyphicon glyphicon-ok"></i> <?php endif; ?>Todas</a>
<?php foreach(CategoryData::getAll() as $cat):?>
  <a class='list-group-item' href="index.php?view=spents&cat_id=<?php echo $cat->id; ?>"><?php if( $category!=null && ($category->id==$cat->id)): ?><i class="glyphicon glyphicon-ok"></i> <?php endif; ?><?php echo $cat->name; ?></a>
<?php endforeach; ?>
	</div>
</div>
</div>
	<div class="col-md-9">
	<div class="row">
<div class="col-md-8">
<br><br>		<div class="row">
			<div class="col-md-9">

			</div>
			<div class="col-md-3"><a data-toggle="modal" href="#myModal"  class="btn btn-block btn-primary">Agregar Gasto</a></div>
		</div>
<br>	
  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Agregar Gasto</h4>
        </div>
        <div class="modal-body">
		<form class="form-horizontal" method="post" id="addproduct" action="index.php?view=addspent" role="form">
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">Producto*</label>
    <div class="col-md-6">
      <input type="text" name="name" class="form-control" id="name" placeholder="Escriba el concepto">
    </div>
  </div>

  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">Cantidad*</label>
    <div class="col-md-6">
      <input type="text" name="q" class="form-control" id="q" placeholder="Escriba el concepto">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">Unidad*</label>
    <div class="col-md-6">
      <input type="text" name="unit" class="form-control" id="unit" placeholder="Escriba el concepto">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">Costo*</label>
    <div class="col-md-6">
      <input type="text" name="price_out" class="form-control" id="price_out" placeholder="Agregar costo">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">Categoria</label>
    <div class="col-md-6">
<select name="category_id" class="form-control" id="category_id" required>
  <option value="">-- SELECCIONE CATEGORIA --</option>
<?php foreach(CategoryData::getAllActive() as $cat):?>
  <option value="<?php echo $cat->id; ?>"><?php echo $cat->name; ?></option>
<?php endforeach; ?>
</select>
    </div>
  </div>
<p class="alert alert-info">* Campor obligatorios: Producto, Cantidad, Costo</p>

  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
      <button type="submit" class="btn btn-primary">Agregar gasto</button>
    </div>
  </div>
</form>
<script>
  $("#addproduct").submit(function(e){
    if($("#name").val()!=""  && $("#price_out").val()!="" ){

    }else{
    e.preventDefault();
    alert("No debes dejar campos vacios.");
  }

  });
</script>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>
<div class="col-md-4">
<div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        <b>$ <?php echo number_format($money,2,".",","); ?></b>
                                    </h3>
                                    <p>
                                        Gastos
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="javascript:void()" class="small-box-footer">
                                    <?php 
    $months = array("01"=>"Enero","02"=>"Febrero","03"=>"Marzo","04"=>"Abril","05"=>"Mayo","06"=>"Junio","07"=>"Julio","08"=>"Agosto","09"=>"Septiembre","10"=>"Octubre","11"=>"Noviembre","12"=>"Diciembre");
    echo "<b>".date("d")." de ".$months[(date("m"))]." del ".date("Y")."</b>";
    ?> <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>

</div>
</div>


	<?php if(isset($_COOKIE["gradeupdated"])):?>
			<p class="alert alert-success"><i class='glyphicon glyphicon-ok-sign'></i> La categoria <b><?php echo $_COOKIE["gradeupdated"]; ?></b> ha sido actualizada exitosamente.</p>
		<?php 
		setcookie("gradeupdated","",time()-18600);
		endif; ?>

	<?php if(isset($_COOKIE["gradedeleted"])):?>
			<p class="alert alert-danger"><i class='glyphicon glyphicon-minus-sign'></i> La categoria <b><?php echo $_COOKIE["gradedeleted"]; ?></b> ha sido eliminada exitosamente.</p>
		<?php 
		setcookie("gradedeleted","",time()-18600);
		endif; ?>
		<?php if(isset($_COOKIE["gradeadded"])):?>
			<p class="alert alert-info"><i class='glyphicon glyphicon-ok-sign'></i> La categoria <b><?php echo $_COOKIE["gradeadded"]; ?></b> ha sido agregada exitosamente.</p>
		<?php 
		setcookie("gradeadded","",time()-18600);
		endif; ?>
<?php if(count($spents)>0):?>
<div class="box box-solid box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"></h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-primary btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body table-responsive">
<table class="table table-bordered table-hover datatable">
<thead>
	<th>Cant.</th>
	<th>Unidad</th>
	<th>Nombre</th>
	<th>Costo</th>
	<th>Categoria</th>
	<th>Fecha</th>
	<th></th>
</thead>
<?php foreach($spents as $career):?>
<tr>
	<td><?php echo $career->q; ?></td>
	<td><?php echo $career->unit; ?></td>
	<td><b><?php echo $career->concept; ?></b></td>
	<td style="width:170px;"><?php echo " $ ".$career->price; ?></td>
	<td><?php echo $career->name; ?></td>
	<td style="width:170px;"><?php echo $career->created_at; ?></td>
	<td style="width:50px;">
		<a href="#" id="del-<?php echo $career->id; ?>" class="btn btn-sm btn-danger"><i class='glyphicon glyphicon-trash'></i></a>
<script>
	$("#del-<?php echo $career->id?>").click(function(){
		c = confirm("Seguro quieres eliminar ??");
		if(c==true){
			window.location = "index.php?view=delspent&id=<?php echo $career->id; ?>";
		}
	});
</script>
	</td>
</tr>
<?php endforeach; ?>
</table>
</div>
</div>
<?php else: // no careers ?>
<div class="jumbotron">
	<h2><i class="glyphicon glyphicon-minus-sign"></i> No hay gastos </h2>
</div>
<?php endif; ?>
	</div>
</div>
</section>