<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Labor Force and Covid-19 Data</h2>
    <div class="container row">
         <h3> Option 1: Labor force data from specified countries </h3>
         <div class="column left">
           <form action="laborforce_1.php" method="post">
             <label for="country">Select country/countries of interest:</label>
             <br>
             <select id="country" name="country" multiple>
             <?php
               $countries = $mysqli->query("SELECT name FROM Country");
               while ($rows = $countries->fetch_assoc()) {
                 $country_name = $rows['name'];
                 echo "<option value='$country_name'>$country_name</option>";
               }
             ?>
         </select>
         <br>
         <br>
             <label for="laborforce_atrributes">Select labor force data:</label>
             <br>
             <select id="laborforce_attributes" name="laborforce_attributes" multiple>
//             Percent
               <option value="laborForceParticipationRate">Labor Force Participation Rate</option>
//             Percent
               <option value="unemploymentRate">Unemployment Rate</option>
//             Percent
               <option value="percentEmplAgriculture">Percentage Employed in Agriculture</option>
//             Percent
               <option value="percentEmplIndustry">Percentage Employed in Industry</option>
//             Percent
               <option value="percentEmplServices">Percentage Employed in Service</option>
               <option value="numConfirmed">Number of Confirmed Cases</option>
               <option value="numDeaths">Number of Deaths</option>
               <option value="numRecovered">Number of Recovered Cases</option>
             </select>
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
       <br>
       <div class="container row">
         <h3> Option 2:</h3>
         <div class="column left">
           <form action="" method="post">
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
       <br>
       <div class="container row">
         <h3> Option 3:</h3>
         <div class="column left">
           <form action="" method="post">
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
</body>

