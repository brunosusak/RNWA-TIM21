<?php
  class OrderDetailsController {
    public function index() {
      // we store all the posts in a variable
      $orderdetails = OrderDetails::all();
      require_once('views/orderdetails/index.php');
    }
  
    public function verifyinsert(){
      require_once('views/orderdetails/insert.php');
    }

    public function insertorders()
    {
      OrderDetails::insertorders($_POST['productCode'],$_POST['quantityOrdered'],$_POST['priceEach'],$_POST['orderLineNumber']);
     return call('orderdetails', 'index');
    }
  
  public function verifyupdate()
  {
    if (!isset($_GET['oD']))
          return call('pages', 'error');
    $orderdetails = OrderDetails::find($_GET['oD']);
    require_once('views/orderdetails/update.php');
  }

  public function updateorders()
  {
    if (!isset($_POST['oD']))
      return call('pages', 'error');
   OrderDetails::updateorders($_POST['oD'],$_POST['productCode'],$_POST['quantityOrdered'],$_POST['priceEach'],$_POST['orderLineNumber']);
   return call('orderdetails', 'index');
  }

	public function delete() {
      if (!isset($_GET['oD']))
        return call('pages', 'error');
      OrderDetails::deleteorders($_GET['oD']);
      return call('orderdetails', 'index');
    }

    public function verifydelete(){
      if (!isset($_GET['oD']))
          return call('pages', 'error');
          require_once('views/orderdetails/delete.php');
      }
  }
 ?>