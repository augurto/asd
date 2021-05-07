<div class="content">
<!--
<h1>Resumen de Venta</h1>
-->

<?php if(isset($_GET["id"]) && $_GET["id"]!=""):?>
<?php
$sell = SellData::getById($_GET["id"]);
$mesero = UserData::getById($sell->mesero_id);
$cajero= null;
if($sell->is_applied){
$cajero = UserData::getById($sell->cajero_id);
}
$operations = OperationData::getAllProductsBySellId($_GET["id"]);
$total = 0;
?>
<!-- aca solo muestra el id de las mesas
<h2>Mesa: #<?php echo $sell->item_id; ?></h2>
-->

<!-- aca comparo el item id si vale 10 mostrara para llevar en caso contrario seguira mostrando el id de cada mesa -->

 <?php 

switch ($sell->item_id) {
    
    case 1:
        echo '<span style="font-size:30px;"> Mesa 1   '.'</span>';
        break;
    case 2:
        echo '<span style="font-size:30px;"> Mesa 2  '.'</span>';
        break;

    case 3:
        echo '<span style="font-size:30px;"> Mesa 3  '.'</span>';
        break;
    case 4:
        echo '<span style="font-size:30px;"> Mesa 4  '.'</span>';
        break;
    case 5:
        echo '<span style="font-size:30px;"> Mesa 5  '.'</span>';
        break;

    case 6:
        echo '<span style="font-size:30px;"> Mesa 6  '.'</span>';
        break;
    case 7:
        echo '<span style="font-size:30px;"> Mesa 7  '.'</span>';
        break;
    case 8:
        echo '<span style="font-size:30px;"> Mesa 8  '.'</span>';
        break;

    case 9:
        echo '<span style="font-size:30px;"> Mesa 9  '.'</span>';
        break;
    case 10:
        echo '<span style="font-size:30px;"> Afuera 1 '.'</span>';
        break;
    case 11:
        echo '<span style="font-size:30px;"> Afuera 2 '.'</span>';
        break;

    case 12:
        echo '<span style="font-size:30px;"> Afuera 3 '.'</span>';
        break;
    case 13:
        echo '<span style="font-size:30px;">Para LLevar '.'</span>';
        break;
    case 14:
        echo '<span style="font-size:30px;"> Z pedidos '.'</span>';
        break;

  
}

//if ($sell->item_id>=13) {
  # code...
//  echo '<span style="font-size:30px;">Para LLevar '.'</span>';
//}
//else{
  
 // echo '<span style="font-size:30px;">Mesa # '.$sell->item_id.'</span>';
//}
  ?>


<h3>Orden: #<?php echo $_GET["id"] ?></h3>

<!--
<h2>Mesero: <?php echo $mesero->name." ".$mesero->lastname; ?></h2>

-->

<?php if(!$sell->is_applied):?>
<!--
<a data-toggle="modal" href="#myModal" class="btn btn-default"><i class="glyphicon glyphicon-plus-sign"></i> Agregar Producto</a>
-->

<?php if(Session::getUID()):?>


  
  




<!--
<a href="index.php?view=applysell&id=<?php echo $_GET["id"]; ?>" class="btn btn-primary"><i class="glyphicon glyphicon-ok-sign"></i> Aplicar Venta al 2</a>
-->

<?php endif; ?>
<div class="clearfix"></div><br>

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Agregar Producto</h4>
        </div>
        <div class="modal-body">
         <form class="form-horizontal" method="post" action="index.php?view=addoperation" role="form">
  <div class="form-group">


    <label for="inputEmail1" class="col-lg-2 control-label">Producto</label>



    <div class="col-lg-10">


<!-- agregar producto-->

<select name="product_id" class="form-control" required>
		<option value="">-- SELECCIONA UN PRODUCTO -- </option>
	<?php foreach(Productdata::getAllActive() as $product):?>
		<option value="<?php echo $product->id; ?>" ><?php echo $product->name; ?>--S/.<?php echo $product->price_out; ?>.00</option>
	<?php endforeach ; ?>
</select>



    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword1" class="col-lg-2 control-label">Cant.</label>
    <div class="col-lg-10">
      <input type="number" class="form-control" name="q" id="inputPassword1" required value="1">
    </div>
  </div>



  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
    <input type="hidden" name="sell_id" value="<?php echo $_GET["id"];?>">
      <button type="submit" class="btn btn-primary">Agregar Producto</button>
    </div>
  </div>







</form>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<?php endif; ?>

<!--

<?php if($sell->is_applied==0):?>
<p class="alert alert-warning"><i class="glyphicon glyphicon-time"></i> Esta venta esta pendiente</p>
<?php else: ?>
<p class="alert alert-info"><i class="glyphicon glyphicon-ok-sign"></i> Esta venta esta completada</p>
<?php endif; ?>
-->



<table class="table table-bordered table-hover">
	<thead>
			<th>Cant.</th>
		<th>PRODUCTOS</th>
		<th>P. unit.</th>
		<th>Total</th>
    <th></th>

	</thead>
<?php
	foreach($operations as $operation){
		$product  = $operation->getProduct();
?>
<tr>

	<td><?php echo $operation->q ;?></td>
	<td><?php echo $product->name ;?></td>
	<td><p>S/ <?php echo number_format($product->price_out );?></b></td>
	<td><b>S/ <?php echo number_format($operation->q*$product->price_out);$total+=$operation->q*$product->price_out;?></p></td>
  <td style="width:90px;">
    <a class="btn btn-warning btn-xs" data-toggle="modal" href="#updateSell-<?php echo $product->id; ?>"><i class="glyphicon glyphicon-pencil"></i> </a>
<?php if(Session::getUID()):?>
    <a href="index.php?view=deletesellitem&operation_id=<?php echo $operation->id; ?>&sell_id=<?php echo $_GET["id"]; ?>" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash"></i> </a>
<?php endif; ?>
  <!-- Button trigger modal -->

  <!-- Modal -->
  <div class="modal fade" id="updateSell-<?php echo $product->id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="imp1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Actualizar: <?php echo $product->name ;?></h4>
        </div>
        <div class="modal-body">
<form class="form-horizontal" method="post" action="index.php?view=updatesellitem" role="form">
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-2 control-label">Producto</label>
    <div class="col-lg-10">
      <input type="text" class="form-control" id="inputEmail1" placeholder="Producto" value="<?php echo $product->name ;?>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword1" class="col-lg-2 control-label">Cantidad</label>
    <div class="col-lg-10">
      <input type="text" class="form-control" id="inputPassword1" name="q" placeholder="Cantidad" value="<?php echo $operation->q ;?>">
    </div>
  </div>
  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
    <input type="hidden" name="product_id" value="<?php echo $product->id; ?>">
    <input type="hidden" name="operation_id" value="<?php echo $operation->id; ?>">
    <input type="hidden" name="sell_id" value="<?php echo $_GET["id"]; ?>">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary">Actualizar</button>
    </div>
  </div>
</form>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  </td>
</tr>
<?php
	}
	?>
</table>
<?php if(Session::getUID()):?>
<?php 
$user = UserData::getById(Session::getUID());
if($user->is_admin):?>

<!--
<a href="index.php?view=removesell&id=<?php echo $_GET["id"]; ?>" class="btn pull-right btn-danger"><i class="glyphicon glyphicon-remove"></i> Cancelar</a>

-->

<?php endif ?>
<?php endif ?>

<!--
<h1>Total: S/ <?php echo number_format($total); ?></h1>
-->



<?php if($sell->is_applied):?>


<!--
<h2>Cajero: <?php echo $cajero->name." ".$cajero->lastname; ?></h2>
-->

<?php endif; ?>
<?php else:?>
	501 Internal Error
<?php endif; ?>


</div>
