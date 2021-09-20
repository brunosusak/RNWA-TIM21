<div class="container">
<form action="?controller=orderdetails&action=updateorders" method="POST">
  <div class="form-group">
    <label for="oD">Order Number:</label>
    <input type="text" readonly class="form-control" name="oD" value=<?php echo $orderdetails->orderNumber?>>
  <div class="form-group">
    <label for="productCode">Product Code:</label>
    <input type="text" readonly class="form-control" name="productCode" value=<?php echo $orderdetails->productCode?>>
  </div>
  <div class="form-group">
    <label for="quantityOrdered">Quantity Ordered:</label>
    <input type="text" class="form-control" name="quantityOrdered" value=<?php echo $orderdetails->quantityOrdered?>>
  </div>
  <div class="form-group">
    <label for="priceEach">Price Each:</label>
    <input type="text" class="form-control" name="priceEach" value=<?php echo $orderdetails->priceEach?>>
  </div>
  <div class="form-group">
    <label for="orderLineNumber">Order Line Number:</label>
    <input type="text" class="form-control" name="orderLineNumber" value=<?php echo $orderdetails->orderLineNumber?>>
  </div>
    <button type="submit" class="btn btn-default">Confirm</button>
</form> 
</div>
