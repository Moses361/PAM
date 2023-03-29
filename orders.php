<?php
include("includes/header.php");
// include("functions/functions.php");
include_once 'payment.php';
include_once 'Functions.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {


    if (isset($_POST['checkout'])) {
        $amount = $_POST["amount"];
        $phone = $_POST["phone"];
        $total = total_price();
        $ip_add = getRealIpUser();
        $o_id = rand(100000, 999999);

        // get all items in the shopping cart for this user
        $sql = "SELECT * FROM cart WHERE ip_add='$ip_add';";
        $query = mysqli_query($con, $sql);
        if (!$query) die("Error getting items in cart: ".mysqli_error($con));
        
        while ($data = mysqli_fetch_array($query)){
            $origin = $data['origin'];
            $destination = $data['destination'];
            $id = create_order($_SESSION['customer_email'], $o_id, $total, $origin, $destination);
        }
        


        // print($id);
        // die();
        $mpesa = new MpesaApi($id);
        // $mpesa->setCallBackUrl($callback_url);
        
        $token = $mpesa->get_access_tocken();


        // */
        // // end testign 
        $formated = str_split($phone);
        array_shift($formated);
        // print_r($formated);
        $accepted_format = implode("", $formated);
        // print($accepted_format);
        // die();
        $new_phone = "254" . $accepted_format;
        // print($amount.":".$new_phone);
        $message = $mpesa->stk_push($token, $amount, $new_phone);
        // print($message);
        $res = json_decode($message);
        // die($res->CheckoutRequestID);

        // order has been processed. Update referrals
        $session_email = trim($_SESSION['customer_email']);
        $sql = "UPDATE referals SET redeemed=true WHERE username='$session_email';";
        $query = mysqli_query($con, $sql);
        if (!$query){
            die("Unable to update referrals: ".mysqli_error($con));
        }

        // Order has been successful. Delete shopping cart
        $sql = "DELETE FROM cart WHERE ip_add='$ip_add';";
        $query = mysqli_query($con, $sql);
        if (!$query){
            die("Error clearing shopping cart: ".mysqli_error($con));
        }
        
    }

}


?>





<div class="box"><!-- box begin-->
    <?php

    $session_email = $_SESSION['customer_email'];

    $select_customer = "select * from customers where customer_email='$session_email'";

    $run_customer = mysqli_query($con, $select_customer);

    $row_customer = mysqli_fetch_array($run_customer);

    $customer_id = $row_customer['customer_id'];

    ?>


    <h1 class="text-center">Orders</h1>

    <p class="lead text-center"><!-- lead text-center Begin -->

        <!-- <a href="order.php?c_id=<?php echo $customer_id ?>"> Offline Payment </a> -->

    </p>

    <center>

        <p class="lead">
            <!-- Paypal Payment -->

            <!-- <img  class="img-responsive" src="images/paypal_img.png" alt="img_paypal"> -->
        <form action="" class="form-login" method="post"><!-- form-login begin -->
            <h2 class="form-login-heading"> Refresh to update status</h2>
            <table class="table"><!--table   begin -->
                <table class="table" id="myTable">
                    <thead>
                        <tr><!--tr   begin -->

                            <th>Name</th>
                            <th>Order ID</th>
                            <th>Status</th>
                            <th>Amount</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Order Date</th>
                        </tr><!--tr   finish -->

                    </thead>
                    <tbody><!--tbody  begin -->
                        <?php

                        $total = 0;
                        //   $pro_id = $row_cart['p_id'];
                        //   $pro_size = $row_cart['size'];
                        //   $pro_qty = $row_cart['qty'];
                        $email = $_SESSION['customer_email'];
                        $get_products = "select * from orders  where customer  = '$email'";
                        $run_products = mysqli_query($con, $get_products);
                        while ($row_products = mysqli_fetch_array($run_products)) {
                            $name = $row_products['customer'];
                            $oId = $row_products['order_id'];
                            $status = $row_products['payment_status'];
                            $amount = $row_products['amount'];
                            $origin = $row_products['origin'];
                            $destination = $row_products['destination'];
                            $order_date = $row_products['order_date'];
                            ?>

                            <tr><!--tr   begin-->
                                <td>
                                    <?php echo $name; ?>
                                </td>
                                <td>
                                    <?php echo $oId; ?>"
                                <td>
                                    <?php echo $status; ?>
                                </td>
                                <td>
                                    <?php echo $amount; ?>
                                </td>

                                <td>
                                    <?php echo $origin; ?>
                                </td>
                                <td>
                                    <?php echo $destination; ?>
                                </td>
                                <td>
                                    <?php echo $order_date; ?>
                                </td>


                            </tr><!--tr   Finish -->
                        <?php

                        }

                        ?>

                    </tbody><!--tbody   Finish -->


                    <tfoot><!--tfoot   begin -->


                    </tfoot><!--tfoot   Finish -->

                </table><!--table   Finish -->


                <!-- <button id="printAndDownloadBtn" class="btn btn-lg btn-success ">Print and Download</button> -->
                <button id="printBtn" class="btn btn-lg btn-success">Print</button>
                <button id="downloadBtn" class="btn btn-lg btn-success">Download</button>

        </form><!-- form-login finish -->

        </p>

    </center>

</div><!-- box Finish-->

<!-- JavaScript to add print and download buttons -->

<!-- JavaScript to add print and download functionality to the buttons -->
<script>
    // Get the table element
    var table = document.getElementById('myTable');

    // Function to print the table
    function printTable() {
        window.print();
    }

    // Function to download the table as CSV
    function downloadTable() {
        // Convert the table to CSV format
        var csv = [];
        for (var i = 0; i < table.rows.length; i++) {
            var row = [];
            for (var j = 0; j < table.rows[i].cells.length; j++) {
                row.push(table.rows[i].cells[j].innerText);
            }
            csv.push(row.join(','));
        }
        csv = csv.join('\n');

        // Create a download link and click it
        var link = document.createElement('a');
        link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv));
        link.setAttribute('download', 'myTable.csv');
        link.style.display = 'none';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    // Attach click event listeners to the print and download buttons
    var printBtn = document.getElementById('printBtn');
    printBtn.addEventListener('click', printTable);

    var downloadBtn = document.getElementById('downloadBtn');
    downloadBtn.addEventListener('click', downloadTable);
</script>
