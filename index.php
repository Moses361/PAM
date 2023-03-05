<?php 
    $active='HOME';
   include("includes/header.php");

?>


 <div class="container" id="slider"><!-- container Begin -->
       
       <div class="col-md-12"><!-- col-md-12 Begin -->
           
           <div class="carousel slide" id="myCarousel" data-ride="carousel"><!-- carousel slide Begin -->
               
               <ol class="carousel-indicators"><!-- carousel-indicators Begin -->
                   
                   <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
                   <li data-target="#myCarousel" data-slide-to="1"></li>
                   <li data-target="#myCarousel" data-slide-to="2"></li>
                   <li data-target="#myCarousel" data-slide-to="3"></li>
                   
               </ol><!-- carousel-indicators Finish -->
               
               <div class="carousel-inner"><!-- carousel-inner Begin -->
                  
                  <?php 
                  
                    $get_slides = "select * from slider LIMIT 0,1 ";
                    $run_slides = mysqli_query($con, $get_slides);
                     while($row_slides=mysqli_fetch_array($run_slides)){

                        $slide_name = $row_slides["slide_name"];
                        $slide_image = $row_slides["slide_image"];
        
                         echo "
                           
                           <div class=' item active'>
                           
                              <img src='admin_area/slides_images/$slide_image' >

                           </div>
                         
                         ";

                     }
                    $get_slides = "select * from slider LIMIT 1,3 ";
                    $run_slides = mysqli_query($con, $get_slides);
                     while($row_slides=mysqli_fetch_array($run_slides)){

                        $slide_name = $row_slides["slide_name"];
                        $slide_image = $row_slides["slide_image"];
        
                         echo "
                           
                           <div class='item'>
                           
                              <img src='admin_area/slides_images/$slide_image' >

                           </div>
                         
                         ";

                     }
                  
                  ?>

               </div><!-- carousel-inner Finish -->
               
               <a href="#myCarousel" class="left carousel-control" data-slide="prev"><!-- left carousel-control Begin -->
                   
                   <span class="glyphicon glyphicon-chevron-left"></span>
                   <span class="sr-only">Previous</span>
                   
               </a><!-- left carousel-control Finish -->
               
               <a href="#myCarousel" class="right carousel-control" data-slide="next"><!-- left carousel-control Begin -->
                   
                   <span class="glyphicon glyphicon-chevron-right"></span>
                   <span class="sr-only">Next</span>
                   
               </a><!-- left carousel-control Finish -->
               
           </div><!-- carousel slide Finish -->
           
       </div><!-- col-md-12 Finish -->

</div><!--container  Finish -->
<div id="advantages"><!--advantages begin-->
     <div class="container"><!--container  begin -->
        <div class="same-height-row"><!--same-height-row  begin -->
           <div class="col-sm-4"><!--col-sm-4  begin --> 
               <div class="box same-height"><!--box same-height  begin -->
                  <div class="icon"><!--icon begin -->
                     <i class="fa fa-heart"></i>
                  </div><!--icon  Finish -->
                   <h3><a href="#">We Love Our Customers</a></h3>
                   <p>We pride ourselves on putting our customers first and providing personalized and attentive service to ensure their satisfaction. </p>
               </div><!--box same-height  Finish -->
           </div> <!--col-sm-4  Finish -->
           <div class="col-sm-4"><!--col-sm-4  begin --> 
               <div class="box same-height"><!--box same-height  begin -->
                  <div class="icon"><!--icon begin -->
                     <i class="fa fa-tag"></i>
                  </div><!--icon  Finish -->
                   <h3><a href="#">We Have The Best Prices</a></h3>
                   <p>Prices are typically provided through a customized quote based on your specific needs and preferences. </p>
               </div><!--box same-height  Finish -->
           </div> <!--col-sm-4  Finish -->
           <div class="col-sm-4"><!--col-sm-4  begin --> 
               <div class="box same-height"><!--box same-height  begin -->
                  <div class="icon"><!--icon begin -->
                     <i class="fa fa-thumbs-up"></i>
                  </div><!--icon  Finish -->
                   <h3><a href="#">100% Proffesional Services</a></h3>
                   <p>We provide relocation services such as packing, transportation, and storage for smooth and stress-free move for individuals and businesses. </p>
               </div><!--box same-height  Finish -->
           </div> <!--col-sm-4  Finish -->
             
        </div><!--same-height-row  Finish -->
     </div><!--container  Finish -->
</div><!--advantages  Finish -->
 <div id="hot"><!--hot  begin -->

     <div class="box"><!--box begin -->
           
           <div class="container"><!--container begin -->

                <div class="col-md-12"><!--col-md-12  begin -->
                     <h2>
                         Our Latest Services
                     </h2>

                </div><!--col-md-12  Finish -->

           </div><!--container  Finish -->

     </div><!--box  Finish -->

 </div><!--hot  Finish -->

    <div id="content" class="container"><!--container begin -->

         <div class="row"><!--row  begin -->
             <?php 
             
                getPro();
             
             ?>
            
         </div><!--row  Finish -->

   </div><!--row  container -->
    

    <?php
    
    include("includes/footer.php")
    
    ?>

    <script src="js/jquery-331.min.js"></script>
     <script src="js/bootstrap-337.min.js"></script>
</body>
</html>