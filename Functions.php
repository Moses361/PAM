<?php 
// connect to the database 
// function connect_to_db(){
    $con = mysqli_connect ("localhost","root","","pam");


// }

function create_order($customer, $order_id, $amount, $origin, $destination, $order_date ) {
    $con = mysqli_connect ("localhost","root","","pam");
    $payment_status = "pending";
    // print($order_date);
    // die();
    
    $insert_order = "INSERT INTO orders (customer, order_id, payment_status, amount, origin, destination, order_date) VALUES ('$customer', '$order_id', '$payment_status', '$amount', '$origin', '$destination', '$order_date')";
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
function getLocationName($locationId) {
    switch ($locationId) {
      case 1:
        return "Nairobi";
        break;
      case 2:
        return "Western";
        break;
      case 3:
        return "Coast";
        break;
      case 4:
        return "Rift valley";
        break;
      case 5:
        return "Nyanza";
        break;
      default:
        return "";
    }
  }



?>