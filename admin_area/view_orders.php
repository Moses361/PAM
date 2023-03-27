<?php 
    
    if(!isset($_SESSION['admin_email'])){
        
        echo "<script>window.open('login.php','_self')</script>";
        
    }else{

?>

<div class="row"><!-- row 1 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <ol class="breadcrumb"><!-- breadcrumb begin -->
            <li class="active"><!-- active begin -->
                
                <i class="fa fa-dashboard"></i> Dashboard / View Orders
                
            </li><!-- active finish -->
        </ol><!-- breadcrumb finish -->
    </div><!-- col-lg-12 finish -->
</div><!-- row 1 finish -->

<div class="row"><!-- row 2 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <div class="panel panel-default"><!-- panel panel-default begin -->
            <div class="panel-heading"><!-- panel-heading begin -->
               <h3 class="panel-title"><!-- panel-title begin -->
               
                   <i class="fa fa-tags"></i>  View Orders
                
               </h3><!-- panel-title finish --> 
            </div><!-- panel-heading finish -->
            
            <div class="panel-body"><!-- panel-body begin -->
                <div class="table-responsive"><!-- table-responsive begin -->
                    <table class="table table-striped table-bordered table-hover"><!-- table table-striped table-bordered table-hover begin -->
                        
                        <thead><!-- thead begin -->
                            <tr><!-- tr begin -->
                                <th> No: </th>
                                <th> Customer Email: </th>
                                <th> Invoice No: </th>
                                <!-- <th> Service  Name: </th> -->
                                <!-- <th> Service Qty: </th> -->
                                <th> origin: </th>
                                <th> destination: </th>
                                <th> Total Amount: </th>
                                <th> Status: </th>
                                <th> Date: </th>
                                <th> Delete: </th>
                            </tr><!-- tr finish -->
                        </thead><!-- thead finish -->
                        
                        <tbody><!-- tbody begin -->
                            
                            <?php 
          
                                $i=0;
                            
                                $get_orders = "select * from orders";
                                
                                $run_orders = mysqli_query($con,$get_orders);
          
                                while($row_order=mysqli_fetch_array($run_orders)){
                                    
                                    $customer = $row_order['customer'];
                                    
                                    // $c_id = $row_order['customer_id'];
                                    $order_id = $row_order['id'];
                                    
                                    $invoice_no = $row_order['order_id'];
                                    // $origin       = $row_order['origin'];
                                    // $destination  = $row_order['destination'];
                                    $origin       = $row_order['origin'];
                                    $destination  = $row_order['destination'];
                                    $date = $row_order['order_date'];



                                    
                                    $amount = $row_order['amount'];
                                    
                                    $status = $row_order['payment_status'];
                                    
                                    // $size = $row_order['size'];
                                    
                                    // $order_status = $row_order['order_status'];
                                    
                                    // $get_products = "select * from products where product_id='$product_id'";
                                    
                                    // $run_products = mysqli_query($con,$get_products);
                                    
                                    // $row_products = mysqli_fetch_array($run_products);
                                    
                                    // $product_title = $row_products['product_title'];
                                    
                                    // $get_customer = "select * from customers where customer_id='$c_id'";
                                    
                                    // $run_customer = mysqli_query($con,$get_customer);
                                    
                                    // $row_customer = mysqli_fetch_array($run_customer);
                                    
                                    // $customer_email = $row_customer['customer'];
                                    
                                    // $get_c_order = "select * from customer_orders where order_id='$order_id'";
                                    
                                    // $run_c_order = mysqli_query($con,$get_c_order);
                                    
                                    // $row_c_order = mysqli_fetch_array($run_c_order);
                                    
                                    // $order_date = $row_c_order['order_date'];
                                    
                                    // $order_amount = $row_c_order['due_amount'];
                                    
                                    $i++;
                            
                            ?>
                            
                            <tr><!-- tr begin -->
                                <td> <?php echo $i; ?> </td>
                                <td> <?php echo $customer; ?> </td>
                                <td> <?php echo $invoice_no; ?></td>
                                <td> <?php echo $origin; ?></td>
                                <td> <?php echo $destination; ?></td>

                                <td> <?php echo $amount; ?> </td>
                                <td> <?php echo $status; ?> </td>
                                <td> <?php echo $date; ?> </td>


                              
                                <td> 
                                     
                                     <a href="index.php?delete_order=<?php echo $order_id; ?>">
                                     
                                        <i class="fa fa-trash-o"></i> Delete
                                    
                                     </a> 
                                     
                                </td>
                            </tr><!-- tr finish -->
                            
                            <?php } ?>
                            
                        </tbody><!-- tbody finish -->
                        
                    </table><!-- table table-striped table-bordered table-hover finish -->
                </div><!-- table-responsive finish -->
            </div><!-- panel-body finish -->
            
        </div><!-- panel panel-default finish -->
    </div><!-- col-lg-12 finish -->
</div><!-- row 2 finish -->

<?php } ?>