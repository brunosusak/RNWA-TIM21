<?php 
$conn = mysqli_connect("localhost", "root", "", "clinic") or die("Connection failed: " . mysqli_connect_error());
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

if(isset($_GET['officecode'])) {	
	$officecode = $_GET['officecode']; 
	$sql_query = "select lastName, firstName, email from employees where officeCode = $officecode";
	$response = mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
	$rows = array();
	while($r = mysqli_fetch_assoc($response)) {
    $rows[] = $r;
	}
	print json_encode($rows);	
}
?>	
