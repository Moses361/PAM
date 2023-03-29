<?php
require("includes/db.php");
$data = file_get_contents("php://input", false);

// decode data into json
$data = json_decode($data);

$transportCost = $data->transportCost;
$productId = $data->productId;
$origin = $data->origin;
$destination = $data->destination;

$sql = "UPDATE cart SET 
transport_cost='$transportCost',
origin='$origin',
destination='$destination'
WHERE p_id='$productId'";

$query = mysqli_query($con, $sql);

if ($query){
    echo json_encode([
        "success"=>true,
        'message'=>"Transport updated successfully"
    ]);
}else{
    echo json_encode([
        "success"=>false,
        'message'=>"Unable to update transport cost: ".mysqli_error($con)
    ]);
}