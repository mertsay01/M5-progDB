<?php

include "dbdata.php";
$conn = new mysqli($databaseServer, $user, $pass, $schema);
if($conn->connect_error)
{
    die("error try again /r/n");
}

echo "connected to database /r/n";
$conn->close();

include_once 'dbdata.php';
?>