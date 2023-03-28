<?php
include_once 'payment.php';
if($_SERVER['REQUEST_METHOD'] == "POST"){
    $amount = $_POST["amount"];
    $phone = $_POST["phone"];
    // // start testing 
    // /*
    $mpesa = new MpesaApi();
    $token = $mpesa->get_access_tocken();
 


    // */
    // // end testign 
    $formated = str_split($phone);
    array_shift($formated);
    // print_r($formated);
    $accepted_format = implode("", $formated);
    // print($accepted_format);
    // die();
    $new_phone = "254".$accepted_format;
    // print($amount.":".$new_phone);
    $message = $mpesa->stk_push($token, $amount, $new_phone);
    print($message);
    die();
}



?>





<div class="box"><!-- box begin-->
   <?php 
    
    $session_email = $_SESSION['customer_email'];
    
    $select_customer = "select * from customers where customer_email='$session_email'";
    
    $run_customer = mysqli_query($con,$select_customer);
    
    $row_customer = mysqli_fetch_array($run_customer);
    
    $customer_id = $row_customer['customer_id'];
    
    ?>
   

    <h1 class="text-center">Pay via M-Pesa</h1>  
    
     <p class="lead text-center"><!-- lead text-center Begin -->
         
         <!-- <a href="order.php?c_id=<?php echo $customer_id ?>"> Offline Payment </a> -->
     
     </p>

     <center>
         <p class="lead">
                <!-- <img  class="img-responsive" src="images/paypal_img.png" alt="img_paypal"> -->
                <form action="orders.php" class="form-login" method="post"><!-- form-login begin -->
                            <h2 class="form-login-heading h-100" style="background-color: gray; padding: 5px 0px;"> Complete Payment</h2>                            
                            <input type="text" class="form-control" placeholder="amount" name="amount" required="" readonly="" value="<?php print(total_price2()) ?>">   <br>                         
                            <input type="text" class="form-control" placeholder="Enter M-Pesa number to be billed" name="phone" required=""><br>
                            
                            <div style="display: flex; justify-content: space-between; padding: 0px 20px;">
                              <button type="cancel" class="btn btn-lg btn-warning" name="goBack" onclick="history.back()"><!-- btn btn-lg btn-primary btn-block begin -->
                                  Go Back
                              </button><!-- btn btn-lg btn-primary btn-block finish -->

                              <button type="submit" class="btn btn-lg btn-primary" name="checkout"><!-- btn btn-lg btn-primary btn-block begin -->
                                  Pay
                              </button><!-- btn btn-lg btn-primary btn-block finish -->
                             </div>
           
       </form><!-- form-login finish -->
         </p>  
     </center>

</div><!-- box Finish-->