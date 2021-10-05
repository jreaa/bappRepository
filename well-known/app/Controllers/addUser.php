<?php 
include('../../vendor/autoload.php');
include('../User/User.php');

$name = $_POST['name'];
$email = $_POST['email'];
$pass = $_POST['password'];

$user = new User;
$user->addUser($name,$email,$pass);

header('Location: ../../addUsers.php');
