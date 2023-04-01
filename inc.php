<?php 
     $active='SHOPPING CART';
    include("includes/header.php");


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
    
       <div class="box"><!--box   begin-->
       
           <form action="cart.php" method="post" enctype="multipart/form-data"><!--form   begin -->
           
               <h1>Referals </h1>

                <?php 
                
                  $ip_add = getRealIpUser();
                  $intiator = $_SESSION['customer_email'];
                  $select_cart = "select * from referals where initiator ='$intiator'";
                  $run_cart = mysqli_query($con,$select_cart );
                  $count = mysqli_num_rows($run_cart);
                
               ?>

               <p class="text-muted">You Currently Have <?php echo $count?> referals</p>
               <div class="table-responsive"><!--table-responsive   begin -->
               
                <table class="table"><!--table   begin -->
                 
                    <thead>
                       <tr><!--tr   begin -->
                       
                           <th>date</th>
                           <th>initiator</th>
                           <th>link code</th>
                           <th>discount</th>
                           <!-- <th>status</th> -->
                       
                       </tr><!--tr   finish -->
                    
                    </thead>
                    <tbody><!--tbody  begin -->
                       <?php 
                       
                          $total = 0;
                          $con = mysqli_connect ("localhost","root","","pam");
                         

                             $intiator = $_SESSION['customer_email'];
                            // $intiator1 = "odhismose20@gmail.com";
                             //$get_products = "SELECT  * FROM referals WHERE ID ='$intiator';";
                             
                            
                             $get_products = "SELECT  * FROM referals WHERE initiator   = ' $intiator';";
                             $run_products = mysqli_query($con,$get_products);

                            //  print($intiator1);
                             print_r($run_products);
                             die();

                             
                             while($test = mysqli_fetch_array($run_products)){
                                // $row_order=mysqli_fetch_array($run_orders)
                                // print($date);
                                //  $product_title = $row_products['date'];
                                //  $intiator2 = $row_products['initiator'];
                                //  $link_code = $row_products['link_code'];
                                //  $discount = $row_products['discount'];

                                print("hello");

        
                      ?>
                    
                      
                       <?php 
                       
                             }
                          
                       
                       ?>
                    
                    </tbody><!--tbody   Finish -->
                     
                     
                    <tfoot><!--tfoot   begin -->
                      <tr>
                        <!-- <th colspan="5">Total</th>
                        
                      </tr>
                      
                
                </table><!--table   Finish -->

               </div><!--table-responsive   Finish -->
               <div class="box-footer"><!--box-footer  begin -->
               
                  <div class="pull-left"><!--pull-left begin -->
                  

                  </div><!--pull-left Finish -->
                 <div class="pull-right"><!--pull-left begin -->
                  
                    

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
               
               echo
               
                  @$up_cart = update_cart(); 
               
               ;            
            ?>


    
    </div><!--cart col-md-9   Finish -->


    </div><!--container   Finish -->
</div><!--content  Finish -->


 <?php
    
    include("includes/footer.php")
    
 ?>

    <script src="js/jquery-331.min.js"></script>
     <script src="js/bootstrap-337.min.js"></script>
</body>
</html>