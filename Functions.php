<?php 
// connect to the database 
// function connect_to_db(){
    $con = mysqli_connect ("localhost","colls","1234","pam");


// }


function create_order($customer, $order_id, $amount) {
    $con = mysqli_connect ("localhost","colls","1234","pam");
    $payment_status = "pending";
    $insert_order = "INSERT INTO orders (customer, order_id, payment_status, amount) VALUES ('$customer', '$order_id', '$payment_status', '$amount')";
    $run_order = mysqli_query($con, $insert_order);

    if ($run_order) {
        // Return the last inserted ID
        return mysqli_insert_id($con);
    } else {
        return false;
    }
}


// update status..

function update_payment_status($con, $order_id, $status) {
    $update_status = "UPDATE orders SET payment_status = '$status' WHERE order_id = '$order_id'";
    $run_status = mysqli_query($con, $update_status);

    if ($run_status) {
        return true;
    } else {
        return false;
    }
}



?>