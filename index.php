<?php

if($_SERVER['REQUEST_METHOD']=='POST') {
	
	$image = $_POST['image'];

	if (is_null($image)) {
		echo "No image uploaded";
	} else {
		$id = time();

		$path = "uploads/$id";

		file_put_contents($path, base64_decode($image));

		$script = 'python3 detect_list.py -i '.$path;

		$lstval = system($script, $retval);

		echo $lstval;
		echo 'Upload successful.';

	}
} else {
	$path = "/var/www/html/uploads/1521167279";
	$script = 'xhost local:root && python3 detect_list.py -i '.$path;


	// $output = shell_exec($script);
	// $output = system($script);
	exec($script.' 2>&1', $output);

	print_r($output);
}
