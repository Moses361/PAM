<?php
include_once 'payment.php';
if ($_SERVER['REQUEST_METHOD'] == "POST") {
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
  $new_phone = "254" . $accepted_format;
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

  $run_customer = mysqli_query($con, $select_customer);

  $row_customer = mysqli_fetch_array($run_customer);

  $customer_id = $row_customer['customer_id'];

  ?>


  <h1 class="text-center">Payment Options For You</h1>

  <p class="lead text-center"><!-- lead text-center Begin -->

    <!-- <a href="order.php?c_id=<?php echo $customer_id ?>"> Offline Payment </a> -->

  </p>

  <center>

    <p class="lead">
      <!-- <img  class="img-responsive" src="images/paypal_img.png" alt="img_paypal"> -->
    <form action="orders.php" class="form-login" method="post"><!-- form-login begin -->
      <h2 class="form-login-heading"> complete payment</h2>
      <input type="hidden" class="form-control" placeholder="amount" name="amount" required="" readonly=""
        value="<?php print(total_price2()) ?>"> <br>
      <input type="text" class="form-control" placeholder="Enter phone number for payment" name="phone" required=""><br>
      <select name="origin" id="origin" class="form-control" required="">
        <!-- To be filled via JavaScript                                          -->
      </select><!-- form-control Finish --><br>
      <select name="destination" class="form-control" id="destination" required oninput="setCustomValidity('')"
        oninvalid="setCustomValidity('Must pick 1 size for the product')">
        <!-- <option disabled selected>Select Destination</option> -->
        <!-- To be filled via JavaScript                                         -->

      </select><br><!-- form-control Finish -->
      <input type="date" name="order_date" id="orderDate" class="form-control" placeholder="Enter service date" required=""><br>

      <button type="submit" class="btn btn-lg btn-primary btn-block" name="checkout" id="show">
        show total

      </button><!-- btn btn-lg btn-primary btn-block finish -->



      <button type="submit" class="btn btn-lg btn-primary btn-block" name="checkout" id="pay">
        Pay
      </button><!-- btn btn-lg btn-primary btn-block finish -->
      <h2 id="final"></h2>

    </form><!-- form-login finish -->
    </p>

  </center>

</div><!-- box Finish-->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  // Your JavaScript code that uses jQuery
  const origin =document.querySelector("#origin");
  const destination =document.querySelector("#destination");
  const orderDate =document.querySelector("#orderDate");
  const locations = [
    "Lavington Green Apartments",
    "Kunde Apartments",
    "Sovereign Suites",
    "Valley Arcade Suites",
    "Riverside Lane Villas",
    "Lavington Curve Apartments",
    "The Gem Suites",
    "55 Hatheru Road",
    "Mimosa Court Apartments",
    "Lavington Hill House"
  ];

  const options = locations.map(location => `<option value='${location}'>  ${location}</option>`).join("");

  origin.innerHTML =options;
  destination.innerHTML = options;

  // no selection of previous dates
  const today = new Date().toISOString().split('T')[0];
  orderDate.setAttribute("min", today);

  orderDate.addEventListener("change", function(){
    const selectedDate = new Date(this.value);
    const now = new Date();
    if (selectedDate < now){
      this.value =today;
    }
  })

  $(document).ready(function () {
    console.log("hello colls");
    // Hide the Pay button initially
    $("#pay").hide();

    // Show the Pay button when Show Total button is clicked
    $("#show").click(function (e) {
      e.preventDefault();
      var origin = $("#origin").val();
      var destination = $("#destination").val();
      if(orderDate.value == ''){
        alert("Please select order date first");
        return;
      }
      var amount = parseInt($("input[name='amount']").val());
      var total = amount;

      $("input[name='amount']").val(total);

      // Display the total
      $("#final").html("Total: ksh" + total);
      // Show the Pay button
      $("#pay").show();
    });
  });


</script>
