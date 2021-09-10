<?php

if(!extension_loaded("soap")){
  dl("php_soap.dll");
}


ini_set("soap.wsdl_cache_enabled","0");

$server = new SoapServer("toBam.wsdl");


function cETB($yourValue){
  return $yourValue * 1.96 . " BAM";
}

$server->AddFunction("cETB");
$server->handle();
?>