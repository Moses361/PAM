<?php 
    
    if(!isset($_SESSION['admin_email'])){
        
        echo "<script>window.open('login.php','_self')</script>";
        
    }else{

?>

<div class="row"><!-- row 1 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <ol class="breadcrumb"><!-- breadcrumb begin -->
            <li class="active"><!-- active begin -->
                
                <i class="fa fa-dashboard"></i> Dashboard / View Referrals
                
            </li><!-- active finish -->
        </ol><!-- breadcrumb finish -->
    </div><!-- col-lg-12 finish -->
</div><!-- row 1 finish -->

<div class="row"><!-- row 2 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <div class="panel panel-default"><!-- panel panel-default begin -->
            <div class="panel-heading"><!-- panel-heading begin -->
               <h3 class="panel-title"><!-- panel-title begin -->
               
                   <i class="fa fa-tags"></i>  View Referrals
                
               </h3><!-- panel-title finish --> 
            </div><!-- panel-heading finish -->
            
            <div class="panel-body"><!-- panel-body begin -->
                <div class="table-responsive"><!-- table-responsive begin -->
                    <table class="table table-striped table-bordered table-hover"><!-- table table-striped table-bordered table-hover begin -->
                        
                        <thead><!-- thead begin -->
                            <tr><!-- tr begin -->
                                <th> No: </th>
                                <th>Initiator</th>
                                <th>Date</th>
                                <th>Link Code</th>
                                <th>Discount</th>
                                <th>Redeemed</th>
                        </tr><!-- tr finish -->
                        </thead><!-- thead finish -->
                        
                        <tbody><!-- tbody begin -->
                            
                            <?php 
          
                                $i=0;
                                $get_referrals = "SELECT  * FROM referals";
                                $run_referrals = mysqli_query($con, $get_referrals);
          
                                while($data=mysqli_fetch_array($run_referrals)){
                                    $initiator = $data['initiator'];
                                    $date = $data['date'];
                                    $link_code = $data['link_code'];
                                    $discount = $data['discount'];
                                    $redeemed = $data['redeemed'];
                                    $i++;
                            ?>
                            
                            <tr><!-- tr begin -->
                                <td> <?php echo $i; ?> </td>
                                <td> <?php echo $initiator; ?> </td>
                                <td> <?php echo $date; ?></td>
                                <td> <?php echo $link_code; ?></td>
                                <td> <?php echo $discount; ?></td>
                                <td> <?php echo (boolval($redeemed) == true) ? "<span style='color: red;'> Yes</span>" : "<span style='color: green;'> No</span>"; ?> </td>
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