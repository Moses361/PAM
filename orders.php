<?php
include("includes/header.php");
// include("functions/functions.php");
include_once 'payment.php';
include_once 'Functions.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {


    if (isset($_POST['checkout'])) {
        $amount = $_POST["amount"];
        $phone = $_POST["phone"];
        $origin = $_POST["origin"];
        $destination = $_POST["destination"];
        $order_date = $_POST["order_date"];
        // // start testing 
        // /*
        // create order 
        $total = total_price();
        $o_id = rand(100000, 999999);
        $id = create_order($_SESSION['customer_email'], $o_id, $total, $origin, $destination, $order_date);

        // print($id);
        // die();
        $mpesa = new MpesaApi($id);
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
        // die();


    }

}


?>





<div class="box" id="box"><!-- box begin-->
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
            <!-- <img  class="img-responsive" src="images/paypal_img.png" alt="img_paypal"> -->
        <form action="" class="form-login" method="post"><!-- form-login begin -->
            <h2 class="form-login-heading" id="refreshText"> Refresh to update status</h2>
            <table class="table"><!--table   begin -->
                <table class="table" id="myTable">
                    <thead>
                        <tr><!--tr   begin -->

                            <th>name</th>
                            <th>orderID</th>
                            <th>status</th>
                            <th>Amount</th>
                            <th>origin</th>
                            <th>destination</th>
                            <th>order_date</th>
                            <th>Cancel Order</th>



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
                                <th>
                                    <a style="cursor:pointer;" href="cancelOrders.php?order_id=<?php echo $oId; ?>"> <i class="fa fa-trash text-danger"></i> Cancel</a>
                                </th>


                            </tr><!--tr   Finish -->
                        <?php

                        }

                        ?>

                    </tbody><!--tbody   Finish -->


                    <tfoot><!--tfoot   begin -->


                    </tfoot><!--tfoot   Finish -->

                </table><!--table   Finish -->

                <div id="orderOptions">
                    <!-- <button id="printAndDownloadBtn" class="btn btn-lg btn-success ">Print and Download</button> -->
                    <button id="printBtn" class="btn btn-lg btn-success">Print</button>
                    <button id="downloadBtn" class="btn btn-lg btn-success">Download</button>
                </div>

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
        printPageArea("box")
    }

    // print only a section of a page
    function printPageArea(areaID) {
        var printContent = document.getElementById(areaID).innerHTML;
        var originalContent = document.body.innerHTML;
        document.body.innerHTML = printContent;
        var orderOptions = document.getElementById("orderOptions");
        orderOptions.style.display = "none"; // hide order options while printing report
        document.getElementById("refreshText").style.display="none";
        window.print();
        // orderOptions.style.display = "block"; // show order options back
        document.body.innerHTML = originalContent;
    }

    // Function to download the table as CSV
    function downloadTable() {
        printPageArea("box")
    }

    // Attach click event listeners to the print and download buttons
    var printBtn = document.getElementById('printBtn');
    printBtn.addEventListener('click', printTable);

    var downloadBtn = document.getElementById('downloadBtn');
    downloadBtn.addEventListener('click', downloadTable);
</script>
