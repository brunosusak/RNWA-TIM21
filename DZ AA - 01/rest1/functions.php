<?php

function get_employees($id=0)
	{
	global $connection;
	$query="SELECT * FROM employees";
	if($id != 0)
	{
		$query.=" WHERE employeeNumber=".$id." LIMIT 100";
	}
	$response=array();
	$result=mysqli_query($connection, $query);
	while($row=mysqli_fetch_array($result,MYSQLI_BOTH))
	{
		$response[]=$row;
	}
	header('Content-Type: application/json');
	echo json_encode($response);
	}

function insert_employee()
	{
		global $connection;

		$data = json_decode(file_get_contents('php://input'), true);
		$employeeNumber		=$data["employeeNumber"];
		$lastName			=$data["lastName"];
		$firstName			=$data["firstName"];
		$extension			=$data["extension"];
		$email				=$data["email"];
		$officeCode			=$data["officeCode"];
		$reportsTo			=$data["reportsTo"];
		$jobTitle			=$data["jobTitle"];
		
		echo $query="INSERT INTO employees VALUES (NULL, '".$employeeNumber."','".$lastName."','".$firstName."','".$extension."','".$email."','".$officeCode."','".$reportsTo."','".$jobTitle."',NOW())";
		if(mysqli_query($connection, $query))
		{
			$broj_redaka = mysqli_affected_rows($connection);
			$response=array(
				'status' => 1,
				'query' => $query,
				'broj_redaka' => $broj_redaka,
				'status_message' =>'Employee Added Successfully.'
			);
		}
		else
		{
			$broj_redaka = mysqli_affected_rows($connection);
			$response=array(
				'status' => 0,
				'query' => $query,
				'broj_redaka' => $broj_redaka,
				'status_message' =>'Employee Addition Failed.'
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);
	}
function update_employee($id)
	{
		global $connection;
		$post_vars = json_decode(file_get_contents("php://input"),true);
		$lastName			=$data["lastName"];
		$firstName			=$data["firstName"];
		$extension			=$data["extension"];
		$email				=$data["email"];
		$officeCode			=$data["officeCode"];
		$reportsTo			=$data["reportsTo"];
		$jobTitle			=$data["jobTitle"];
		
		$query="UPDATE employees SET lastName='".$lastName."', firstName='".$firstName."', extension='".$extension."', email='".$email."', officeCode='".$officeCode."', firstName='".$reportsTo."', firstName='".$jobTitle."' WHERE empoyeeNumber=".$id;
		
		$result=mysqli_query($connection, $query);
		$broj_redaka = mysqli_affected_rows($connection);;
		
		if($result)
		{
			$response=array(
				'status' => 1,
				'query' => $query,
				'broj_redaka' => $broj_redaka,
				'status_message' =>'Employee Updated Successfully.'
			);
		}
		else
		{
			$response=array(
				'status' => 0,
				'query' => $query,
				'broj_redaka' => $broj_redaka,
				'status_message' =>'Employee Updation Failed.'
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);
	}

function delete_employee($id)
	{
	global $connection;
	$query="DELETE FROM employees WHERE employeeNumber=".$id;
	if($result = mysqli_query($connection, $query))
	{
		$response=array(
			'status' => 1,
			'status_message' =>'Employee Deleted Successfully.'
		);
	}
	else
	{
		$response=array(
			'status' => 0,
			'status_message' =>'Employee Deletion Failed.'
		);
	}
	header('Content-Type: application/json');
	echo json_encode($response);
	}


?>
