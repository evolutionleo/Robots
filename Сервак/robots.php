<?php
session_start();

$servername = "localhost";
$username = "phpmyadmin";
$password = "maraT#228";
$dbname = "Robots";

//Check if client copied this correctly..
$needed_security = "xd{zXWA-Vj5RNt*5Z[y9w5@h'0pq";

$action = $_GET['action'];
$security = $_GET['security'];

// die("Hey there!");

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
	case 'login':
		$name = $_GET['name'];
		$pass = $_GET['pass'];

		// var_dump($name);

		// die("DED");

		$sql = "SELECT EXISTS(SELECT * FROM profiles WHERE name='$name' AND password='$pass')";
		$result = $conn->query($sql);

		$check_array = $result->fetch_assoc();

		$check = $check_array["EXISTS(SELECT * FROM profiles WHERE name='$name' AND password='$pass')"];

		if($check == True) {
			$_SESSION['name'] = $name;
			$_SESSION['pass'] = $pass;

			$sql = "SELECT status FROM profiles WHERE name='$name' AND password='$pass'";
			$result = $conn->query($sql);

			$stat_map = $result->fetch_assoc();

			$stat = $stat_map['status'];
			$res = 'Login Success!';
		}
		else {
			$res = 'Invalid login or password.';
			$stat = 'nope';
		}

		$map = ['res' => $res, 'status' => $stat];
		echo json_encode($map);
		break;
	case 'signup':
		$name = $_GET['name'];
		$pass = $_GET['pass'];  

		$sql = "SELECT EXISTS(SELECT name FROM profiles WHERE name='$name')";
		$result = $conn->query($sql);
		$check_array = $result->fetch_assoc();
		$check = $check_array["EXISTS(SELECT name FROM profiles WHERE name='$name')"];

		if($check == False) {
			$sql = "INSERT INTO profiles (name, password, status) VALUES ('$name', '$pass', 'player')";
			$result = $conn->query($sql);

			$_SESSION['name'] = $name;
			$_SESSION['pass'] = $pass;

			$res = "Success";
			$stat = 'player';
		}
		else {
			$res = "This username is already taken.";
			$stat = "NULL";
		}

		$map = ['res' => $res, 'stat' => $stat];
		echo json_encode($map);
		break;
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
		
		if(!isset($_SESSION['name'])) {
			$name = $_POST['name'];
		}
		else {
			$name = $_SESSION['name'];
		}

		$time = $_POST['time'];
		$version = $_POST['version'];

		//Should check if a user is logged in...
		$sql = "INSERT INTO Leaderboard (name, time, version, ip) VALUES ('$name',$time,'$version','unknown')";
		$query = $conn->query($sql);
		break;
	case 'lvl_put':
		$lvl_name = $_POST['level_name'];
		if(!isset($_SESSION['name'])) {
			$creator_name = $_POST['creator_name'];
		}
		else {
			$creator_name = $_SESSION['name'];
		}
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
				$id = $i;
				$i += 1;

				$cur_map = ['time' => $time, 'name' => $name, 'version' => $version, 'id' => $id];
				array_push($arr, $cur_map);
			}
		}
		$map = ['default' => $arr];
		echo json_encode($map);
		break;
	case 'endsession':
		session_destroy();
		break;
	default:
		echo "ERROR! INCORRECT COMMAND NAME";
		break;
}

$conn->close();

?>