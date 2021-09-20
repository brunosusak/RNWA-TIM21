<?php
  class Products{
    // we define 3 attributes
    // they are public so that we can access them using $post->author directly
    public $productCode;
    public $productName;
    public $productLine;
    public $productScale;
    public $productVendor;
    public $productDescription;
    public $quantityInStock;
    public $buyPrice;
    public $MSRP;

    public function __construct($productCode, $productName, $productLine, $productScale, $productVendor, $productDescription, $quantityInStock, $buyPrice, $MSRP) {
      $this->productCode = $productCode;
      $this->productName = $productName;
      $this->productLine = $productLine;
      $this->productScale = $productScale;
      $this->productVendor = $productVendor;
      $this->productDescription = $productDescription;
      $this->quantityInStock = $quantityInStock;
      $this->buyPrice = $buyPrice;
      $this->MSRP = $MSRP;           
    }

    public static function all() {
      $list = [];
      $db = Db::getInstance();
      $req = $db->query('SELECT * FROM products');
      // we create a list of Post objects from the database results
      foreach($req->fetchAll() as $pC) {
        $list[] = new Products($pC['productCode'], $pC['productName'], $pC['productLine'], $pC['productScale'], $pC['productVendor'], $pC['productDescription'], $pC['quantityInStock'], $pC['buyPrice'], $pC['MSRP']);
      }
      return $list;
    }

    public static function find($pC) {
      $db = Db::getInstance();
      $req = $db->prepare('SELECT * FROM products WHERE productCode = :pC');
      $req->execute(array('pC' => $pC));
      $orderDetails = $req->fetch();

      return new Products($pC['productCode'], $pC['productName'], $pC['productLine'], $pC['productScale'], $pC['productVendor'],$pC['productDescription'], $pC['quantityInStock'], $pC['buyPrice'], $pC['MSRP']);
    }

    public static function insertproducts($productName,$productLine,$productScale,$productVendor,$productDescription,$quantityInStock,$buyPrice,$MSRP) {
      $db = Db::getInstance();
      $quantityInStock = intval($quantityInStock);
      $buyPrice = intval($buyPrice);
      $MSRP = intval($MSRP);
      $sql="INSERT INTO products (productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
      VALUES ('$productName','$productLine','$productScale','$productVendor','$productDescription','$quantityInStock','$buyPrice','$MSRP')";
      $db->query($sql);
    }

    public static function updateproducts($pC,$productName,$productLine,$productScale,$productVendor,$productDescription,$quantityInStock,$buyPrice,$MSRP) {
      $db = Db::getInstance();
      $quantityInStock = intval($quantityInStock);
      $buyPrice = intval($buyPrice);
      $MSRP = intval($MSRP);
      $sql="UPDATE products SET productName = '$productName', productLine = '$productLine', productScale = '$productScale', productVendor = '$productVendor',
      productDescription = '$productDescription', quantityInStock = '$quantityInStock', buyPrice = '$buyPrice', MSRP = '$MSRP'
       WHERE productCode = '$pC'";
      $db->query($sql);
    }

  	public static function deleteproducts($pC) {
      $db = Db::getInstance();
      $sql="DELETE FROM products WHERE productCode = '$pC'";
	    $db->query($sql);
		}
  }
?>