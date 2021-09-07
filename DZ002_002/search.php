<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  border:solid 2px gray;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #000000;}
</style>
</head>
<body>

<?php
$s = $_REQUEST["s"];
$hint = "";

// Spajanje s bazom
$connection = mysqli_connect('localhost','root','','clinic');

if (!$connection) {
    error_log("Failed to connect to MySQL: " . mysqli_error($connection));
    die('Internal server error');
}

// Odabir baze
$db_select = mysqli_select_db($connection, 'clinic');
if (!$db_select) {
    error_log("Database selection failed: " . mysqli_error($connection));
    die('Internal server error');
}else
{
$sql="SELECT * FROM `patients` WHERE `first_name` LIKE  '%$s%' OR `last_name` LIKE  '%$s%'";

$response = $connection->query($sql)or die("Querry failed");

echo "<table>
<tr>
<th>First name</th>
<th>Last name</th>
</tr>";
while ($myrow=mysqli_fetch_row($response)){
			echo "<tr>";
			  echo "<td>" . $myrow[2] . "</td>";
			  echo "<td>" . $myrow[1] . "</td>";
			  echo "</tr>";
		}

echo "</table>";

}
?>
</body>
</html>