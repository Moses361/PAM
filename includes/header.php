<?php 

   session_start();
   include("includes/db.php"); 
   include("functions/functions.php");

?>

<?php 

   if(isset($_GET['pro_id'])){

        $product_id = $_GET['pro_id'];
        $get_product = "select * from products where product_id='$product_id'";

        $run_product = mysqli_query($con,$get_product);
        $row_product =  mysqli_fetch_array($run_product);
        $p_cat_id = $row_product['p_cat_id'];
        $pro_title = $row_product['product_title'];
        $pro_price = $row_product['product_price'];
        $pro_desc = $row_product['product_desc'];
        $pro_img1 = $row_product['product_img1'];
        $pro_img2 = $row_product['product_img2'];
        $pro_img3 = $row_product['product_img3'];

        $get_p_cat = "select * from product_categories where p_cat_id='$p_cat_id'";

        $run_p_cat = mysqli_query($con,$get_p_cat );
        $row_p_cat = mysqli_fetch_array($run_p_cat);
        $p_cat_title = $row_p_cat['p_cat_title'];
        

   }

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ROCKET DELIVERY</title>
    <link rel="stylesheet" href="styles/bootstrap-337.min.css">
    <link rel="stylesheet" href="font-awsome/css/font-awesome.min.css">
    <link rel="stylesheet" href="styles/style.css">
    
</head>
<body>
     <div id="top"><!--Top begin -->

         <div class="container"><!--container begin -->
         
             <div class="col-md-6 offer"><!--offer begin -->

                <a href="#" class="btn btn-success btn-sm">
                
                  <?php 
                  
                     if(!isset($_SESSION['customer_email'])){
                       
                       echo "Welcome: Guest";
                       
                   }else{
                       
                       echo "Welcome: " . $_SESSION['customer_email'] . "";
                       
                   }
                  
                  ?>
                
                </a>
                <a href="checkout.php"><?php  items();  ?> Items In Your Order | Total Price: <?php total_price(); ?></a>

             </div><!--offer Finish -->

             <div class="col-md-6"><!--col-md-6 begin -->
                <ul class="menu"><!--menu begin -->
                    <li>
                       <a href="customer_register.php">Register</a>
                    </li>
                    <li>
                        <a href="checkout.php">My Account</a>
                    </li>
                    <li>
                         <a href="cart.php">Go To Order</a>
                    </li>
                    <li>
                          <a href="checkout.php">
                          
                          <?php 
                          
                           if(!isset($_SESSION['customer_email'])){
                       
                                  echo "<a href='checkout.php'>Login</a>";
                       
                         }else{
                       
                             echo " <a href='logout.php'>Log Out</a> ";
                       
                             }
                          
                          ?>
                          
                          </a>
                    </li>
                
                </ul><!--menu Finish -->
             </div><!--col-md-6 Finish -->

         </div> <!--container  Finish -->       

     </div><!--Top Finish -->
     <div id="navbar" class="navbar navbar-default"><!--navbar navbar-default  begin -->
          <div class="container"><!--container begin -->
               <diV class="navbar-header"><!--navbar-header begin -->
               
                  <a href="index.php" class="navbar-brand home"><!--navbar-brand home begin -->
                    <img src="images/logo.png" alt="M-Dev-Store Logo" class="hidden-xs">
                    <img src="images/logo.png" alt="M-Dev-Store Logo Mobile" class="visible-xs">

                  </a><!--navbar-brand home finish -->
                  <button class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                     <span class="sr-only">Toggle Navigation</span>
                     <i class="fa fa-align-justify"></i>  
                  </button>
                  <button class="navbar-toggle" data-toggle="collapse" data-target="#search">
                     <span class="sr-only">Toggle search</span>
                     <i class="fa fa-search"></i>  
                  </button>

                </diV><!--navbar-header  finish -->
                <div class="navbar-collapse collapse" id="navigation"><!--navbar-collapse collapse  begin -->
                      <div class="paddig-nav"><!--p
                      ig-nav  Begin -->
                           <ul class="nav navbar-nav left"><!--nav navbar-nav left  Begin -->
                              <li class="<?php if($active=='HOME') echo"active"; ?>">
                                 <a href="index.php">HOME</a>
                              <li>
                              <li class="<?php if($active=='SHOP') echo"active"; ?>">
                                  <a href="shop.php">ORDER</a>
                              </li>
                              <li class="<?php if($active=='SHOPPING CART') echo"active"; ?>">
                                  <a href="cart.php">ORDER CAT</a>
                              </li>
                         
                              <?php 
                              if(!empty($_SESSION['customer_email'])){
                                ?>
                                     <li class="<?php if($active=='SHOPPING') echo"active"; ?>">
                                  <a href="referals.php">Referals</a>
                              </li>


                            <?php
                              }

                              ?>
                              <li class="<?php if($active=='MY ACCOUNT') echo"active"; ?>">
                                 
                                       <?php 
                                       
                                          if(!isset($_SESSION['customer_email'])){

                                                echo"<a href='checkout.php'>MY ACCOUNT</a>";
                                                // echo"<a href='referals.php'>Referals</a>";
                                          }else{

                                               echo"<a href='customer/my_account.php?my_orders'>MY ACCOUNT</a>";

                                          }
                                       
                                       ?>

                              </li>
                              <li class="<?php if($active=='CONTACT US') echo"active"; ?>">
                                <a href="contact.php">CONTACT US</a> 
                              </li>
                           
                           </ul><!--nav navbar-nav left  finish -->
                       
                      </div><!--paddig-nav  finish -->
                        <a href="cart.php" class="btn navbar-btn btn-primary right"><!--btn navbar-btn btn-primary right Begin -->
                            <i class="fa fa-shoping-cart"></i>
                               <span><?php  items();?> Items In Your Order</span>
                        </a><!--btn navbar-btn btn-primary right Finish -->
                        <div class="navbar-collapse collapse right"><!--navbar-collapse collapse right  Begin -->
                        
                            <button class="btn btn-primary navbar-btn" type="button" data-toggle="collapse" data-target="#search"><!--btn btn-primary navbar-btn  finish -->
                                <span class="sr-only">Toggle Search</span>
                                <i class="fa fa-search"></i>
                            </button><!--btn btn-primary navbar-btn  finish -->
                           

                        </div><!--navbar-collapse collapse right  finish -->
                           <div class="collapse clearfix" id="search"><!--collapse clearfix  Begin -->
                        <form method="get" action="results.php" class="navbar-form">
                        
                            <div class="input group"><!--input group  Begin -->
                             <span class="input-group btn">
                                <input type="text" class="form control" placeholder="search" name="user-query" required>
                                 
                                 <button type="submit" name="search" class="btn btn-primary">
                                   <i class="fa fa-search"></i>
                                   
                                 </button> 
                             </span>   
                            </div><!--input group  finish -->

                        </form>
                     
                     </div><!--collapse clearfix  finish --> 
                
                </div><!--navbar-collapse collapse  finish -->
                    
          </div><!--container Finish -->

     </div><!--navbar navbar-default  Finish -->


    
