<div id="footer"><!-- footer begin-->
    <div class="container"><!-- container begin-->
        <div class="row"><!-- row begin-->
            <div class="col-sm-6 col-md-3"><!-- col-sm-6 col-md-3 begin-->
                 <h4>Pages</h4>
             <ul><!-- ul begin-->
                 <li><a href="cart.php">Order Cart</a></li>
                 <li><a href="contact.php">Contac Us</a></li>
                 <li><a href="shop.php">Order</a></li>
                 <li><a href="customer/my_account.php">My Account</a></li>
             </ul><!-- ul Finish-->
            <hr>
             <h4>User Section</h4>
               <ul><!-- ul begin-->
                   <?php 
                                       
                        if(!isset($_SESSION['customer_email'])){

                            echo"<a href='checkout.php'>Login</a>";
                            }else{

                                 echo"<a href='customer/my_account.php?my_orders'>MY ACCOUNT</a>";

                            }
                                       
                    ?>
                   <li><a href="customer_register.php">Register</a></li>
                    <li><a href="terms.php">Terms & Conditions</a></li>
               </ul><!-- ul Finish-->
               <hr class="hidden-md hidden-lg hidden-sm">
            </div><!-- col-sm-6 col-md-3 Finish-->
            <div class="com-sm-6 col-md-3"><!-- com-sm-6 col-md-3 begin-->
            
             <h4>Top Services Categories</h4>
                <ul><!-- ul begin-->
                    <?php 
                    
                       $get_p_cats = "select * from product_categories";
                       $run_p_cats = mysqli_query($con,$get_p_cats);

                       while($row_p_cats=mysqli_fetch_array($run_p_cats)){

                          $p_cat_id = $row_p_cats['p_cat_id'];
                          $p_cat_title = $row_p_cats['p_cat_title'];
                          
                            echo"
                            
                             <li>
                             
                                 <a href='shop.php?p_cats=$p_cat_id'>
                                 
                                     $p_cat_title 
                                 
                                 </a>
                             
                             </li>
                            
                            
                            ";
                             

                       }
                    
                    ?>
                </ul><!-- ul Finish-->
             <hr class="hidden-md hidden-lg">

            </div><!-- com-sm-6 col-md-3 Finish-->
            <div class="com-sm-6 col-md-3"><!-- com-sm-6 col-md-3 begin-->
                <h4>Find Us</h4>
                <p><!-- p begin-->
                  <strong>Rocket Delivery.</strong>
                  </br>Nairobi
                  </br>Tel
                  </br>0759930912
                  </br>odhismoses20@gmail.com
                  </br><strong>Mr. Moses</strong>
                  </br>
                </p><!-- p Finish-->

                <a href="contact.php">Check Our Contact Page</a>
                <hr class="hidden-md hidden-lg">
            </div><!-- com-sm-6 col-md-3 Finish-->
            <div class="col-sm-6 col-md-3"></div><!-- col-sm-6 col-md-3 begin-->
             <h4>Get The News</h4>
             <p class="text-muted">
                Dont miss our Latest updated Service
             </p>
             <form action="" method="post"><!-- form begin-->
                 <div class="input-group"><!-- input-group begin-->
                 
                 <input type="text" class="form-control" name="email">
                 <span class="input-group-btn "><!-- span input-group-btn begin-->
                       <input type="submit" value="subscribe" class="btn btn-danger"> 


                 </span><!-- span input-group-btn Finish-->

                 </div><!-- input-group Finish-->
                 
             </form><!-- form Finish-->
             <hr>
             <h4>Keep In Touch</h4>
             <p class="social">
                 <a href="#" class="fa fa-facebook"></a>
                 <a href="#" class="fa fa-twitter"></a>
                 <a href="#" class="fa fa-instagram"></a>
                 <a href="#" class="fa fa-google-plus"></a>
                 <a href="#" class="fa fa-envelope"></a>
             </p>
            </div><!-- col-sm-6 col-md-3 Finish-->
        </div><!-- row Finish-->
    </div><!-- container Finish-->
 </div> <!-- footer Finish-->

<div id="copyright"><!-- copyright begin-->
    <div class="container"><!-- container begin-->
        <div class="col-md-6"><!-- col-md-6 begin-->
            <p class="pull-left">&copy;2023 Rocket Delivery All Rights reserved</p>
        </div><!-- col-md-6 Finish-->
         <div class="col-md-6"><!-- col-md-6 begin-->
            <p class="pull-right"> Designed and Managed by: Odhismoses</p>
        </div><!-- col-md-6 Finish-->
    </div><!-- container Finish-->
</div><!-- copyright Finish-->






