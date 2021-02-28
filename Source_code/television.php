<?php
  require('inc/config.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Television</title>
	<link rel="stylesheet" type="text/css" href="css/advertise.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
  .color-white{
    color: white;
  }
</style>
<body style="background-color:  #e6fffa;">

	<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home.php">SHOPIFY</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="home.php">HOME</a></li>
        <li><a href="my_products.php">MY PRODUCTS</a></li>
        <li><a href="bought_products.php">BOUGHT PRODUCTS</a></li>
        <li><a href="message.php">MESSAGES</a></li>
        <li><a href="about_us.php">ABOUT US</a></li>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_SESSION['email']; ?><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="">Change Password</a></li>
          <li><a href="logout.php">Logout</a></li>
        </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Top navigation -->
<div class="topnav">

  <!-- Left-aligned links (default) -->
  <a href="laptop.php" >Laptop</a>
  <a href="mobile.php">Mobile</a>
  <a href="audio.php">Speakers</a>
  <a href="books.php">Books</a>
  <a href="bike.php">Bike</a>
  <a href="car.php">Cars</a>
  <a href="camera.php" >Cameras</a>
  <a href="television.php" class="active">Television</a> 

  <!-- Right-aligned links -->
  <div class="topnav-right">
    
  </div>

</div>

	<div class="container">
  <h2 class="color-white"><font color="black">Post an Advertisement</font></h2>
  <form class="form-horizontal" action="television.php" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="product_name" ><font color="black">Product Brand</font></label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="product_name" placeholder="Product Name" name="product_name" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="manufacturer"><font color="black">Manufacturer</font></label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="manufacturer" placeholder="Manufacturer" name="manufacturer" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="model_name"><font color="black">Model Name</font></label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="model_name" placeholder="Model Name" name="model_name" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="yop"><font color="black">Year of Purchase</font></label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="yop" placeholder="Year of Purchase" name="yop" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="yop"><font color="black">Inches</font></label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="inch" placeholder="Inches" name="inch" required>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="description"><font color="black">Ad description</font></label>
      <div class="col-sm-10">          
        <textarea class="form-control" id="description" placeholder="Ad description" name="description"></textarea>  
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 color-white" for="expected_price"><font color="black">Expected Price</font></label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="expected_price" placeholder="Expected Price" name="expected_price" required>
      </div>
    </div>
    <!--<div class="form-group">
      <label class="control-label col-sm-2" for="photos">Photos for your Ad</label>
      <div class="col-sm-10">          
        <input type="file" class="form-control" id="photos" placeholder="Photos for your Ad" name="photos" >
      </div>
    </div>-->
    <!--<div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>-->
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" id="submit" name="submit" class="btn btn-primary"><font color="black">Submit</font></button>
      </div>
    </div>
  </form>
</div>

</body>

<?php
    //$db = mysqli_connect('localhost','root','password','olx_schema');
    $today =  date("Y-m-d");
    $expiry = Date("Y-m-d",strtotime("+10 days"));
    //echo $today." ".$expiry;
    $owner_email = $_SESSION['email'];
    //echo $owner_email;

    /*$date = date("Y-m-d");
    $timestamp = strtotime($date);
    if ($timestamp === FALSE) {
        $timestamp = strtotime(str_replace('/', '-', $date));
     }*/
    //echo $timestamp;
    
    if(isset($_POST['submit'])){
      $productName = mysqli_escape_string($db,$_POST['product_name']);
      $manufacturer = mysqli_escape_string($db,$_POST['manufacturer']);
      $modelName = mysqli_escape_string($db,$_POST['model_name']);
      $yearOfPurchase = mysqli_escape_string($db,$_POST['yop']);
      $inch = mysqli_escape_string($db,$_POST['inch']);
      $description = mysqli_escape_string($db,$_POST['description']);
      $expectedPrice = mysqli_escape_string($db,$_POST['expected_price']);
      $tele = "television";

      $query1 = "INSERT INTO Advertisement (item_name,item_type,date_of_init,date_of_exp,owner_id) VALUES ('$productName','$tele','$today','$expiry','$owner_email')";
      $result1 = mysqli_query($db,$query1);
      if($result1){
            $query2 = "SELECT advt_id FROM Advertisement where item_name = '$productName' and owner_id = '$owner_email'";
            $result2 = mysqli_query($db,$query2);

            $row = mysqli_fetch_assoc($result2);
            $temp =  $row["advt_id"];
            $query3 = "INSERT INTO television (product_id,manufacturer,model_name,year_of_purchase,inches,ad_description,expected_price)
             VALUES ('$temp','$manufacturer','$modelName','$yearOfPurchase','$inch','$description',$expectedPrice)";

            $result3 = mysqli_query($db,$query3);
            if($result3){
                  echo "<script type='text/javascript'>alert('Successfully Advertised')</script>";      
            }
            else{
                  echo "<script type='text/javascript'>alert('Failed! Please try again')</script>";
            } 

      }else{
        echo "<script type='text/javascript'>alert('Failed! Please try again')</script>";
      }
      
    }


?>