<?php
  class ProductsController {
    public function index() {
      // we store all the posts in a variable
      $products = Products::all();
      require_once('views/products/index.php');
    }
  
    public function verifyinsert(){
      require_once('views/products/insert.php');
    }

    public function insertproducts()
    {
      Products::insertproducts($_POST['productName'],$_POST['productLine'],$_POST['productScale'],$_POST['productVendor'],
      $_POST['productDescription'],$_POST['quantityInStock'],$_POST['buyPrice'],$_POST['MSRP']);
     return call('products', 'index');
    }
  
  public function verifyupdate()
  {
    if (!isset($_GET['pC']))
          return call('pages', 'error');
    $products = Products::find($_GET['pC']);
    require_once('views/products/update.php');
  }

  public function updateproducts()
  {
    if (!isset($_POST['pC']))
      return call('pages', 'error');
      Products::updateproducts($_POST['pC'],$_POST['productName'],$_POST['productLine'],$_POST['productScale'],$_POST['productVendor'],
   $_POST['productDescription'],$_POST['quantityInStock'],$_POST['buyPrice'],$_POST['MSRP']);
   return call('products', 'index');
  }

	public function delete() {
      if (!isset($_GET['pC']))
        return call('pages', 'error');
        Products::deleteproducts($_GET['pC']);
      return call('products', 'index');
    }

    public function verifydelete(){
      if (!isset($_GET['pC']))
          return call('pages', 'error');
          require_once('views/products/delete.php');
      }
  }
 ?>