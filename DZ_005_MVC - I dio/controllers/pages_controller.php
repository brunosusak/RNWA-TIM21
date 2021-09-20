<?php
  class PagesController {
    public function home() {
      $first_name = 'LeBron';
      $last_name  = 'James';
      require_once('views/pages/home.php');
    }

    public function error() {
      require_once('views/pages/error.php');
    }
  }
?>