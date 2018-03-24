<?php 


$path = "uploads/1521143019";
$script = 'python3 detect_list.py -i '.$path;

$retval;
$txt = system($script, $retval);


$fp = fopen("test.txt", "w");
fwrite($fp, $txt);
fclose($fp);

echo 'x';