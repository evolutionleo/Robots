<?php

// function get_ip_address(){
//     foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR') as $key){
//         if (array_key_exists($key, $_SERVER) === true){
//             foreach (explode(',', $_SERVER[$key]) as $ip){
//                 $ip = trim($ip); // just to be safe

//                 if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false){
//                     return $ip;
//                 }
//             }
//         }
//     }
// }

$servername = "localhost";
$username = "phpmyadmin";
$password = "maraT#228";
$dbname = "Robots";

//Check if client copied this correctly..
$needed_security = "xd{zXWA-Vj5RNt*5Z[y9w5@h'0pq";

$action = $_GET['action'];
$security = $_GET['security'];

//...if not - kill the script
if($security != $needed_security) {
	die("SECUTITY ERROR. ACCESS DENIED!!!");
}

// Create connection

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
	die("Connection failed: " . $conn->connect_error);
}

$arr = array();


switch ($action) {
	case 'lb_get':
		$sql = "SELECT * FROM Leaderboard ORDER BY time";
		$result = $conn->query($sql);
		if($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				array_push($arr, $row);
			}
		}
		$map = ['default' => $arr];
		echo json_encode($map);
	case 'lb_put':
		$time = $_POST['time'];
		$name = $_POST['name'];
		$version = $_POST['version'];
		// $user_ip = $_SERVER['REMOTE_ADDR'];

		//If ip exists in database - change the recording
		// $check_sql = "SELECT EXISTS(SELECT * FROM Leaderboard WHERE ip='$user_ip' AND version='$version')";
		// $check_result = $conn->sql($check_sql);
		// if($check_result) {
			// $sql = "UPDATE Leaderboard SET name='$name',time=$time WHERE ip='$user_ip'";
			// $query = $conn->query($sql);
			// echo "UPDATED.";
		// }
		// else {//Else just add a new entry
			// $sql = "INSERT INTO Leaderboard (name, time, version, ip) VALUES ('$name',$time,'$version','$user_ip')";
		$sql = "INSERT INTO Leaderboard (name, time, version, ip) VALUES ('$name',$time,'$version','unknown')";
		$query = $conn->query($sql);
		// echo "ADDED.";
		// }
		break;
	case 'lvl_put':
		$lvl_name = $_POST['level_name'];
		$creator_name = $_POST['creator_name'];
		$content = $_POST['content'];

		$sql = "INSERT INTO Levels (level_name, creator_name, content) VALUES ('$lvl_name','$creator_name','$content')";
		$query = $conn->$sql;
		break;
	case 'lvl_get':
		$sql = "SELECT * FROM Levels";
		$result = $conn->query($sql);
		$i = 1;
		if($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				$time = $row['time'];
				$name = $row['name'];
				$version = $row['version'];
				// $id = $row['id'];
				$id = $i;
				// array_push($arr, $row);
				$i += 1;

				$cur_map = ['time' => $time, 'name' => $name, 'version' => $version, 'id' => $id];
				array_push($arr, $cur_map);
			}
		}
		$map = ['default' => $arr];
		echo json_encode($map);
		break;
	default:
		echo "ERROR! INCORRECT COMMAND NAME";
		break;
}
?>