<div class="container">
<form action="?controller=orderdetails&action=insertorders" method="POST">
  <div class="form-group">
    <label for="productCode">Product Code:</label>
    <input type="text" class="form-control" name="productCode">
  </div>
  <div class="form-group">
    <label for="quantityOrdered">Quantity Ordered:</label>
    <input type="text" class="form-control" name="quantityOrdered">
  </div>
  <div class="form-group">
    <label for="priceEach">Price Each:</label>
    <input type="text" class="form-control" name="priceEach">
  </div>
  <div class="form-group">
    <label for="orderLineNumber">Order Line Number:</label>
    <input type="text" class="form-control" name="orderLineNumber" >
  </div>
    <button type="submit" class="btn btn-default">Confirm</button>
</form> 
</div>