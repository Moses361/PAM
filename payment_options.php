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
   

    <h1 class="text-center">Payment Options For You</h1>  
    
     <p class="lead text-center"><!-- lead text-center Begin -->
         
         <!-- <a href="order.php?c_id=<?php echo $customer_id ?>"> Offline Payment </a> -->
     
     </p>

     <center>
     
         <p class="lead">
     
             <a href="#">
             
                <!-- Paypal Payment -->

                <!-- <img  class="img-responsive" src="images/paypal_img.png" alt="img_paypal"> -->
                <form action="orders.php" class="form-login" method="post"><!-- form-login begin -->
                            <h2 class="form-login-heading"> complete payment</h2>                            
                            <input type="text" class="form-control" placeholder="amount" name="amount" required="" readonly="" value="<?php print(total_price2()) ?>">   <br>                         
                            <input type="text" class="form-control" placeholder="Enter phone number for payment" name="phone" required=""><br>
                            
                            <button type="submit" class="btn btn-lg btn-primary btn-block" name="checkout"><!-- btn btn-lg btn-primary btn-block begin -->
                                
                                Pay
                                
                             </button><!-- btn btn-lg btn-primary btn-block finish -->
           
       </form><!-- form-login finish -->
             
             </a>
     
         </p>  
     
     </center>

</div><!-- box Finish-->