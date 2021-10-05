<?php

require_once('../ValidateUser/ValidateUser.php');
$user = $_POST['user'];
$password = $_POST['password'];

//$user = "admin";
//$password = "admin";
$vu = new ValidateUser;
$vu->UserValidate($user, $password);
