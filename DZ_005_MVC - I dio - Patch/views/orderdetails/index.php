	<div class="container">
	<br>
    <center><h1>Offices</h1></center>
	<br>
  <div class="mb-2">
  <a class="btn btn-primary" href="?controller=orderdetails&action=verifyinsert" role="button">Add New</a>
  </div>

  <div class="table-responsive"> 
    <table class="table">
        <tr>
            <th>Order Number</th>
            <th>Product Code</th>
            <th>Quantity Ordered</th>
            <th>Price Each</th>
            <th>Order Line Number</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <?php foreach ($orderdetails as $row): ?>
        <tr>
            <td><?php echo $row->orderNumber ?></td>
            <td><?php echo $row->productCode ?></td>
            <td><?php echo $row->quantityOrdered ?></td>
            <td><?php echo $row->priceEach ?></td>
            <td><?php echo $row->orderLineNumber ?></td>
            <td><a href="?controller=orderdetails&action=verifyupdate&oD=<?php echo $row->orderNumber?>" class="btn btn-primary btn-xs"> Edit</a></td>
            <td><a href="?controller=orderdetails&action=verifydelete&oD=<?php echo $row->orderNumber?>" class="btn btn-danger btn-xs"> Delete</a></td>

        </tr>
        <?php endforeach ?>
    </table>
	</div>
  </div>
 
    
