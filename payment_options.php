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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    // Your JavaScript code that uses jQuery

$(document).ready(function() {
    console.log("hello colls");
  // Hide the Pay button initially
  $("#pay").hide();

  // Show the Pay button when Show Total button is clicked
  $("#show").click(function(e) {
    e.preventDefault();
    var origin = $("#origin").val();
    var destination = $("#destination").val();
    var amount = parseInt($("input[name='amount']").val());
    var total = amount;
    
    if (origin === "1" && destination === "1") {
      total += 100;
    } else if (origin === "1" && destination === "2") {
      total += 150;
    } else if (origin === "1" && destination === "3") {
      total += 200;
    } else if (origin === "1" && destination === "4") {
      total += 180;
    } else if (origin === "1" && destination === "5") {
      total += 150;
    } else if (origin === "2" && destination === "1") {
      total += 120;
    } else if (origin === "2" && destination === "2") {
      total += 100;
    } else if (origin === "2" && destination === "3") {
      total += 170;
    } else if (origin === "2" && destination === "4") {
      total += 140;
    } else if (origin === "2" && destination === "5") {
      total += 130;
    } else if (origin === "3" && destination === "1") {
      total += 140;
    } else if (origin === "3" && destination === "2") {
      total += 180;
    } else if (origin === "3" && destination === "3") {
      total += 100;
    } else if (origin === "3" && destination === "4") {
      total += 150;
    } else if (origin === "3" && destination === "5") {
      total += 130;
    } else if (origin === "4" && destination === "1") {
      total += 180;
    } else if (origin === "4" && destination === "2") {
      total += 160;
    } else if (origin === "4" && destination === "3") {
      total += 200;
    } else if (origin === "4" && destination === "4") {
      total += 100;
    } else if (origin === "4" && destination === "5") {
      total += 170;
    } else if (origin === "5" && destination === "1") {
      total += 150;
    } else if (origin === "5" && destination === "2") {
      total += 140;
    } else if (origin === "5" && destination === "3") {
      total += 160;
    } else if (origin === "5" && destination === "4") {
      total += 180;
    } else if (origin === "5" && destination === "5") {
      total += 100;
    }
    $("input[name='amount']").val(total);
    
    // Display the total
    $("#final").html("Total: ksh" + total);    
    // Show the Pay button
    $("#pay").show();
  });
});


</script>





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
                            <input type="hidden" class="form-control" placeholder="amount" name="amount" required="" readonly="" value="<?php print(total_price2()) ?>">   <br>                         
                            <input type="text" class="form-control" placeholder="Enter phone number for payment" name="phone" required=""><br> 
                            <select name="origin" id="origin" class="form-control" required="">                                          
                                          <option value = "1">Nairobi</option>
                                          <option value = "2">Western</option>
                                          <option value = "3">Coast</option>
                                          <option value = "4">Rift valley</option>
                                          <option value = "4">Nyanza</option>                                         
                                          
                            </select><!-- form-control Finish --><br>
                            <select name="destination" class="form-control" id="destination" required oninput="setCustomValidity('')" oninvalid="setCustomValidity('Must pick 1 size for the product')">                                           <!-- <option disabled selected>Select Destination</option> -->
                                           <option value = "1">Nairobi</option>
                                           <option value = "2">Western</option>
                                           <option value = "3">Coast</option>
                                           <option value = "4">Rift valley</option>
                                           <option value = "4">Nyanza</option>                                          
                                           
                            </select><br><!-- form-control Finish -->
                            <input type="date" name="order_date" class="form-control" placeholder="Enter service date"  required=""><br> 

                            <button type="submit" class="btn btn-lg btn-primary btn-block" name="checkout" id="show">                           
                                show total
                                
                             </button><!-- btn btn-lg btn-primary btn-block finish -->
                            
                            

                            <button type="submit" class="btn btn-lg btn-primary btn-block" name="checkout" id="pay">                           
                                Pay
                                
                             </button><!-- btn btn-lg btn-primary btn-block finish -->
                             <h2 id="final" ></h2>
           
                 </form><!-- form-login finish -->
             
             </a>
     
         </p>  
     
     </center>

</div><!-- box Finish-->

<script>


</script>