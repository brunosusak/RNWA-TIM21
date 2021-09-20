	<div class="container">
	<br>
    <center><h1>Products</h1></center>
	<br>
  <div class="mb-2">
  <a class="btn btn-primary" href="?controller=products&action=verifyinsert" role="button">Add New</a>
  </div>

  <div class="table-responsive"> 
    <table class="table">
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Product Line</th>
            <th>Product Scale</th>
            <th>Product Vendor</th>
            <th>Product Description</th>
            <th>Quantity In Stock</th>
            <th>Buy Price</th>
            <th>Msrp</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <?php foreach ($products as $row): ?>
        <tr>
            <td><?php echo $row->productCode ?></td>
            <td><?php echo $row->productName ?></td>
            <td><?php echo $row->productLine ?></td>
            <td><?php echo $row->productScale ?></td>
            <td><?php echo $row->productVendor ?></td>
            <td><?php echo $row->productDescription ?></td>
            <td><?php echo $row->quantityInStock ?></td>
            <td><?php echo $row->buyPrice ?></td>
            <td><?php echo $row->MSRP ?></td>
            <td><a href="?controller=products&action=verifyupdate&pC=<?php echo $row->productCode?>" class="btn btn-primary btn-xs"> Edit</a></td>
            <td><a href="?controller=products&action=verifydelete&pC=<?php echo $row->productCode?>" class="btn btn-danger btn-xs"> Delete</a></td>

        </tr>
        <?php endforeach ?>
    </table>
	</div>
  </div>
 
    
