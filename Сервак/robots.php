<?php
session_start();

$servername = "localhost";
$username = "phpmyadmin";
$password = "maraT#228";
$dbname = "Robots";

//Check if client copied this correctly..
$needed_security = "xd{zXWA-Vj5RNt*5Z[y9w5@h'0pq";

if(isset($_POST['action'])) {
	$action = $_POST['action'];
}
else {
	$action = $_GET['action'];
}
if(isset($_POST['security'])) {
	$action = $_POST['security'];
}
else {
	$security = $_GET['security'];
}


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

			$sql = "INSERT INTO extended_profiles (rating, json) VALUES ()";

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

		$sql = "SELECT EXISTS(SELECT time FROM Leaderboard WHERE name='$name' AND version='$version')";
		$query = $conn->query($sql);

		$check_array = $query->fetch_assoc();
		$check = $check_array["EXISTS(SELECT time FROM Leaderboard WHERE name='$name' AND version='$version')"];

		if($check == True) {
			$sql = "SELECT time FROM Leaderboard WHERE name='$name' AND version='$version'";
			$query = $conn->query($sql);

			$time_array = $query->fetch_assoc();
			$time_old = $time_array['time'];

			if($time_old > $time) {
				$sql = "UPDATE Leaderboard SET time='$time' WHERE time='$time_old' AND name='$name'";
				$query = $conn->query($sql);
			}
		}
		else {
			//Should check if a user is logged in...
			$sql = "INSERT INTO Leaderboard (name, time, version, ip) VALUES ('$name',$time,'$version','unknown')";
			$query = $conn->query($sql);
		}
		break;
	case 'lvl_put':
		if(!isset($_SESSION['name'])) {
			$creator_name = $_POST['creator_name'];
		}
		else {
			$creator_name = $_SESSION['name'];
		}

		$lvl_name = $_POST['level_name'];
		$content = $_POST['content'];
		$desc = $_POST['description'];

		$sql = "INSERT INTO Levels (level_name, creator_name, content, difficulty,rating,comments,description) VALUES ('$lvl_name','$creator_name','$content',0,0,'','$desc')";
		$query = $conn->query($sql);

		echo "Level succesfully uploaded!";
		break;
	case 'lvl_get':
		$search = $_GET['search'];
		if($search == "") {
			$sql = "SELECT * FROM Levels ORDER BY rating DESC";
		}
		else {
			$sql = "SELECT * FROM Levels WHERE level_name LIKE '%$search%' ORDER BY rating DESC";
		}
		$result = $conn->query($sql);
		$i = 1;
		if($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				$cname = $row['creator_name'];
				$lname = $row['level_name'];
				$content = $row['content'];
				$difficulty = $row['difficulty'];
				$rating = $row['rating'];
				$id = $row['id'];

				$cur_map = ['creator_name'=>$cname, 'level_name'=>$lname, 'id' => $id, 'content'=>$content, 'difficulty'=>$difficulty, 'rating'=>$rating];
				array_push($arr, $cur_map);
			}
		}
		$map = ['default' => $arr];
		echo json_encode($map);
		break;
	case 'endsession':
		session_destroy();
		echo "Session ended.";
		break;
	case 'like':
		// $id = $_POST['id'];
		$id = $_GET['id'];

		$sql = "SELECT rating FROM Levels WHERE id='$id' LIMIT 1";
		$query = $conn->query($sql);
		$rating_array = $query->fetch_assoc();
		$rating = $rating_array['rating'];

		$rating = $rating + 1;
		$sql = "UPDATE Levels SET rating='$rating' WHERE id='$id'";
		$query = $conn->query($sql);

		echo 'Success!';
		break;
	case 'starrate':
		$diff = $_GET['difficulty'];
		$id = $_GET['id'];

		$sql = "UPDATE Levels SET difficulty='$diff' WHERE id='$id'";
		$query = $conn->query($sql);

		echo "Rate succseed!";
		break;
	case 'lvl_delete':
		$id = $_GET['id'];

		$sql = "DELETE FROM Levels WHERE id='$id'";
		$query = $conn->query($sql);

		echo "Deleted.";
		break;
	default:
		echo "ERROR! INCORRECT COMMAND NAME";
		break;
}

$conn->close();

?>