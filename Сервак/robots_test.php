<?php

function get_ip_address(){
    foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR') as $key){
        if (array_key_exists($key, $_SERVER) === true){
            foreach (explode(',', $_SERVER[$key]) as $ip){
                $ip = trim($ip); // just to be safe

                if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false){
                    return $ip;
                }
            }
        }
    }
}


$servername = "localhost";
$username = "phpmyadmin";
$password = "maraT#228";
$dbname = "Robots";

if($security !== $needed_security)
	die("SECUTITY ERROR. ACCESS DENIED!!!");

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
	die("Connection failed: " . $conn->connect_error);
}

// $sql = "SELECT * FROM Leaderboard";
// $result = $conn->query($sql);
// if($result->num_rows > 0) {
// 	while($row = $result->fetch_assoc()) {
// 		var_dump($row);
// 	}
// }

$user_ip = get_ip_address();

$check_sql = "SELECT EXISTS(SELECT * FROM Leaderboard WHERE ip='$user_ip')";
$check_result = $conn->sql($check_sql);
var_dump($check_result);

?>