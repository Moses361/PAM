<?php

$order_id = @$_GET['orderId'];
$file = "demo.txt";
$oparand = fopen($file, 'a');
// fwrite($oparand, $order_id);
// fclose($oparand);

// Get the callback response
$response = file_get_contents('php://input');
// Decode the JSON response into an array
$res = json_decode($response, true);
// Get the ResultCode parameter from the response
$resultCode = $res['Body']['stkCallback']['ResultCode'];
// Check the value of the ResultCode and make a decision
if ($resultCode == 0) {
    // Payment was successful
    // Do something here, such as update your database with the payment details
    $con = mysqli_connect ("localhost","root","","pam");
    $update_status = "UPDATE orders SET payment_status = 'paid' WHERE id = '$order_id';";
    $run_status = mysqli_query($con, $update_status);
    fwrite($oparand, $order_id."success".$run_status);
    fclose($oparand);

} else {
    $con = mysqli_connect ("localhost","root","","pam");
    $update_status = "UPDATE orders SET payment_status = 'cancelled' WHERE id = '$order_id';";
    $run_status = mysqli_query($con, $update_status);
    fwrite($oparand, $order_id."failed".$run_status);
    fclose($oparand);
}

// Send a response back to Safaricom
// echo json_encode(array('ResultCode' => 0, 'ResultDesc' => 'The request was processed successfully.'));



?>