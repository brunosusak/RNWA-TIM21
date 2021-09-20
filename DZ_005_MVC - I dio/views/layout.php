<DOCTYPE html>
<html>
  <head>
  <style>
  body {
    padding-top: 60px;
  }
  @media (max-width: 980px) {
    body {
      padding-top: 150px;
    }
  }
</style>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $judul ?></title>
    <link href="http://localhost/5/asset/css/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  <nav class="navbar navbar-inverse navbar-fixed-top">  
        <div class="container-fluid">  
                <div class="navbar-header">  
                <a class="navbar-brand" href="#">DZ5_1</a>  
            </div>  
          
            <ul class="nav navbar-nav">  
                <li class="active"><a href='./'>Home</a></li>  
                <li><a href='?controller=orderdetails&action=index'>OrderDetails</a></li>  
            </ul>  
            
        </div>  
    </nav>  
    <br>

    <?php require_once('routes.php'); ?>
    <script src="http://localhost/5/asset/js/jquery.min.js"></script>
    <script src="http://localhost/5/asset/css/js/bootstrap.min.js"></script>
    <body>
<html>