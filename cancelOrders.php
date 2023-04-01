<?php
$con = mysqli_connect ("localhost","root","","pam");
// get order id
$order_id = $_GET['order_id'];
if(!$order_id){
    die("No order id present");
}

$sql = "DELETE from orders WHERE order_id='$order_id'";

$query = mysqli_query($con, $sql);
if(!$query){
    die("Unable to delete order");
}
// oder deleted successfully. Redirect back
header('Location: ' . $_SERVER['HTTP_REFERER']);