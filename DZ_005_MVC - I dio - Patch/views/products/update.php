<div class="container">
<form action="?controller=products&action=updateproducts" method="POST">
  <div class="form-group">
    <label for="productCode">Product Name:</label>
    <input type="text" readonly class="form-control" name="productCode" value=<?php echo $products->productCode?>>
  </div>
  <div class="form-group">
    <label for="productName">Product Name:</label>
    <input type="text" class="form-control" name="productName" value=<?php echo $products->productName?>>
  </div>
  <div class="form-group">
    <label for="productLine">Product Line:</label>
    <input type="text" class="form-control" name="productLine" value=<?php echo $products->productLine?>>
  </div>
  <div class="form-group">
    <label for="productScale">Product Scale:</label>
    <input type="text" class="form-control" name="productScale" value=<?php echo $products->productScale?>>
  </div>
  <div class="form-group">
    <label for="productVendor">Product Vendor:</label>
    <input type="text" class="form-control" name="productVendor" value=<?php echo $products->productVendor?>>
  </div>
  <div class="form-group">
    <label for="productDescription">Product Description:</label>
    <input type="text" class="form-control" name="productDescription" value=<?php echo $products->productDescription?>>
  </div>
  <div class="form-group">
    <label for="quantityInStock">Quantity In Stock:</label>
    <input type="text" class="form-control" name="quantityInStock" value=<?php echo $products->quantityInStock?>>
  </div>
  <div class="form-group">
    <label for="buyPrice">Buy Price:</label>
    <input type="text" class="form-control" name="buyPrice" value=<?php echo $products->buyPrice?>>
  </div>
  <div class="form-group">
    <label for="MSRP">MSRP:</label>
    <input type="text" class="form-control" name="MSRP" value=<?php echo $products->MSRP?>>
  </div>
    <button type="submit" class="btn btn-default">Confirm</button>
</form> 
</div>
