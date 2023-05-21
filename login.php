<?php

include "connect.php";

if($_SERVER['REQUEST_METHOD'] == "POST"){
    $response = array();
    $uname = $_POST['username'];
    $pass = md5($_POST['password']);
    
    $cek = "SELECT * FROM users WHERE username='$username' and password='$password'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));

    if(isset($result)){
        $response['value'] = 1;
        $response['message'] = 'Login Berhasil';
        $response['username'] = $username;
        $response['password'] = $password;
        echo json_encode($response);

    } else{
    
            $response['value'] = 0;
            $response['message'] = "Username atau Password Salah";
            echo json_encode($response);
        }
    }


?>