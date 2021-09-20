<?php
  class OrderDetails  {
    // we define 3 attributes
    // they are public so that we can access them using $post->author directly
    public $orderNumber;
    public $productCode;
    public $quantityOrdered;
    public $priceEach;
    public $orderLineNumber;


    public function __construct($orderNumber,$productCode, $quantityOrdered, $priceEach, $orderLineNumber) {
      $this->orderNumber      = $orderNumber;
      $this->productCode      = $productCode;
      $this->quantityOrdered      = $quantityOrdered;
      $this->priceEach      = $priceEach;
      $this->orderLineNumber      = $orderLineNumber;
    }

    public static function all() {
      $list = [];
      $db = Db::getInstance();
      $req = $db->query('SELECT * FROM orderdetails');
      // we create a list of Post objects from the database results
      foreach($req->fetchAll() as $oD) {
        $list[] = new OrderDetails($oD['orderNumber'], $oD['productCode'], $oD['quantityOrdered'], $oD['priceEach'], $oD['orderLineNumber']);
      }

      return $list;
    }

    public static function find($oD) {
      $db = Db::getInstance();
      $oD = intval($oD);
      $req = $db->prepare('SELECT * FROM orderdetails WHERE orderNumber = :oD');
      $req->execute(array('oD' => $oD));
      $orderDetails = $req->fetch();

      return new OrderDetails($orderDetails['orderNumber'],$orderDetails['productCode'], $orderDetails['quantityOrdered'], $orderDetails['priceEach'], $orderDetails['orderLineNumber']);
    }

    public static function insertorders($productCode,$quantityOrdered,$priceEach,$orderLineNumber) {
      $db = Db::getInstance();
      $quantityOrdered = intval($quantityOrdered);
      $priceEach = intval($priceEach);
      $orderLineNumber = intval($orderLineNumber);
      $sql="INSERT INTO orderdetails (productCode, quantityOrdered, priceEach, orderLineNumber)
      VALUES ('$productCode', '$quantityOrdered', '$priceEach', '$orderLineNumber')";
      $db->query($sql);
    }

    public static function updateorders($oD,$productCode,$quantityOrdered,$priceEach,$orderLineNumber) {
      $db = Db::getInstance();
      $oD = intval($oD);
      $quantityOrdered = intval($quantityOrdered);
      $priceEach = intval($priceEach);
      $orderLineNumber = intval($orderLineNumber);
      $sql="UPDATE orderdetails SET quantityOrdered = '$quantityOrdered', priceEach='$priceEach', orderLineNumber = '$orderLineNumber'
       WHERE orderNumber = '$oD' 
       AND productCode = '$productCode'";
      $db->query($sql);
    }

  	public static function deleteorders($oD) {
      $db = Db::getInstance();
      $sql="DELETE FROM orderdetails WHERE orderNumber = '$oD'";
	    $db->query($sql);
		}
  }
?>