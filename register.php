<?php

include "connect.php";

if($_SERVER['REQUEST_METHOD'] == "POST"){
    $response = array();
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $cek = "SELECT * FROM users WHERE username='$username'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));

    if(isset($result)){
        $response['value'] = 2;
        $response['message'] = 'Username Telah Digunakan';
        echo json_encode($response);

    } else{
        $insert = "INSERT INTO users VALUES('', '$username', '$password')";
        if(mysqli_query($con, $insert)){
            $response ['value'] = 1;
            $response ['message'] = "Berhasil didaftarkan";
            echo json_encode($response);

        }else{
            $response['value'] = 0;
            $response['message'] = "Gagal Didaftarkan";
            echo json_encode($response);
        }
    }
}

?>