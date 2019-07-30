<?php

$base_path = dirname(__DIR__);
$route_prefix = getenv("ROUTE_PREFIX");
$class_name = getenv("MAIN_CLASS");
include "../loader.php";

if ($class_name == "")
{
	echo "Hello world !!!";
	exit(0);
}

use Runtime\Collection;
use Runtime\Dict;

$app = Runtime\rtl::newInstance
(
	$class_name,
	Collection::create([
		Dict::create([
			"base_path" => $base_path,
			"route_prefix" => $route_prefix,
		])
	])
);
$app->init();
$app->start();
