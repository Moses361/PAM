<?php
include("functions/functions.php");
// process order
if (!isset($_POST['addToCart'])) {
    die("You are not allowed to access this route");
}

$db = mysqli_connect("localhost", "root", "", "pam");
$ip_add = getRealIpUser();

$p_id = $_POST['product_id'];

$product_qty = @$_POST['product_qty'];

$product_size = @$_POST['product_size'];

$total = $_POST['total'];

$check_product = "select * from cart where ip_add='$ip_add' AND p_id='$p_id'";

$run_check = mysqli_query($db, $check_product);

if (mysqli_num_rows($run_check) > 0) {

    echo "<script>alert('This product has already been added to cart')</script>";
    echo "<script>window.open('details.php?pro_id=$p_id','_self')</script>";

} else {

    $query = "insert into cart (p_id,ip_add,qty,size, p_price) values ('$p_id','$ip_add','$product_qty','$product_size', '$total')";
    $run_query = @mysqli_query($db, $query);
    
    echo "<script>window.open('details.php?pro_id=$p_id','_self')</script>";

}