<?php 
     $active='SHOPPING CART';
    //  date_default_timezone_set('UTC');
    include("includes/header.php");

    $intiator = trim($_SESSION['customer_email']);
    // print($intiator);
    // if(trim($intiator)== "moses@gmail.com"){
    //     print("holla");
    // }else{
    //     print("dye");
    // }

    $select_cart = "SELECT  * from referals where initiator  ='$intiator';";
    $run_cart2 = mysqli_query($con,$select_cart );
    $count2 = mysqli_num_rows($run_cart2);
    $discount = $count2 * 200;

    // print_r($discount);


    // die();


?>

<div id="content"><!--content  begin -->
  <div class="container"><!--container begin -->
    <div class="container col-md-12"><!--container col-md-12 begin -->
    
          <ul class="breadcrumb"><!--breadcrumb   begin -->
              <li>
                  <a href="index.php">Home</a>
              </li>
              <li>
                  Order
              </li>
          </ul><!--breadcrumb   Finish -->
    
    </div><!--container col-md-12  Finish -->

    <div id="cart" class="col-md-9" ><!--cart col-md-9   begin-->
    
       <div class="box" ><!--box   begin-->
       
           <form action="cart.php" method="post" enctype="multipart/form-data" id="orderForm"><!--form   begin -->
           
               <h1>Order Request</h1>

                <?php 
                
                  $ip_add = getRealIpUser();
                  $select_cart = "select * from cart where ip_add='$ip_add'";
                  $run_cart = mysqli_query($con,$select_cart );
                  $count = mysqli_num_rows($run_cart);
                
               ?>

               <p class="text-muted">You Currently Have <?php echo $count?> Item(s) In Your Order List</p>
               <div class="table-responsive"><!--table-responsive   begin -->
               
                <table class="table" id="myTable"><!--table   begin -->
                 
                    <thead>
                       <tr><!--tr   begin -->
                       
                           <th colspan="2">Service</th>
                           <th>Quantity</th>
                           <th>Unit Price</th>
                           <th>Category</th>
                           <th colspan="1">Delete</th>
                           <th colspan="2">Sub-Total</th>
                       
                       </tr><!--tr   finish -->
                    
                    </thead>
                    <tbody><!--tbody  begin -->
                       <?php 
                       
                          $total = 0;
                          while($row_cart = mysqli_fetch_array($run_cart)){

                             $pro_id = $row_cart['p_id'];
                             $pro_size = $row_cart['size'];
                             $pro_qty = $row_cart['qty'];
                             $get_products = "select *from products where product_id='$pro_id'";
                             $run_products = mysqli_query($con,$get_products);
                             while($row_products = mysqli_fetch_array($run_products)){
                                 $product_title = $row_products['product_title'];
                                 $product_img1 = $row_products['product_img1'];
                                 $only_price = $row_products['product_price'];
                                 $sub_total = $row_products['product_price']*$pro_qty;
                                 $total += $sub_total;

        
                      ?>
                    
                       <tr><!--tr   begin-->
                          <td>
                             <img class="img-responsive" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="product-d2">
                          </td>
                          <td>
                               <?php print($product_title); ?>
                          </td>
                          <td>
                              <?php echo $pro_qty; ?>
                          </td>
                          <td>
                              <?php echo $only_price; ?>
                          </td>
                          <td>
                              <?php echo $pro_size; ?>
                          </td>
                          <td>
                              <input type="checkbox" name="remove[]" value="<?php echo $pro_id; ?>">
                          </td>
                          <td>
                              Ksh.<?php echo $sub_total; ?>
                          </td>
                       </tr><!--tr   Finish -->
                      <?php 
                      }
                    }

                      ?>
                    
                    </tbody><!--tbody   Finish -->
                     
                     
                    <tfoot><!--tfoot   begin -->
                      <tr>
                        <th colspan="5">Sub Total</th>
                        <th colspan="2">Ksh.<?php echo $total; ?></th>
                        
                        
                      </tr>
                      <tr>
                        <?php 
                         $intiator = trim($_SESSION['customer_email']);
                         $select_cart2 = "select * from referals where initiator ='$intiator'";
                         $run_cart2 = mysqli_query($con,$select_cart2);
                         $count2 = mysqli_num_rows($run_cart2);
                        //  print("hello");
                        //  print($count);  
                         
                         
                        //  die();



                        ?>
                         <th colspan="5">Discount</th>
                        <th colspan="2">Ksh.<?php print($discount);?></th>
                        </tr>
                        <tr>
                            <th colspan="5">Total</th>
                            <th colspan="2">Ksh.<?php echo $total - $discount; ?></th>
                        
                        
                      </tr>
                      
                    </tfoot><!--tfoot   Finish -->
                
                </table><!--table   Finish -->

               </div><!--table-responsive   Finish -->
               <div class="box-footer" id="orderOptions"><!--box-footer  begin -->
               
                  <div class="pull-left"><!--pull-left begin -->
                  
                     <a href="index.php" class="btn btn-default">
                        <i class="fa fa-chevron-left"></i>Continue Ordering
                  
                     </a>

                  </div><!--pull-left Finish -->
                  <!-- <button id="printBtn"  class="btn btn-lg btn-success">Print</button>
                             <button id="downloadBtn"  class="btn btn-lg btn-success">Download</button> -->
                 <div class="pull-right"><!--pull-left begin -->
                  
                     <button class="submit"name="update" value="Update Cart" class="btn btn-default">
                        <i class="fa fa-refresh"></i> Update Order                  
                     </button>
                     <button id="printBtn"  class="btn btn-lg btn-success">Print</button>
                             <button id="downloadBtn"  class="btn btn-lg btn-success">Download</button>
                  

                     <a href="checkout.php" class="btn btn-primary">
                        Proceed Checkout <i class="fa fa-chevron-right"></i>
                     
                     </a>

                  </div><!--pull-left Finish -->
               
               </div><!--box-footer  Finish -->
           
           </form><!--form   Finish -->
       
       </div><!--box   Finish -->

            <?php 
            
               function update_cart(){

                global $con;
                if(isset($_POST['update'])){

                    foreach($_POST['remove'] as $remove_id){

                       $delete_product = "delete from cart where p_id='$remove_id'";
                       $run_delete = mysqli_query($con,$delete_product);
                       if($run_delete){

                          echo "
                          
                             <script>window.open('cart.php','_self')</script>
                          
                          ";

                       }

                    }


                }

               }
               
               
               
                  @$up_cart = update_cart(); 
               
               ;            
            ?>

       <div id="row" class="same-height-row"><!--row same-height-row   begin -->
              <div class="col-md-3 col-sm-6"><!--col-md-3 col-sm-6   begin -->
                  <div class="box same-height headline"><!--box same-height headline   begin -->
                      <h3 class="text-center">Service You May Like</h3>
                  </div><!--box same-height headline   Finish -->
              </div><!--col-md-3 col-sm-6   Finish -->

                <?php 
                
                    $get_products = "select * from products order by rand() LIMIT 0,3";
                   
                    $run_products = mysqli_query($con,$get_products);
                   
                   while($row_products=mysqli_fetch_array($run_products)){
                       
                       $pro_id = $row_products['product_id'];
                       
                       $pro_title = $row_products['product_title'];
                       
                       $pro_img1 = $row_products['product_img1'];
                       
                       $pro_price = $row_products['product_price'];
                       
                       echo "
                       
                        <div class='col-md-3 col-sm-6 center-responsive'>
                        
                            <div class='product same-height'>
                            
                                <a href='details.php?pro_id=$pro_id'>
                                
                                    <img class='img-responsive' src='admin_area/product_images/$pro_img1'>
                                
                                </a>
                                
                                <div class='text'>
                                
                                    <h3> <a href='details.php?pro_id=$pro_id'> $pro_title </a> 
                                    
                                           <p class='price'> Ksh.$pro_price </p>
                                
                                    </h3>

                                </div>
                            
                            </div>
                        
                        </div>
                       
                       ";
                       
                   }
                
                ?>
               
          </div><!--row same-height-row   Finish -->
    
    
    </div><!--cart col-md-9   Finish -->
    <div class="col-md-3"><!--col-md-3   begin -->
    
          <div id="order-summary" class="box"><!--order-summary box begin  -->
          
             <div class="box-header"><!--box-header  begin -->
                
                 <h1>Order Summary</h1>
             
             </div><!--box-header  Finish -->
             <p class="text-muted"><!--text-muted  begin -->
             
                 Transportation and packing costs are automatically calculated based on the service you have ordered
        
             </p><!--text-muted  Finish -->
             <div class="table-responsive"><!--table-responsive  begin -->
             
                <table class="table"><!--table  begin -->
                
                    <tbody><!--tbody  begin -->
                    
                       <tr>
                       
                          <td>Order All Sub-Total</td>
                          <th>Ksh.<?php echo $total; ?></th>
                       
                       </tr>
                       <tr>
                       
                            <td>Transportation And Packing </td>
                            <th>Ksh.0</th>

                       </tr>
                        <tr>
                       
                            <td>Tax </td>
                            <th>Ksh.0</th>

                       </tr>
                        <tr class="total">
                       
                            <td>Total </td>
                            <th>Ksh.<?php echo $total; ?></th>

                       </tr>
                    
                    </tbody><!--tbody  Finish -->
                
                </table><!--table  Finish -->
             
             </div><!--table-responsive  Finish -->
          
          </div><!--order-summary box  Finish -->
    
    </div><!--col-md-3   Finish -->

    </div><!--container   Finish -->
</div><!--content  Finish -->


 <?php
    
    include("includes/footer.php")
    
 ?>

    <script src="js/jquery-331.min.js"></script>
     <script src="js/bootstrap-337.min.js"></script>
</body>
</html>



<script>
  // Get the table element
  var table = document.getElementById('myTable');

  // Function to print the table
  function printTable() {
    // window.print();
    printPageArea("orderForm");

  }

  // print only a section of a page
  function printPageArea(areaID){
    var printContent = document.getElementById(areaID).innerHTML;
    var originalContent = document.body.innerHTML;
    document.body.innerHTML = printContent;
    var orderOptions = document.getElementById("orderOptions");
    orderOptions.style.display = "none"; // hide order options while printing report
    window.print();
    // orderOptions.style.display = "block"; // show order options back
    document.body.innerHTML = originalContent;
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
