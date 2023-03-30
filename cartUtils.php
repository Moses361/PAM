<?php
require("includes/db.php");
$data = file_get_contents("php://input", false);

// decode data into json
$data = json_decode($data);

$action = $_GET['action'];
switch ($action) {
    case "update_order_date":
        $productId = $data->productId;
        $orderDate = $data->orderDate;
        
        $sql = "UPDATE cart SET order_date='$orderDate' WHERE p_id='$productId'";
        $query = mysqli_query($con, $sql);
        if(!$query) {
            echo json_encode([
                "success"=>false,
                "message"=>"Unable to update order date: "+mysqli_error($con)
            ]);
            return;
        }   
        
        // update successful
        echo json_encode([
            "success"=>true,
            "message"=>"Order date updated successfully"
        ]);
        break;
        
    case "update_transport_cost":
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

        if ($query) {
            echo json_encode([
                "success" => true,
                'message' => "Transport updated successfully"
            ]);
        } else {
            echo json_encode([
                "success" => false,
                'message' => "Unable to update transport cost: " . mysqli_error($con)
            ]);
        }
        break;
    default:
}