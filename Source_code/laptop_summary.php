

<html>
    <head>
        <title></title>
         <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="main-div">
    <h1 class="text-center text-white bg-dark">List of entries</h1>
    
          <div class="center-div">
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover text-center">
                <thead class="bg-dark text-white">
                    <tr>
                        <th>Advt Id</th>
                        <th>Owner email</th>
                        <th>Model name</th>
                        <th>Manufacturer</th>
                        <th>Purchase year</th>
                        <th>Battery Status</th>
                        <th>Buyer email</th>
                   </tr>
                </thead>
                <tbody>
                <?php

                    $username= "root";
                    $password = "";
                    $server = 'localhost';
                    $db = 'olx';

                    $con = mysqli_connect($server,$username,$password,$db);
                    

                   $selectquery = "select a.advt_id,a.owner_id,b.manufacturer,b.model_name,b.year_of_purchase,b.battery_status,a.buyer_id from advertisement a inner join laptop b on a.advt_id=b.product_id;";

                    $query = mysqli_query($con,$selectquery);

                 

                    while($res = mysqli_fetch_array($query)){
                        
                        ?>
                        <tr>
                        <td><?php echo $res['advt_id'];?></td>
                        <td><?php echo $res['owner_id'];?></td>
                        <td><?php echo $res['model_name'];?></td>
                        <td><?php echo $res['manufacturer'] ?></td>
                        <td><?php echo $res['year_of_purchase'] ?></td>
                        <td><?php echo $res['battery_status'];?></td>
                        <td><?php echo $res['buyer_id'];?></td>
                        
                        </tr>
                    <?php
                    }

                    ?>
                

                </tbody>    
            </table>
        </div>
    </div>
<div>
</body>
</html>