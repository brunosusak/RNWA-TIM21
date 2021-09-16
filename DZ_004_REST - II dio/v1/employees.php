<?php
// Connect to database
	include("../connection.php");
	include("../functions.php");
	$db = new dbObj();
	$connection =  $db->getConnstring();
 
	$request_method=$_SERVER["REQUEST_METHOD"];
	switch($request_method)
	{
		case 'GET':
			// Retrive Employees
			//print_r($_GET);
			if(!empty($_GET["id"]))
			{
				$id=intval($_GET["id"]);
				get_employees($id);
			}
			else
			{
				get_employees();
			}
			break;
			
			case 'POST':
			// Insert employee
			insert_employee();
			break;	
			
			case 'PUT':
			// Update Product		
			if (isset($_GET["id"])){
				$id=intval($_GET["id"]);
				update_employee($id);				
			}
			else{
				header('Content-Type: application/json');
				echo json_encode("Error while calling method and parametars");
				
			}				
			
			break;				
			case 'DELETE':
			// Delete Employee
			$id=intval($_GET["id"]);
			delete_employee($id);
			break;
			
		default:
			// Invalid Request Method
			header("HTTP/1.0 405 Method Not Allowed");
			break;
	}
?>
