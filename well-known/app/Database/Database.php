<?php

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection([
	/*
	'driver'   => 'mysql',
	'host'     => 'localhost',
	'database' => 'bd_bapp',
	'username' => 'root',
	'password' => '',
	'charset'  => 'utf8',
	'collation'=> 'utf8_unicode_ci'
	*/
	'driver'   => 'mysql',
	'host'     => 'localhost',
	'database' => 'sopo77862_oca2',
	'username' => 'sopo77862_oca_test',
	'password' => 'NBUSJI1%hWQ-',
	'charset'  => 'utf8',
	'collation'=> 'utf8_unicode_ci'
	
]);

$capsule->setAsGlobal();
$capsule->bootEloquent();