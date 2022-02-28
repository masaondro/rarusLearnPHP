<?php
    $email = $_POST['email'];
    $fio = $_POST['fio'];
    $phone= $_POST['phone'];
    $message = $_POST['message'];
    $adress = $_POST['adress'];
    $file = $_POST['file'];
    $res = 2;
    if (!$fio){
        $res = 3;
    }
    if (!$phone){
        $res = 4;
    }

    if (strpos($email, "@gmail.com") !== false){
        $res = 1;
    }
    echo $res;    

?>